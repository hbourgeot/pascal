<script lang="ts">
  import { Lock, User } from "@steeze-ui/tabler-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import Pascal from "$lib/images/pascalConFondo.png";
  import type { ActionData } from "./$types";
  import { enhance } from "$app/forms";
  import { triggerToast } from "$lib/utils/toast";

  export let form: ActionData;
  $: if (form?.message) {
    triggerToast(form.message, 3000);
  }

  let y: number;
</script>

<svelte:head>
  <title>Inicio de Sesion</title>
</svelte:head>
<svelte:window bind:innerHeight="{y}" />
<section
  class="w-full h-screen xl:w-1/2 flex flex-col justify-center items-center mb-15 xl:mb-0"
>
  <form
    use:enhance
    method="post"
    class="max-w-[485px] w-5/12 flex flex-col justify-center items-center gap-5 login xl:h-[fit-content] xl:mt-0"
  >
    <img src="{Pascal}" alt="Instituto Pascal" class="w-1/2" />
    <h1 class="text-3xl mb-8 font-bold flex justify-center items-center gap">
      Bienvenido
    </h1>
    <label
      for="username"
      class="text-xl flex justify-end items-center border-1 rounded-lg"
    >
      <Icon src="{User}" class="h-14 w-14 p-1 border-r-1" />
      <input
        type="text"
        name="username"
        id="username"
        placeholder="Usuario"
        class="w-full border-0 outline-0 bg-transparent rounded-tr-lg rounded-br-lg text-xl"
      />
    </label>
    <label
      for="password"
      class="text-xl flex justify-end items-center
		 border-1 rounded-lg"
    >
      <Icon src="{Lock}" class="h-14 w-14 p-1 border-r-1" />
      <input
        type="password"
        name="password"
        id="password"
        placeholder="Contraseña"
        class="w-full border-0 outline-0 bg-transparent rounded-tr-lg rounded-br-lg text-xl"
      />
    </label>
    <button
      type="submit"
      class="w-full bg-purple-700 text-white p-4 rounded-lg text-light-100 btn variant-filled
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
