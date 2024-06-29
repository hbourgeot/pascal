<script lang="ts">
  import { page } from "$app/stores";
  import ModalForm from "$lib/components/ModalFormNotas.svelte";
  import Logo from "$lib/images/logo.jpg";
  import {
    AppBar,
    Modal,
    Toast,
    modalStore,
    type ModalComponent,
    type ModalSettings,
  } from "@skeletonlabs/skeleton";
  import { ChevronRight, Logout } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { LayoutData } from "./$types";

  export let data: LayoutData;

  $: if (data.peticion && data.aprobado !== false) {
    handleModal();
  } else if (data.peticion && data.aprobado === false) {
    handleSecondModal();
  }

  let cedulaEstudiante = data.peticion?.id_estudiante ?? "";
  let materia = data.peticion?.id_materia ?? "";
  let nombreCampo = data.peticion?.campo ?? "";
  let idPeticion = data.peticion?.id ?? "";

  const modalComponentRegistry: Record<string, ModalComponent> = {
    // Custom Modal 1
    modalForm: {
      // Pass a reference to your custom component
      ref: ModalForm,
      props: { cedulaEstudiante, materia, nombreCampo, idPeticion },
    },
  };
  function capitalizeWords(str: string) {
    return str
      .split(" ")
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
      .join(" ");
  }

  const handleModal = async () => {
    const modal: ModalSettings = {
      type: "component",
      // Pass the component registry key as a string:
      component: "modalForm",
      title: `¡Oye ${capitalizeWords(data.nombre)}!`,
      body: `Tu petición #${data.peticion?.id} ha sido aprobada`,
      buttonTextCancel: "Cancelar",
      buttonTextSubmit: "Enviar",
    };
    modalStore.trigger(modal);
  };

  const handleSecondModal = async () => {
    await new Promise<Boolean>((resolve) => {
      const modal: ModalSettings = {
        type: "confirm",
        title: `Petición negada`,
        body: `Tu petición #${data.peticion?.id} para cambiar la nota del estudiante ${data.peticion?.id_estudiante} en la materia ${data.peticion?.id_materia} fue denegada, comunícate con el personal de control de estudios para saber el motivo.`,
        buttonTextConfirm: "OK",
        buttonTextCancel: "Cerrar",
        response: (r: boolean) => {
          resolve(r);
        },
      };
      modalStore.trigger(modal);
    });
    const form = new FormData();
    form.append("peticion", data.peticion!.id.toString());
    await fetch("/api/notas/denegada", {
      method: "POST",
      body: form,
    });
  };
</script>

<Toast position="t" />
<AppBar
  gridColumns="grid-cols-3"
  slotDefault="place-self-center"
  slotTrail="place-content-end"
  class="w-full h-[80px] sticky top-0 z-40"
>
  <svelte:fragment slot="lead">
    <ol class="breadcrumb lg:text-xl">
      {#each $page.url.pathname.split("/") as segment, i}
        {#if segment && !/\d/.test(segment)}
          {#if i === $page.url.pathname.split("/").length - 1}
            <!-- Es último segmento, lo mostramos como texto -->
            <li class="crumb">
              {#if segment.includes("_")}
                {segment.charAt(0).toUpperCase() +
                  segment.slice(1).replace("_", " de ")}
              {:else}
                {segment.charAt(0).toUpperCase() + segment.slice(1)}
              {/if}
            </li>
          {:else}
            <!-- No es último segmento, lo mostramos como un enlace -->
            <li class="crumb">
              <a
                class="no-underline text-[#0879bd] font-bold"
                rel="prefetch"
                href={$page.url.pathname
                  .split("/")
                  .slice(0, i + 1)
                  .join("/")}
              >
                {#if segment.includes("_")}
                  {segment.charAt(0).toUpperCase() +
                    segment.slice(1).replace("_", " de ")}
                {:else}
                  {segment.charAt(0).toUpperCase() + segment.slice(1)}
                {/if}
              </a>
            </li>
            <li class="crumb-separator" aria-hidden>
              <Icon src={ChevronRight} class="w-5 h-5" />
            </li>
          {/if}
        {/if}
      {/each}
    </ol>
  </svelte:fragment>
  <a href="/" class="h-full flex flex-center">
    <img src={Logo} alt="" class="logo" />
  </a>
  <svelte:fragment slot="trail">
    <form method="post" action={`/docentes/logout?nombre=${data.nombre}`}>
      <button
        type="submit"
        class="bg-pink-600 text-gray-200 px-3 py-1 rounded-2xl ml-4 h-[50px] text-light-50"
      >
        <Icon class="w-8 h-8" src={Logout} />
      </button>
    </form>
  </svelte:fragment>
</AppBar>
<slot />
{#if data.peticion?.estado === "Aprobado"}
  <Modal components={modalComponentRegistry} />
{/if}

<style>
  .crumb-separator:last-of-type {
    display: none;
  }
</style>
