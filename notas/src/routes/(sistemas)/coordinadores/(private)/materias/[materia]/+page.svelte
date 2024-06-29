<script lang="ts">
  import type { ActionData, PageData } from "./$types";
  import { Table } from "@skeletonlabs/skeleton";
  import type { TableSource } from "@skeletonlabs/skeleton";
  import { tableMapperValues } from "@skeletonlabs/skeleton";
  import { triggerToast } from "$lib/utils/toast";
  import { goto } from "$app/navigation";

  import pascalConFondo from "$lib/images/pascalConFondo.png";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { FileDownload } from "@steeze-ui/tabler-icons";
  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form?.message);
  }

  const sourceData = data.estudiantes.map((nota: any) => ({
    nombre: nota.nombre,
    cedula: nota.cedula,
    nota1: nota.nota1,
    nota2: nota.nota2,
    nota3: nota.nota3,
    promedio: nota.promedio,
  }));

  const tableSource: TableSource = {
    head: [
      "Nombre del Estudiante",
      "Cédula del Estudiante",
      "Nota del 1er corte",
      "Nota del 2do corte",
      "Nota del 3er corte",
      "Promedio de notas",
    ],
    body: tableMapperValues(sourceData, [
      "nombre",
      "cedula",
      "nota1",
      "nota2",
      "nota3",
      "promedio",
    ]),
  };

  const handleSelect = (e: CustomEvent) => {
    let estudiante = e.detail[0];
    goto(`/coordinadores/estudiante/${estudiante}`);
  };

  let printBtn: HTMLButtonElement;
  let header: HTMLElement;

  const print = () => {
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
    document.querySelector(".formField")?.classList.toggle("hidden");
    window.print();
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
    document.querySelector(".formField")?.classList.toggle("hidden");
  };
</script>

<svelte:head>
  <title
    >Estudiantes de la materia {data.materia.id} | Coordinadores | IUTEPAS</title
  >
</svelte:head>
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
<main class="mx-auto p-10 h-screen bg-transparent relative">
  <div class="absolute top-5 right-3">
    <button
      bind:this={printBtn}
      class="btn bg-pink-600 text-white save"
      on:click={print}
    >
      <Icon class="w-8 h-8" src={FileDownload} />

      Descargar Notas
    </button>
  </div>
  <h2 class="text-4xl text-center">Estudiantes de '{data.materia.nombre}'</h2>
  <section class="w-full p-5">
    {#if sourceData[0].cedula}
      <Table
        source={tableSource}
        interactive={true}
        on:selected={handleSelect}
      />
    {:else}
      <p class="text-xl">No hay estudiantes registrados</p>
    {/if}
  </section>
</main>
