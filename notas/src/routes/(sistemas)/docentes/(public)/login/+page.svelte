<script lang="ts">
  import { ChevronLeft, Lock, User } from "@steeze-ui/tabler-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import Pascal from "$lib/images/pascalConFondo.png";
  import { enhance } from "$app/forms";
  import { page } from "$app/stores";
  import { Toast, toastStore } from "@skeletonlabs/skeleton";
  import type { ToastSettings } from "@skeletonlabs/skeleton";
  import type { ActionData } from "./$types";

  export let form: ActionData;

  let y: number;

  $: if (form?.message) {
    const t: ToastSettings = {
      message: form?.message,
    };

    toastStore.trigger(t);
  }
  let isExpirated = $page.url.searchParams.get("exp") ? true : false;

  if (isExpirated) {
    const t: ToastSettings = {
      message: "Sesión caducada",
    };

    toastStore.trigger(t);
  }
</script>

<svelte:head>
  <title>Inicio de Sesión | Docentes | IUTEPAS</title>
</svelte:head>
<svelte:window bind:innerHeight={y} />
<a href="/" class="btn variant-ghost-primary absolute top-3 left-3"
  ><Icon src={ChevronLeft} class="h-5 w-5 mr-1" /> Volver al inicio</a
>
<section
  class="w-full h-screen flex flex-col justify-center items-center mb-15 xl:mb-0"
>
  <form
    use:enhance
    method="post"
    class="max-w-[500px] flex flex-col justify-center items-center gap-5 login xl:h-[fit-content] xl:mt-0 w-3/4"
  >
    <img src={Pascal} alt="Instituto Pascal" class="w-1/2" />
    <h1 class="text-3xl mb-8 font-bold flex justify-center items-center gap">
      Bienvenido Docente
    </h1>
    {#if form?.message || isExpirated}
      <Toast position="t" />
    {/if}
    <label
      for="username"
      class="text-xl flex justify-end items-center w-full max-w-[340px] border-1 rounded-lg"
    >
      <Icon src={User} class="h-14 w-14 p-1 border-r-1" />
      <input
        type="text"
        name="username"
        id="username"
        placeholder="Usuario"
        class="w-full border-0 outline-none bg-transparent rounded-lg text-[16px]"
      />
    </label>
    <label
      for="password"
      class="text-xl flex justify-end items-center
		 border-1 rounded-lg w-full max-w-[340px]"
    >
      <Icon src={Lock} class="h-14 w-14 p-1 border-r-1" />
      <input
        type="password"
        name="password"
        id="password"
        placeholder="Contraseña"
        class="w-full border-0 outline-none bg-transparent rounded-lg text-[16px]"
      />
    </label>
    <button
      type="submit"
      class="w-full max-w-[340px] bg-blue-500 p-4 rounded-lg mb-6 text-white
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
    padding: 10px;
    border-radius: 15px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
      rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
  }
</style>
