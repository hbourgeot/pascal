<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ExpandMore, ExpandLess } from "@steeze-ui/material-design-icons";
  import type { PageData } from "./$types";

  import type { SuperUsuario } from "../../../../app";

  export let data: PageData;

  let superUsuario: SuperUsuario = data.superUsuario;

  let panel = false;
  let clicked = 0;
</script>

<svelte:head>
  <title>Super usuario | IUTEPAS</title>
</svelte:head>
<div
  class="flex flex-center flex-col w-full max-h-auto gap-6 bg-gray-100"
  style="min-height: calc(100vh + 10rem);"
>
  <h1 class="w-[90%] text-2xl font-bold text-center capitalize">
    ¡Bienvenid@, {superUsuario.nombre}!
  </h1>
  <div
    class="w-[98%] flex flex-col items-center gap-10 bg-white rounded-lg"
    style="min-height: calc(100vh); max-height: auto; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;"
  >
    <div class="w-full mt-5 flex flex-wrap gap-5 flex-center">
      <a
        href="/superusuario/editar_cde"
        class="flex btn variant-filled justify-center items-center h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Editar CDE</a
      >
      <a
        href="/superusuario/editar_coordinador"
        class="flex w-full justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Editar coordinadores</a
      >
      <a
        href="/superusuario/registrar_coordinador"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Agregar coordinadores</a
      >
      <a
        href="/superusuario/registrar_cde"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Agregar CDE</a
      >
      <a
        href="/superusuario/movimientos"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Movimientos</a
      >
      <a
        href="/superusuario/carreras"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Carreras</a
      >
    </div>

    <div class="w-11/12 lg:w-10/12">
      <h2 class="text-center text-[18px] font-bold mb-4">
        Información general
      </h2>

      <details
        open
        class="flex w-2/5 mx-auto flex-col items-center justify-center"
      >
        <summary
          class=" flex w-full h-[40px] items-center gap-4 pl-4 rounded border border-gray-200"
        >
          <span class="expand">
            <Icon src={ExpandMore} class="icon " />
          </span>
          <span class="expanded">
            <Icon src={ExpandLess} class="icon " />
          </span>

          Información del super usuario
        </summary>
        <div
          class="w-full mt-6 h-auto flex flex-wrap flex-col gap-6 [&>span]:w-full [&>span]:flex [&>span]:justify-between [&>span]:border-b [&>span]:border-gray-200"
        >
          <span>
            <h2>Cédula:</h2>
            <p>{superUsuario.cedula}</p>
          </span>
          <span>
            <h2>Nombre completo:</h2>
            <p class="capitalize">{superUsuario.nombre}</p>
          </span>
          <span>
            <h2>Correo:</h2>
            <p>{superUsuario.correo}</p>
          </span>
        </div>
      </details>
    </div>
  </div>
</div>

<style class="scss" scoped>
  span h2 {
    font-weight: 600;
    padding-left: 16px;
  }

  details .expanded {
    display: none;
  }

  details[open] .expanded {
    display: flex;
  }

  details[open] .expand {
    display: none;
  }

  details summary::-webkit-details-marker {
    display: none;
    width: 0;
  }
</style>
