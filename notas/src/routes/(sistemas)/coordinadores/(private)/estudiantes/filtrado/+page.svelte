<script lang="ts">
  import { createSearchStore, searchHandler } from "$lib/resources/store";
  import { onDestroy } from "svelte";
  import type { Estudiante } from "../../../../../../app";
  import type { PageData } from "./$types";
  import { goto } from "$app/navigation";
  import { browser } from "$app/environment";
  import { triggerToast } from "$lib/utils/toast";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { Download, Eye } from "@steeze-ui/tabler-icons";
  import { Paginator } from "@skeletonlabs/skeleton";

  export let data: PageData;

  let estudiantes: Estudiante[] = data.estudiantes;
  const carreras = data.carreras;
  $: estudiantes = data.estudiantes;
  let estudiantesTerms = estudiantes.map((estudiante) => ({
    ...estudiante,
    carrera: carreras.find((carrera: any) => carrera.id == estudiante.carrera)
      ?.nombre,
    searchTerms: `${estudiante.cedula} ${estudiante.cedula.replace(
      "V-" || "E-",
      ""
    )} ${estudiante.correo} ${estudiante.estado} ${
      estudiante.telefono
    } ${carreras
      .find((carrera: any) => carrera.id == estudiante.carrera)
      ?.nombre.toLowerCase()} ${
      estudiante.semestre
    }to ${estudiante.nombre.toLowerCase()}`,
  }));

  const estudianteSearch = createSearchStore(estudiantesTerms);

  const unsubscribe = estudianteSearch.subscribe((model) =>
    searchHandler(model)
  );

  let paginationSettings = {
    limit: 5,
    size: $estudianteSearch.filtered.length,
    amounts: [3, 5, 10, 20],
    offset: 0,
  };

  let paginatedSource = $estudianteSearch.filtered;

  $: paginatedSource = $estudianteSearch.filtered.slice(
    paginationSettings.offset * paginationSettings.limit,
    paginationSettings.offset * paginationSettings.limit +
      paginationSettings.limit
  );

  $: $estudianteSearch.search = data.query?.trim() as unknown as string;
  $: if (!$estudianteSearch.filtered.length) {
    if (browser) {
      triggerToast(
        "No hay estudiantes que coincidan con esos términos de búsqueda",
        3000
      );
      goto("/coordinadores/estudiantes", { replaceState: true });
    }
  }

  onDestroy(() => {
    unsubscribe();
  });

  const generate = async (cedula: string) => {
    try {
      const response = await fetch(`/api/archivos/ficha/${cedula}`);

      const el = document.createElement("a");
      const file = await response.blob();
      const fileHref = URL.createObjectURL(file);
      el.href = fileHref;
      el.download = `${cedula}.pdf`;
      el.click();
    } catch (e) {
      console.error(e);
    }
  };
</script>

<svelte:head>
  <title>Filtrado de estudiantes - Administración IUTEPAS</title>
</svelte:head>
<section class="p-2 pt-5">
  <div
    class="flex flex-col px-5 py-3 bg-white rounded-3xl w-full overflow-y-auto"
  >
    <h1 class="text-4xl text-center my-8">Lista de estudiantes</h1>
    <div class="overflow-x-auto">
      <table class="!text-lg table whitespace-nowrap">
        <thead>
          <th>Cédula de Identidad</th>
          <th>Nombres y Apellidos</th>
          <th>Teléfono</th>
          <th>Semestre</th>
          <th>Estado</th>
          <th>Carrera</th>
          <th>Acciones</th>
        </thead>
        <tbody>
          {#each paginatedSource as estudiante}
            <tr>
              <td class="!align-middle !text-lg">{estudiante.cedula}</td>
              <td class="!align-middle !text-lg capitalize"
                >{estudiante.nombre}</td
              >
              <td class="!align-middle !text-lg">{estudiante.telefono}</td>
              <td class="!align-middle !text-lg">{estudiante.semestre}</td>
              <td class="!align-middle !text-lg capitalize"
                >{estudiante.estado}</td
              >
              <td class="!align-middle !text-lg capitalize"
                >{estudiante.carrera}</td
              >
              <td class="!align-middle !text-lg">
                <a
                  title="Ver notas"
                  href="/coordinadores/estudiantes/{estudiante.cedula}"
                  class="font-bold btn btn-icon variant-filled-primary"
                  ><Icon src={Eye} /></a
                >
                <button
                  type="button"
                  class="btn btn-icon variant-filled-secondary"
                  title="Descargar ficha"
                  on:click={() => generate(estudiante.cedula)}
                >
                  <Icon src={Download} />
                </button>
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
    <Paginator
      bind:settings={paginationSettings}
      showFirstLastButtons={true}
      amountText="registros"
      class="mt-3 mb-3"
      separatorText="de"
    />
  </div>
</section>

<style lang="scss">
  table {
    font-size: 25px;
    line-height: 1.5;
  }

  thead th {
    text-align: left;
  }

  th,
  td {
    padding: 5px 15px;
  }

  section {
    height: calc(100vh - 80px);
  }
</style>
