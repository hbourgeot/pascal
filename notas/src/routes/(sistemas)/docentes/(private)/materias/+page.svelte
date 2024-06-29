<script lang="ts">
  import { Table, tableMapperValues } from "@skeletonlabs/skeleton";
  import type { TableSource } from "@skeletonlabs/skeleton";
  import type { PageData } from "./$types";
  import type { Materia } from "../../../../../app";
  import { goto } from "$app/navigation";

  export let data: PageData;

  let nombre_profesor = data.docente.nombre;

  const sourceData = data.materias.map((materia: Materia) => ({
    codigo: materia.id,
    nombre: materia.nombre,
    hp: materia.hp,
    ht: materia.ht,
    dia: materia.dia,
    inicio: materia.hora_inicio,
    fin: materia.hora_fin,
    estudiantes: materia.cantidad_estudiantes?.toString(),
  }));

  const tableSimple: TableSource = {
    head: [
      "Código",
      "Nombre",
      "Horas prácticas",
      "Horas teóricas",
      "Día de clase",
      "Hora de inicio",
      "Hora de fin",
      "Estudiantes asignados",
    ],
    body: tableMapperValues(sourceData, [
      "codigo",
      "nombre",
      "hp",
      "ht",
      "dia",
      "inicio",
      "fin",
      "estudiantes",
    ]),
  };

  console.log(data.materias, sourceData);

  const handleSelection = (e: CustomEvent) => {
    goto(`/docentes/materias/${e.detail[0]}`);
  };
</script>

<svelte:head>
  <title>Materias | Docentes | IUTEPAS</title>
</svelte:head>
<main class="w-full h-screen">
  <section class="flex flex-col gap-5">
    <h2 class="text-3xl text-center pl-10 mt-10">
      {#if data.materias[0].id}
        Materias asignadas:
      {:else}
        Usted no tiene materias asignadas.
      {/if}
    </h2>

    {#if data.materias[0].id}
      <Table
        interactive={true}
        on:selected={handleSelection}
        source={tableSimple}
        class="mx-auto w-[98%] text-center lg:w-[80%]"
      />
    {/if}
  </section>
</main>
