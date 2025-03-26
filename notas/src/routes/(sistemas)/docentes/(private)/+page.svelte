<script lang="ts">
  import { ExpandLess, ExpandMore } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { PageData } from "./$types";

  import type { Docente, Materia } from "../../../../app";
  
  export let data: PageData;

  let docente: Docente = data.docente;
  let materias: Materia[] = data.materias;
</script>

<svelte:head>
  <title>Docentes | IUTEPAS</title>
</svelte:head>
<div
  class="flex flex-center flex-col w-full max-h-auto gap-6 h-[91.5vh] overflow-auto"
>
  <h1 class="w-[90%] text-2xl font-bold text-center capitalize">
    ¡Bienvenid@, {docente.nombre}!
  </h1>
  <div
    class="w-[98%] max-w-[600px] flex flex-col items-center gap-10 bg-white rounded-lg"
    style=" max-height: auto; box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;"
  >
    <div
      class="w-full h-auto mt-5 flex flex-wrap gap-5 flex-center [&>button]:w-30 [&>button]:p-4 [&>button]:rounded-xl [&>button]:text-white
            md:[&>button]:w-[200px]"
    >
      <button class=" bg-[#5C8984]"
        ><a href="/docentes/materias" class="w-full h-full block"
          >Ver Materias</a
        ></button
      >
    </div>

    <div class="w-11/12 lg:w-10/12">
      <h2 class="text-center text-[18px] font-bold mb-4">
        Informacion general
      </h2>

      <details
        open
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

          Informacion del docente
        </summary>
        <div
          class="!w-[70%] px-5 mt-6 h-auto grid grid-cols-2 gap-y-2 gap-x-10"
        >
            <h2>Cedula:</h2>
            <p>{docente.cedula}</p>
            <h2>Nombre completo:</h2>
            <p class="capitalize">{docente.nombre}</p>
            <h2>Teléfono:</h2>
            <p>{docente.telefono}</p>
        </div>
      </details>
      <details
      open
      class="my-5"
      >
        <summary
          class="flex w-full h-[40px] items-center gap-4 pl-4 rounded border border-gray-200"
        >
          <span class="expand">
            <Icon src={ExpandMore} class="icon " />
          </span>
          <span class="expanded">
            <Icon src={ExpandLess} class="icon " />
          </span>

          Materias impartidas
        </summary>
        <div
          class="w-[70%] px-5 mt-6 h-auto grid grid-cols-2 gap-y-2 gap-x-10"
        >
          {#if !materias.length}
            <span>
              <h2>Usted actualmente no imparte materias</h2>
            </span>
          {:else}
            {#each materias as materia, n}
                <h2>{materia.id}</h2>
                <h2>{materia.nombre}</h2>
            {/each}
          {/if}
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

  button {
    background-color: rgba(88, 119, 221, 0.7);
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
