<script lang="ts">
  import { page } from "$app/stores";
  import Logo from "$lib/images/logo.jpg";
  import { Toast, AppBar } from "@skeletonlabs/skeleton";
  import { ChevronRight, Logout } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { LayoutData } from "./$types";

  export let data: LayoutData;
</script>

<Toast position="t" zIndex="z-[999]" />
<AppBar
  gridColumns="grid-cols-3"
  slotDefault="place-self-center"
  slotTrail="place-content-end"
  class="w-full h-[80px] sticky top-0"
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
    <form
      method="post"
      action={`/control_estudio/logout?nombre=${data.nombre}`}
    >
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

<style>
  .crumb-separator:last-of-type {
    display: none;
  }
</style>
