<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ExpandMore, ExpandLess } from "@steeze-ui/material-design-icons";
  import type { PageData } from "./$types";

  import type { ControlEstudio } from "../../../../app";

  export let data: PageData;

  let controlEstudio: ControlEstudio = data.controlEstudio;
</script>

<svelte:head>
  <title>Control de estudio | IUTEPAS</title>
</svelte:head>
<div class="flex flex-center h-screen flex-col w-full max-h-auto gap-6">
  <h1 class="w-[90%] text-2xl font-bold text-center capitalize">
    ¡Bienvenid@, {controlEstudio.nombre}!
  </h1>
  <div
    class="w-[98%] lg:w-1/2 flex p-8 flex-col items-center gap-10 bg-white rounded-lg"
    style="max-height: auto; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;"
  >
    <div
      class="w-full h-auto mt-5 flex flex-wrap gap-5 flex-center
            "
    >
      <a
        href="/control_estudio/materias"
        class="flex lg:w-[30%] justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Ver Materias</a
      ><a
        href="/control_estudio/peticiones"
        class="flex lg:w-[30%] justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Ver Peticiones</a
      >
      <a
        href="/control_estudio/estudiantes"
        class="flex lg:w-[30%] justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Ver Estudiantes</a
      >
    </div>

    <div class="w-11/12 lg:w-10/12">
      <h2 class="text-center text-[18px] font-bold mb-4">
        Informacion general
      </h2>

      <details
        open
        class="flex w-full mx-auto flex-col items-center justify-center"
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

          Informacion del personal
        </summary>
        <div
          class="w-full mt-6 h-auto flex flex-wrap flex-col gap-6 [&>span]:w-full [&>span]:flex [&>span]:justify-between [&>span]:border-b [&>span]:border-gray-200"
        >
          <span>
            <h2>Cedula:</h2>
            <p>{controlEstudio.cedula}</p>
          </span>
          <span>
            <h2>Nombre completo:</h2>
            <p class="capitalize">{controlEstudio.nombre}</p>
          </span>
          <span>
            <h2>Teléfono:</h2>
            <p>{controlEstudio.telefono}</p>
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
