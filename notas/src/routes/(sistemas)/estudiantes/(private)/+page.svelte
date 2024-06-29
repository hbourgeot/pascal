<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import {
    ExpandMore,
    ExpandLess,
    VerticalAlignBottom,
    FileDownloadDone,
  } from "@steeze-ui/material-design-icons";
  import type { PageData } from "./$types";
  import type { Estudiante, Materia } from "../../../../app";
  import { onMount, tick } from "svelte";
  import { Download } from "@steeze-ui/tabler-icons";

  export let data: PageData;

  let estudiante: Estudiante = data.estudiante;
  let materias: {
    materia: string;
    id: string | number;
    download: string;
  }[] = data.materias;

  let planificaciones: boolean[] = [];

  const update = async () => {
    for (let i = 0; i < materias.length; i++) {
      const response = await fetch(
        `/api/archivos?ciclo=${data.ciclo}&folder=${materias[i].id}`
      );
      const contentType = response.headers.get("content-type");
      if (contentType && contentType.includes("application/pdf")) {
        const file = await response.blob();
        materias[i].download = URL.createObjectURL(file);
        planificaciones[i] = true;
        materias = materias;
      } else {
        planificaciones[i] = false;
      }
      planificaciones = planificaciones;
    }
  };

  onMount(() => update());
</script>

<svelte:head>
  <title>Estudiantes | IUTEPAS</title>
</svelte:head>
<div
  class="flex flex-center flex-col w-full max-h-auto gap-6"
  style="min-height: 100vh"
>
  <h1 class="w-[90%] text-2xl font-bold text-center capitalize">
    ¡Bienvenid@, {estudiante.nombre}!
  </h1>
  <div
    class="w-[90%] md:w-[70%] flex flex-col items-center gap-10 bg-white rounded-lg"
    style="box-shadow: rgba(149, 157, 165, 0.2) 0 8px 24px;"
  >
    <div
      class="w-full h-auto mt-5 flex flex-wrap gap-5 flex-center [&>a]:w-30 [&>a]:p-4 [&>a]:rounded-xl [&>a]:text-white
            md:[&>a]:w-[240px]"
    >
      <a
        href="/estudiantes/constancia"
        target="_blank"
        class="flex btn variant-filled flex-row-reverse gap-x-2 w-30 p-4 rounded-xl text-white bg-[#e78ae2] w-full"
        ><Icon src={Download} theme="round" size="24px" /> Constancia de estudio</a
      >
      <a
        href="/estudiantes/historico"
        class="w-full btn variant-filled h-full bg-[#e78ae2]"
        >Histórico de Notas</a
      >
      <a
        href="/estudiantes/horario"
        class="w-full btn variant-filled h-full bg-[#e78ae2]"
        >Inscribir materias</a
      >
      <a
        href="/estudiantes/notas"
        class="w-full btn variant-filled h-full bg-[#e78ae2]">Notas</a
      >
    </div>

    <div class="w-11/12 lg:w-10/12">
      <h2 class="text-center text-[18px] font-bold mb-4">
        Información general
      </h2>

      <details
        class="flex w-full lg:w-3/5 lg:text-base xl:text-lg mx-auto flex-col items-center justify-center mb-4"
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

          Información del estudiante
        </summary>
        <div
          class="w-full mt-6 h-auto flex flex-wrap flex-col gap-6 [&>span]:w-full [&>span]:flex [&>span]:justify-between [&>span]:border-b [&>span]:border-gray-200 text-sm lg:text-xl"
        >
          <span>
            <h2>Cédula:</h2>
            <p>{estudiante.cedula}</p>
          </span>
          <span>
            <h2>Nombre completo:</h2>
            <p class="capitalize">{estudiante.nombre}</p>
          </span>
          <span>
            <h2>Especialidad:</h2>
            <p class="capitalize">{data.carrera?.nombre}</p>
          </span>
          <span>
            <h2>Semestre:</h2>
            <p>{estudiante.semestre}</p>
          </span>
          <span>
            <h2>Estado Académico:</h2>
            <p class="capitalize">{estudiante.estado}</p>
          </span>
        </div>
      </details>
      <details
        class="flex w-full lg:w-3/5 lg:text-base xl:text-lg mx-auto flex-col items-center justify-center mb-4"
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

          Materias inscritas
        </summary>
        <div
          class="w-full mt-6 h-auto flex flex-wrap flex-col gap-6 [&>span]:w-full [&>span]:flex [&>span]:justify-between [&>span]:border-b [&>span]:border-gray-200 text-sm lg:text-xl"
        >
          {#if !materias.length}
            <span>
              <h2>Usted no tiene materias asignadas</h2>
            </span>
          {:else}
            {#each materias as materia, n}
              <span>
                <h2>{materia.materia}</h2>
                {#if planificaciones[n]}
                  <a
                    href={materia.download}
                    class="flex gap-2"
                    download="planificacion.pdf"
                    >Descargar <Icon src={Download} /></a
                  >
                {:else}
                  <p>No hay planificación</p>
                {/if}
              </span>
            {/each}
          {/if}
        </div>
      </details>
    </div>
  </div>
</div>

<style class="scss">
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
