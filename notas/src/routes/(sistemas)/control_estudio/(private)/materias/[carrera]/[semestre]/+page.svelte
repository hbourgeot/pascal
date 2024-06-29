<script lang="ts">
  import type { PageData } from "./$types";
  import {
    Table,
    tableMapperValues,
    type TableSource,
  } from "@skeletonlabs/skeleton";

  export let data: PageData;

  const materiaData = data.materias.map((materia) => ({
    ...materia,
    codigo: materia.id,
    nombre: materia.nombre,
    dia: materia.dia2 ? `${materia.dia}, ${materia.dia2}` : materia.dia,
    hora_inicio: materia.dia2
      ? `${materia.hora_inicio}, ${materia.hora_inicio2}`
      : materia.hora_inicio,
    hora_fin: materia.dia2
      ? `${materia.hora_fin}, ${materia.hora_fin2}`
      : materia.hora_fin,
    docente: data.docentes.find(
      (docente) => materia.id_docente === docente.cedula
    )?.nombre,
  }));

  let tableSource: TableSource = {
    // A list of heading labels.
    head: [
      "Código",
      "Nombre",
      "Horas Prácticas",
      "Horas Teóricas",
      "Día de clases",
      "Comienza",
      "Termina",
      "U.C.",
      "Docente",
    ],
    // The data visibly shown in your table body UI.
    body: tableMapperValues(materiaData, [
      "id",
      "nombre",
      "hp",
      "ht",
      "dia",
      "hora_inicio",
      "hora_fin",
      "unidad_credito",
      "docente",
    ]),
  };

  const redirectTable = (e: CustomEvent) => {
    window.location.pathname = "/control_estudio/materias/" + e.detail[0];
  };
</script>

<svelte:head>
  <title>Materias de {data.carrera.nombre} | Control de estudio | IUTEPAS</title
  >
</svelte:head>
<div class="flex h-screen items-center p-10 flex-col w-full max-h-auto gap-6">
  <h2 class="text-4xl capitalize">
    Materias de la carrera {data.carrera.nombre} ({data.semestre})
  </h2>
  <Table
    on:selected={redirectTable}
    interactive={true}
    source={tableSource}
    class="w-full mb-5 lg:mx-auto"
  />
</div>
