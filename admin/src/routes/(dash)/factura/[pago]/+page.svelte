<script lang="ts">
  import { page } from "$app/stores";
  import type { PageData } from "./$types";
  import pascalConFondo from "$lib/images/pascalConFondo.png";
  import {
    moneyBsConverter,
    moneyUsdConverter,
  } from "$lib/resources/moneyConverter";

  export let data: PageData;
  let bcv = parseFloat(data.bcv);

  //@ts-ignore
  let concepto: { descripcion: string; monto: number; metodo: string } = {
    descripcion: data.metodoPago?.descripcion,
    monto: parseFloat(data.monto?.monto),
    metodo: data.metodoPago?.nombre,
  };
</script>

<svelte:head>
  <title>Factura N° {data.nroFactura} - Administración IUTEPAS</title>
</svelte:head>
<div class="overflow">
  <section class="w-[750px] bg-white m-5 flex flex-col">
    <div class="absolute right-10 top-5 flex justify-between gap-3">
      <button
        type="button"
        class="btn variant-filled-primary bg-sky-600 rounded-lg px-5 py-2 text-lg text-light-200 font-extrabold save"
        on:click="{() => print()}">Imprimir factura</button
      >
    </div>
    <header class="py-5 flex justify-start items-center px-8">
      <img src="{pascalConFondo}" alt="" class="h-[fit-content] w-[200px]" />
      <section class="text-center w-7/11">
        <h2 class="text-2xl font-medium">S.C. IUTEPAS</h2>
        <p class="text-sm">
          Gaceta Oficial N° 36.104 / Decreto Presidencial de la República N°
          1608
        </p>
        <p class="text-sm">RIF: J-307676744</p>
        <p class="text-sm">
          Calle Mariño C/C Páez, Edif.: 102-02-10, Piso 1, Apt S/N
        </p>
        <p class="text-sm">Sector Barrancón, Cagua, Edo. Aragua, ZP 2122</p>
        <p class="text-sm">Telfs.: (0244) 395.93.89</p>
      </section>
      <section
        class="text-center w-[fit-content] text-sm bg-blue-400 border-1 border-blue-400 border-solid rounded-lg"
      >
        <p class="text-light-50 align-text-top text-center h-[30px]">
          Fecha de Emisión
        </p>
        <div class="p-1 !bg-[#EEEEEEEE] rounded-br-lg px-3 rounded-bl-lg">
          <span>{new Date().toLocaleString()}</span>
        </div>
      </section>
    </header>
    <article class="pl-12 w-full h-full justify-between flex flex-col mt-5">
      <div class="w-full flex justify-end pr-10 text-4xl fact">
        <span class="text-red-500 uppercase font-black"
          >N° {data.nroFactura}</span
        >
      </div>
      <div class="flex flex-col w-full">
        <h2 class="self-start text-xl capitalize">
          <span class="font-bold">Razón Social:</span>
          {data.nombreEstudiante}
        </h2>
        <h2 class="self-start text-xl">
          <span class="font-bold">C.I. o RIF:</span>
          {data.estudiante}
        </h2>
        <div
          class="w-11/12 flex justify-between font-bold border-t border-b mt-10 border-dark-200"
        >
          <span class="text-xl">DESCRIPCIÓN</span><span class="text-xl"
            >TOTAL</span
          >
        </div>
        <div class="w-11/12 flex justify-between font-bold">
          <span class="text-xl capitalize"
            >{concepto.descripcion.replaceAll("_", " ")}</span
          ><span class="text-xl">
            {#if concepto.metodo !== "Efectivo"}
              Bs. {+concepto.monto.toFixed(2)}
            {:else if concepto.metodo === "Efectivo"}
              {moneyUsdConverter(+concepto.monto)}
            {/if}
          </span>
        </div>
      </div>

      <div
        class="w-11/12 flex justify-self-end justify-between items-center font-bold border-t mt-50 border-dark-200"
      >
        <div class="block">
          <p class="text-xl">
            Pagado: {#if concepto.metodo === "Transferencia"}T:{+concepto.monto.toFixed(
                2
              )} Bs{:else if concepto.metodo === "Punto"}P:
              {+concepto.monto.toFixed(2)} Bs{:else if concepto.metodo === "Efectivo"}ED:{moneyUsdConverter(
                +concepto.monto
              )}{/if}
          </p>
          <p class="text-xl">$ = Bs. {bcv.toFixed(4)}</p>
        </div>
        <div>
          <p class="text-right text-xl">
            Subtotal: {#if concepto.metodo !== "Efectivo"}
              Bs. {+concepto.monto.toFixed(2)}
            {:else}
              {moneyUsdConverter(+concepto.monto)}
            {/if}
          </p>
          <p class="text-right text-xl">IVA 0%: {moneyBsConverter(0)}</p>
          <p class="text-right text-xl">
            Total: {#if concepto.metodo !== "Efectivo"}
              Bs. {+concepto.monto.toFixed(2)}
            {:else}
              {moneyBsConverter(+concepto.monto * bcv)}
            {/if} 
          </p>
        </div>
      </div>
    </article>
  </section>
</div>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Saira+Extra+Condensed:wght@300&display=swap");
  @media print {
    .save {
      display: none !important;
    }
    div.overflow {
      height: 100vh;
      overflow: hidden;
    }

    :global(.app-bar) {
      display: none !important;
    }
  }
  div.overflow {
    height: calc(100vh - 80px);
    overflow: auto;
    overflow-x: hidden;
    display: flex;
    flex-direction: column;
    gap: 340px;
  }

  .fact {
    font-family: "Saira Extra Condensed", sans-serif;
  }
</style>
