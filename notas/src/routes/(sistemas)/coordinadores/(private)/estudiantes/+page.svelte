<script lang="ts">
  import { createSearchStore, searchHandler } from "$lib/resources/store";
  import { onDestroy } from "svelte";
  import type { Estudiante } from "../../../../../app";
  import type { PageData } from "./$types";

  export let data: PageData;

  const carreras = data.carreras;

  const date = new Date();
  let tomorrow = new Date(date);
  tomorrow.setDate(date.getDate() + 1);
  let telefonoInput: string = "";

  let estudiantes: Estudiante[] = data.estudiantes;
  $: estudiantes = data.estudiantes;
  let estudiantesTerms = estudiantes.map((estudiante) => ({
    ...estudiante,
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
  $: if (telefonoInput.toString().length > 7) {
    telefonoInput = telefonoInput.toString().slice(0, 7);
  }

  const unsubscribe = estudianteSearch.subscribe((model) =>
    searchHandler(model)
  );
  onDestroy(() => {
    unsubscribe();
  });

  let semestre = "";
  let carreraSeleccionada = "";
  let search = "";
</script>

<svelte:head>
  <title>Estudiantes - Administración IUTEPAS</title>
</svelte:head>

<section class="main w-full flex flex-col justify-evenly p-7 h-full">
  <section
    class="flex flex-col justify-evenly w-3/4 h-1/2 font-bold self-center gap-y-5"
  >
    <h2
      class="text-sky-600 !justify-self-start text-5xl text-center font-extrabold"
    >
      Estudiantes
    </h2>
    <div class="flex justify-around">
      <label for="carrera" class="flex flex-col w-1/4 label">
        Seleccione la carrera
        <select
          name="carrera"
          id="carrera"
          class="select font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
          bind:value={carreraSeleccionada}
          on:change={() =>
            ($estudianteSearch.search = `${carreraSeleccionada} ${semestre}`)}
        >
          <option value="disabled" disabled>Filtrar por carrera</option>
          <option value="">Todas las carreras</option>
          {#each carreras as carrera}
            <option value={carrera.nombre.toLowerCase()}
              >{carrera.nombre}</option
            >
          {/each}
        </select>
      </label>
      <label for="semestre" class="flex flex-col w-1/4">
        Seleccione el semestre
        <select
          name="semestre"
          id="semestre"
          bind:value={semestre}
          on:change={() =>
            ($estudianteSearch.search = `${carreraSeleccionada} ${semestre}`)}
          class="select font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
        >
          <option value="disabled" disabled>Filtrar por semestre</option>
          <option value="">Todos los semestres</option>
          <option value="1to">1ro</option>
          <option value="2to">2do</option>
          <option value="3to">3ro</option>
          <option value="4to">4to</option>
          <option value="5to">5to</option>
          <option value="6to">6to</option>
        </select>
      </label>
      <label for="personalizado" class="flex flex-col w-1/4">
        Búsqueda personalizada
        <input
          type="text"
          bind:value={search}
          on:change={() => ($estudianteSearch.search = search)}
          class="input (text) font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
          placeholder="Buscar estudiante..."
        />
      </label>
    </div>
    <a
      href="/coordinadores/estudiantes/filtrado?s={$estudianteSearch.search}"
      class="self-center bg-pink-600 text-center px-5 py-2 rounded-md text-light-50 font-bold w-[250px] btn variant-filled"
      >Ver estudiantes</a
    >
  </section>
</section>

<style lang="scss">
  :global(.text-field > input) {
    background-color: #e3e4ff !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
  }

  :global(.date-picker, .dropdown-shell, .handle, .text-field) {
    width: 100% !important;
  }
  .main {
    height: calc(100vh - 80px);
  }
</style>
