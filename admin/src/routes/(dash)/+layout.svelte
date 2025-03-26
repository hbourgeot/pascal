<script lang="ts">
  import { page } from "$app/stores";
  import pascalConFondo from "$lib/images/pascal-fondo.png";

  import { AppBar, Modal } from "@skeletonlabs/skeleton";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ChevronRight, Logout } from "@steeze-ui/tabler-icons";
  import {Toast} from "@skeletonlabs/skeleton";
  import type { LayoutData } from "./$types";
  
  export let data: LayoutData;
</script>

<AppBar
  gridColumns="grid-cols-3"
  slotDefault="place-self-center"
  slotTrail="place-content-end"
  class="w-full sticky !mt-0 top-0 z-999 !py-2 !px-4"
>
  <svelte:fragment slot="lead">
    <ol class="breadcrumb">
      {#if !$page.url.pathname.includes("inicio")}
      <li class="crumb">
        <a href="/inicio" class="no-underline text-[#0879bd]">Inicio</a>
      </li>
      <li class="crumb-separator" aria-hidden>
        <Icon src="{ChevronRight}" class="w-5 h-5" />
      </li>
      {/if}
      {#each $page.url.pathname.split("/") as segment, i}
        {#if segment && !/\d/.test(segment)}
          {#if i === $page.url.pathname.split("/").length - 1}
            <!-- Es último segmento, lo mostramos como texto -->
            <li class="crumb">
              {segment.charAt(0).toUpperCase() +
                segment.slice(1).replace("-", " ")}
            </li>
          {:else}
            <!-- No es último segmento, lo mostramos como un enlace -->
            <li class="crumb">
              <a
                class="no-underline text-[#0879bd]"
                rel="prefetch"
                href="{$page.url.pathname
                  .split('/')
                  .slice(0, i + 1)
                  .join('/')}"
              >
                {segment.charAt(0).toUpperCase() + segment.slice(1)}
              </a>
            </li>
            <li class="crumb-separator" aria-hidden>
              <Icon src="{ChevronRight}" class="w-5 h-5" />
            </li>
          {/if}
        {/if}
      {/each}
    </ol>
  </svelte:fragment>
  <p class="text-2xl">Hola, {data.user.nombre ?? "Administrador"}</p>
  <svelte:fragment slot="trail">
    <a href="/logout">
      <button
        type="submit"
        class="btn variant-filled-primary bg-pink-600 px-3 py-1 rounded-xl ml-4 h-[50px] text-light-50 flex gap-x-3 self-center"
        ><Icon src={Logout} class="h-5 w-5"/> Salir</button
      >
    </a>
  </svelte:fragment>
</AppBar>
<main class="w-full relative">
  <slot />
</main>
<Toast position="t" rounded="rounded-lg" color="text-white" buttonDismiss="btn-icon btn-icon-sm variant-ghost" />
<Modal buttonPositive="variant-filled-primary" buttonNeutral="variant-soft-secondary"/>
<style>
  main{
    min-height: calc(100vh - 65px);
    background-image: url("$lib/images/layered-waves-haikei.svg");
    background-position: center;
    overflow-y: auto;
    background-size: cover;
  }
</style>