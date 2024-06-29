<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ExpandMore, ExpandLess } from "@steeze-ui/material-design-icons";
  import type { PageData } from "./$types";

  import type { Coordinacion } from "../../../../app";

  export let data: PageData;

  let coordinador: Coordinacion = data.coordinador;

  let panel = false;
  let clicked = 0;
</script>

<svelte:head>
  <title>Coordinadores | IUTEPAS</title>
</svelte:head>
<div
  class="flex flex-center flex-col w-full max-h-auto gap-6"
  style="min-height: 91vh;"
>
  <h1 class="w-[90%] text-2xl font-bold text-center capitalize">
    ¡Bienvenid@, {coordinador.nombre}!
  </h1>
  <div
    class="w-[70%] flex flex-col items-center gap-10 p-8 bg-white rounded-lg"
    style=" max-height: auto; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;"
  >
    <div class="w-full mt-5 flex flex-wrap gap-5 flex-center">
      <a
        href="/coordinadores/configuracion"
        class="flex btn variant-filled justify-center items-center h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Configuración</a
      ><a
        href="/coordinadores/registrar_docente"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Registrar docentes</a
      ><a
        href="/coordinadores/registrar_materia"
        class="w-full btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Registrar materias</a
      ><a
        href="/coordinadores/materias"
        class="flex w-full justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Ver Materias</a
      ><a
        href="/coordinadores/estudiantes"
        class="flex w-full justify-center items-center btn variant-filled h-fit md:w-[200px] w-30 p-4 rounded-xl text-white bg-[#e78ae2]"
        >Ver Estudiantes</a
      >
    </div>

    <div class="w-11/12 lg:w-10/12">
      <h2 class="text-center text-[18px] font-bold mb-4">
        Información general
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

          Información del coordinador
        </summary>
        <div
          class="w-full mt-6 h-auto flex flex-wrap flex-col gap-6 [&>span]:w-full [&>span]:flex [&>span]:justify-between [&>span]:border-b [&>span]:border-gray-200"
        >
          <span>
            <h2>Cédula:</h2>
            <p>{coordinador.cedula}</p>
          </span>
          <span>
            <h2>Nombre completo:</h2>
            <p class="capitalize">{coordinador.nombre}</p>
          </span>
          <!-- <span>
            <h2>Lapso Ingreso:</h2>
            <p>202101</p>
          </span>
          <span>
            <h2>Lapso en Curso:</h2>
            <p>2022/2023</p>
          </span>
          <span>
            <h2>Ult. Lapso Cursado:</h2>
            <p>2021/2023</p>
          </span> -->
          <span>
            <h2>Teléfono:</h2>
            <p>{coordinador.telefono}</p>
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
