<script lang="ts">
  import type { PageData } from "./$types";
  import { Table, tableMapperValues } from "@skeletonlabs/skeleton";
  import type { TableSource } from "@skeletonlabs/skeleton";
  import pascalConFondo from "$lib/images/pascalConFondo.png";

  import { Icon } from "@steeze-ui/svelte-icon";

  import { Download } from "@steeze-ui/tabler-icons";

  export let data: PageData;

  const sourceData = data.materias.map((notas: any) => ({
    materia: notas.materia,
    codigo: notas.id,
    nota1: notas.nota1.toString(),
    nota2: notas.nota2.toString(),
    nota3: notas.nota3.toString(),
    promedio: notas.promedio.toString(),
    semestre: notas.semestre.toString(),
    ciclo: notas.ciclo ?? "no registrado",
  }));

  const tableSimple: TableSource = {
    // A list of heading labels.
    head: [
      "Materia",
      "Código",
      "1er corte",
      "2do corte",
      "3er corte",
      "Total",
      "Semestre",
      "Ciclo",
    ],
    // The data visibly shown in your table body UI.
    body: tableMapperValues(sourceData, [
      "materia",
      "codigo",
      "nota1",
      "nota2",
      "nota3",
      "promedio",
      "semestre",
      "ciclo",
    ]),
  };

  let printBtn: HTMLButtonElement;
  let header: HTMLElement;

  const print = () => {
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
    window.print();
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
  };
</script>

<svelte:head>
  <title>Histórico de notas | Estudiantes | IUTEPAS</title>
</svelte:head>
<main class="h-[calc(100vh-80px)] relative print:z-1200">
  <button
    bind:this={printBtn}
    class="btn bg-pink-600 absolute top-5 right-5 text-white save"
    on:click={print}
  >
    <Icon class="w-8 h-8" src={Download} />
  </button>
  <header
    bind:this={header}
    class="w-[800px] bg-white py-5 justify-start items-center px-8 hidden"
  >
    <img src={pascalConFondo} alt="" class="h-[fit-content] w-[200px]" />
    <section class="text-center w-7/11">
      <h2 class="text-2xl">S.C. IUTEPAS</h2>
      <p class="text-sm">
        Gaceta Oficial N° 36.104 / Decreto Presidencial de la República N° 1608
      </p>
      <p class="text-sm">RIF: J-307676744</p>
      <p class="text-sm">
        Calle Mariño C/C Páez, Edif.: 102-02-10, Piso 1, Apt S/N
      </p>
      <p class="text-sm">Sector Barrancón, Cagua, Edo. Aragua, ZP 2122</p>
      <p class="text-sm">Telfs.: (0244) 395.93.89</p>
    </section>
    <section
      class="text-center w-[fit-content] text-sm bg-blue-400 border-1 border-blue-400 border-solid h-auto rounded-lg"
    >
      <p class="text-light-50 align-text-top text-center h-[30px]">
        Fecha del reporte
      </p>
      <div class="p-1 !bg-[#EEEEEEEE] rounded-br-lg px-3 rounded-bl-lg">
        <span>{new Date().toLocaleString()}</span>
      </div>
    </section>
  </header>
  <h2 class="text-3xl py-10 text-center">
    Histórico de notas de <span class="text-sky-600 capitalize"
      >{data.estudiante?.nombre}</span
    >
  </h2>

  <Table
    source={tableSimple}
    class="lg:w-9/12 lg:mx-auto text-lg print:text-sm print:w-full"
    id="pdf"
    regionCell="!text-lg print-cell"
  />
</main>

<style>
  @media print {
    .save {
      display: none !important;
    }

    :global(#pdf) {
      overflow-y: hidden;
      height: fit-content;
    }

    main {
      width: 800px !important;
      margin: 0 auto;
    }

    :global(body) {
      background-color: white;
    }
    :global(.main-element) {
      background-image: none !important;
    }

    :global(.print-cell) {
      font-size: 14px !important;
    }
  }
</style>
