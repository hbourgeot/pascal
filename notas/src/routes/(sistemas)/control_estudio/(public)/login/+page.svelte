<script lang="ts">
  import { ChevronLeft, Lock, User } from "@steeze-ui/tabler-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import Pascal from "$lib/images/pascalConFondo.png";
  import { enhance } from "$app/forms";
  import { page } from "$app/stores";
  import type { ActionData } from "./$types";
  import {
    toastStore,
    type ToastSettings,
    Toast,
  } from "@skeletonlabs/skeleton";

  export let form: ActionData;

  $: if (form?.message) {
    const t: ToastSettings = {
      message: form?.message,
    };

    toastStore.trigger(t);
  }
  let y: number;
  let isExpirated = $page.url.searchParams.get("exp") ? true : false;

  if (isExpirated) {
    const t: ToastSettings = {
      message: "Sesión caducada",
    };

    toastStore.trigger(t);
  }
</script>

<svelte:head>
  <title>Inicio de Sesión | Control de estudio | IUTEPAS</title>
</svelte:head>
<svelte:window bind:innerHeight={y} />
<a href="/seleccione" class="btn variant-ghost-primary absolute top-3 left-3"
  ><Icon src={ChevronLeft} class="h-5 w-5 mr-1" /> Volver al inicio</a
>
<section
  class="w-full h-screen flex flex-col justify-center items-center mb-15 xl:mb-0"
>
  <form
    use:enhance
    method="post"
    class="max-w-[485px] flex flex-col justify-center items-center gap-5 login xl:h-[fit-content] xl:mt-0 w-3/4"
  >
    <img src={Pascal} alt="Instituto Pascal" class="w-1/2" />
    <h1
      class="text-3xl mb-8 font-bold flex justify-center text-center items-center gap"
    >
      Bienvenido Personal de control de estudio
    </h1>
    {#if form?.message || isExpirated}
      <Toast position="t" />
    {/if}
    <label
      for="username"
      class="text-xl flex justify-end items-center border-1 rounded-lg w-full"
    >
      <Icon src={User} class="h-14 w-14 p-1 border-r-1" />
      <input
        type="text"
        name="username"
        id="username"
        placeholder="Usuario"
        class="w-full border-0 outline-none bg-transparent rounded-lg text-xl"
      />
    </label>
    <label
      for="password"
      class="text-xl flex justify-end items-center
		 border-1 rounded-lg w-full"
    >
      <Icon src={Lock} class="h-14 w-14 p-1 border-r-1" />
      <input
        type="password"
        name="password"
        id="password"
        placeholder="Contraseña"
        class="w-full border-0 outline-none bg-transparent rounded-lg text-xl"
      />
    </label>
    <button
      type="submit"
      class="w-full bg-blue-500 p-4 rounded-lg text-light-100
			text-xl">Iniciar sesion</button
    >
  </form>
</section>

<style lang="scss">
  :root {
    --borders: rgba(0, 0, 0, 0.2);
  }

  label {
    border: 1px solid var(--borders);
  }
  .login {
    background-color: white;
    padding: 50px;
    border-radius: 15px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
      rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
  }
</style>
