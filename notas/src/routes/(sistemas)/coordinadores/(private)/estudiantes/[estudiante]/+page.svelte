<script lang="ts">
  import type { PageData } from "./$types";
  import type { Estudiante, Notas } from "../../../../../../app";
  import {
    Table,
    type TableSource,
    tableMapperValues,
  } from "@skeletonlabs/skeleton";
  import { goto } from "$app/navigation";
  import { triggerToast } from "$lib/utils/toast";
  import { browser } from "$app/environment";

  export let data: PageData;

  let estudiante: Estudiante = data.estudiante as unknown as Estudiante;

  let notas: Notas[] = data.notas;

  let promedioSemestre = 0;
  $: if (browser) {
    try {
      promedioSemestre =
        notas.map((nota) => nota.promedio).reduce((a, b) => a + b) /
        notas.length;
    } catch (e) {
      console.error(e);
      triggerToast("El estudiante no tiene materias inscritas");
      window.history.back();
    }
  }

  let tableSource: TableSource;
  $: tableSource = {
    head: ["Materia", "1er corte", "2do corte", "3er corte", "Promedio"],
    body: tableMapperValues(notas as unknown as any[], [
      "materia",
      "nota1",
      "nota2",
      "nota3",
      "promedio",
    ]),
    foot: [
      "Promedio del semestre",
      "",
      "",
      "",
      `<code class='code text-lg rounded-full px-2'>${promedioSemestre.toFixed(
        2
      )}</code>`,
    ],
  };
</script>

<svelte:head>
  <title>Notas de {estudiante.nombre} | controlEstudioes | IUTEPAS</title>
</svelte:head>
<main class="flex flex-col justify-center items-center gap-8 p-8">
  <h2 class="text-3xl py-3">
    Notas de <span class="text-sky-700 font-bold capitalize"
      >{estudiante.nombre}</span
    >
  </h2>
  <Table
    source={tableSource}
    class="w-10/12 lg:w-3/5 mb-5 lg:mx-auto"
    text="text-xl"
    regionCell="!text-xl"
  />
</main>

<style>
  main {
    height: calc(100vh - 80px);
  }
</style>
