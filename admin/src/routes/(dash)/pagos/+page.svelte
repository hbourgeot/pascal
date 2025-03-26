<script lang="ts">
  import { onMount } from "svelte";
  import type { Estudiante, Pago } from "../../../app";
  import type { PageData } from "./$types";
    import DatePicker from "$lib/components/DatePicker.svelte";;
  import { SlideToggle } from "@skeletonlabs/skeleton";
  import type {
    AutocompleteOption,
    PopupSettings,
  } from "@skeletonlabs/skeleton";
  import moment from "moment";

  // Your selected Skeleton theme:

  export let data: PageData;

  let estudiantes: Estudiante[] | undefined = data.estudiantes;
  let estudiantesComplete: AutocompleteOption[] = [];
  if(data.ok){
    estudiantesComplete = estudiantes?.map(
    (estudiante) => ({
      label: `${estudiante.cedula} - ${estudiante.nombre}`,
      value: estudiante.cedula,
      keywords: `${estudiante.cedula}, ${estudiante.cedula.replace(
        "V-" || "E-",
        ""
      )}, ${estudiante.nombre.toLowerCase()}`,
      meta: { healthy: false },
    })) as unknown as AutocompleteOption[]
  }

  let opcionReporte: string = "dia";
  let filtroReporte: string = "";
  let verEstudiante: string = "";
  const date = new Date();
  const today: string = `${date.getFullYear()}-${
    date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1
  }-${date.getDate() < 10 ? "0" + date.getDate() : date.getDate()}`;
  let reportDay: any;

  let tomorrow = new Date(date);
  tomorrow.setDate(date.getDate()+1)

  let inputPopupDemo: string = "";
  let checked: boolean = false;
  let venezolano: boolean = true;

  let fechas: any = null;
  let fechaInicio: string = "";
  let fechaFinal: string = "";

  $: verEstudiante = `${venezolano ? 'V' : 'E'}-${inputPopupDemo}`

  function dateHasChanged() {
    fechaInicio = moment(fechas.start).format("DD-MM-YYYY");
    fechaFinal = moment(fechas.end).format("DD-MM-YYYY");
    console.log(fechaInicio, fechaFinal);
  }
</script>
<svelte:head>
  <title>Módulo de Pagos - Administración IUTEPAS</title>
</svelte:head>
<main
  id="pagos"
  class="w-full h-full flex flex-col p-7 gap-y-10 overflow-y-auto"
>
  <div class="flex justify-end self-end items-center w-[650px]">
    <a
      class="rounded-lg bg-sky-600 text-white font-bold py-3 px-5"
      href="/pagos/registrar">Registrar Pago</a
    >
  </div>
  <div class="flex justify-around w-full">
    <section
      class="flex flex-col justify-center w-1/4 h-full self-center gap-y-5"
    >
      <h2 class="text-sky-600 text-4xl text-center font-extrabold">
        Buscar Pagos
      </h2>
      <label for="reporte">
        Seleccione el estudiante

        <input
          class="input (text) autocomplete rounded-lg placeholder-light-50/90 text-light-50 px-4 py-2"
          type="search"
          name="autocomplete-search"
          bind:value="{inputPopupDemo}"
          placeholder="Buscar pagos..."
        />
      </label>
      <SlideToggle
        name="slider-label"
        active="bg-primary-500"
        background="bg-primary-700"
        bind:checked="{checked}"
        >{checked
          ? "Historial de pagos registrados"
          : "Pagos del ciclo actual"}</SlideToggle
      >
      <SlideToggle
        name="slider-label"
        active="bg-primary-500"
        background="bg-primary-700"
        bind:checked="{venezolano}"
        >{venezolano
          ? "Es venezolano"
          : "Es extranjero"}</SlideToggle
      >
      {#if inputPopupDemo.length}
      <a
        href="/pagos/{verEstudiante}?tipo={checked ? 'todos' : 'ciclo'}"
        class="bg-pink-600 text-center px-5 py-2 rounded-md text-white btn variant-filled font-bold w-full"
        >Ver pago</a
      >
      {/if}
    </section>
    <section class="flex flex-col w-1/4 self-center gap-y-5">
      <h2 class="text-sky-600 text-4xl text-center font-extrabold">Reportes</h2>
      <label for="reporte">
        Seleccione su tipo de reporte
        <select
          bind:value="{opcionReporte}"
          name="reporte"
          id="reporte"
          class="select text-blue-900 font-semibold rounded-lg mt-1 mb-3 px-5 py-2 w-full"
        >
          <option value="dia">Dia</option>
          <option value="fecha">Fechas específicas</option>
          <option value="monto">Montos Totales</option>
        </select>
      </label>
      <label
        for="filtro"
        class="{opcionReporte == 'monto'
          ? 'invisible absolute top-0 -z-5'
          : ''}"
      >
        ¿Cuáles pagos desea que estén en el reporte?
        <select
          bind:value="{filtroReporte}"
          name="filtro"
          id="filtro"
          class="select text-blue-900 font-semibold rounded-lg mt-1 mb-3 px-5 py-2 w-full"
        >
          <option value="">Todos</option>
          <option value="Transferencia">Transferencia</option>
          <option value="Punto">Punto</option>
          <option value="Efectivo">Dólares en efectivo</option>
        </select>
      </label>
      {#if opcionReporte == "dia"}
        <label for="report-date" class="w-full"
          >Fecha de pagos
          <DatePicker
            bind:value="{reportDay}"
          />
        </label>
      {:else}
        <div class="w-full">
          <p>Elija entre dos fechas</p>
          <DatePicker
          dateRange
            bind:value="{fechas}"
            on:change="{dateHasChanged}"
          />
        </div>
      {/if}

      <footer class="flex justify-between gap-x-5 flex-row-reverse text-center">
        {#if opcionReporte == "dia"}
          <a
            href="/reporte/dia?d={reportDay}{filtroReporte !== ''
              ? `&f=${filtroReporte}`
              : ''}"
            class="bg-pink-600 px-5 text-white btn variant-filled py-2 rounded-lg font-bold w-full"
            >Generar reporte</a
          >
        {:else if opcionReporte == "fecha"}
          <a
            href="/reporte/fechas?fi={fechaInicio}&ff={fechaFinal}{filtroReporte !== ''
              ? `&f=${filtroReporte}`
              : ''}"
            class="bg-pink-600 px-5 text-white btn variant-filled py-2 rounded-lg font-bold w-full"
            >Generar reporte</a
          >
        {:else}
          <a
            href="/reporte/monto?fi={fechaInicio}&ff={fechaFinal}"
            class="bg-pink-600 px-5 text-white btn variant-filled py-2 rounded-lg font-bold w-full"
            >Generar reporte</a
          >
        {/if}
      </footer>
    </section>
  </div>
</main>

<style lang="scss">
  #pagos {
    height: calc(100vh - 100px);
  }
  :global(.text-field > input) {
    background-color: rgb(216, 217, 252) !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
    border-radius: 0.5rem !important;
  }
</style>
