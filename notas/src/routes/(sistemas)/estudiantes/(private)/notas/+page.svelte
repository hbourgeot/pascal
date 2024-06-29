<script lang="ts">
  import type { PageData } from "./$types";
  import { Table, tableMapperValues } from "@skeletonlabs/skeleton";
  import type { TableSource } from "@skeletonlabs/skeleton";

  export let data: PageData;

  const sourceData = data.materias.map((notas: any) => ({
    materia: notas.materia,
    nota1: notas.nota1.toString(),
    nota2: notas.nota2.toString(),
    nota3: notas.nota3.toString(),
    promedio: notas.promedio.toString(),
  }));

  const tableSimple: TableSource = {
    // A list of heading labels.
    head: ["Materia", "1er corte", "2do corte", "3er corte", "Total"],
    // The data visibly shown in your table body UI.
    body: tableMapperValues(sourceData, [
      "materia",
      "nota1",
      "nota2",
      "nota3",
      "promedio",
    ]),
  };
</script>

<svelte:head>
  <title>Notas | Estudiantes | IUTEPAS</title>
</svelte:head>
<div class="w-full h-screen">
  <h2 class="text-3xl py-10 text-center">
    Notas de <span class="text-sky-600 capitalize"
      >{data.estudiante?.nombre}</span
    >
  </h2>

  <Table source={tableSimple} class="lg:w-9/12 lg:mx-auto" />
</div>
