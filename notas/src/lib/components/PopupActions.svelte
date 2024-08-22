<script lang="ts">
  import {
    arrow,
    autoUpdate,
    computePosition,
    flip,
    offset,
    shift,
  } from "@floating-ui/dom";
  import type {
    ModalComponent,
    ModalSettings,
    PopupSettings,
  } from "@skeletonlabs/skeleton";
  import { popup, Modal, storePopup, modalStore } from "@skeletonlabs/skeleton";
  import { Lock, Logout, MoreVert } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import ModalFormPassword from "./ModalFormPassword.svelte";
  import { triggerToast } from "$lib/utils/toast";
  import { enhance } from "$app/forms";

  storePopup.set({ computePosition, autoUpdate, offset, shift, flip, arrow });

  const popupClick: PopupSettings = {
    event: "click",
    target: "popupClick",
    placement: "top",
  };

  export let modulo: string;
  export let nombre: string;

  let endpoint = "";
  let current_password = "";
  let new_password = "";
  let form: HTMLFormElement;

  switch (modulo.toLowerCase()) {
    case "docentes":
      endpoint = "docente";
      break;
    case "estudiantes":
      endpoint = "students";
      break;
    case "coordinadores":
      endpoint = "coordinacion";
      break;
    case "control_estudios":
      endpoint = "control";
      break;
    case "superusuario":
      endpoint = "superUsuario";
      break;
  }

  const modalComponentRegistry: Record<string, ModalComponent> = {
    // Custom Modal 1
    modalForm: {
      // Pass a reference to your custom component
      ref: ModalFormPassword,
      props: { endpoint },
    },
  };

  const handleModal = async () => {
    new Promise<boolean>((resolve) => {
      const modal: ModalSettings = {
        type: "component",
        // Pass the component registry key as a string:
        component: "modalForm",
        title: `Cambiar contraseña`,
        body: `Por favor, ingrese su contraseña actual y la nueva contraseña.`,
        buttonTextCancel: "Cancelar",
        buttonTextSubmit: "Enviar",
        response: (r) => {
          if (r) {
            console.log("Modal response:", r);

            current_password = r.clave;
            new_password = r.nueva_clave;
            form.requestSubmit();
          }
        },
      };
      modalStore.trigger(modal);
    });
  };

  const handleSubmit: any = ({ formData }: any) => {
    formData.append("endpoint", endpoint);
    formData.append("current_password", current_password);
    formData.append("new_password", new_password);
    return async ({update}: any) => {
      await update();
      triggerToast("Contraseña actualizada con éxito");
      modalStore.close();
    }
  };
</script>

<section class="w-fit h-fit py-1 px-4">
  <button type="button" use:popup="{popupClick}" id="popupClick" class="btn px-0">
    <Icon class="w-8 h-8" src="{MoreVert}" />
  </button>
  <div
    class="card p-4 bg-surface-100 w-2/3 md:w-1/2 lg:w-1/4"
    data-popup="popupClick"
  >
    <form
      method="post"
      action="{`/${modulo}/logout?nombre=${nombre}`}"
      class="w-full flex"
    >
      <button
        type="submit"
        class="hover:variant-filled-surface px-3 py-1 w-full rounded-2xl h-[50px] text-light-50 flex gap-x-2 items-center justify-between"
      >
        Cerrar sesión
        <Icon class="w-8 h-8" src="{Logout}" />
      </button>
    </form>
    <button
      type="button"
      class="hover:variant-filled-surface px-3 py-1 w-full rounded-2xl h-[50px] text-light-50 flex gap-x-2 items-center justify-between"
      on:click="{handleModal}"
    >
      Cambiar contraseña
      <Icon class="w-8 h-8" src="{Lock}" />
    </button>
  </div>
  <Modal components="{modalComponentRegistry}" />
  <form method="post" use:enhance={handleSubmit} class="hidden" bind:this="{form}" action="?/changePassword">
    </form>
</section>
