<script lang="ts">
  import {
    moneyBsConverter,
    moneyUsdConverter,
  } from "$lib/resources/moneyConverter";
  import moment from "moment";
  import type { PageData } from "./$types";

  export let data: PageData;

  let billetes = data.billetes;
  let pago = data.pago;
</script>
<svelte:head>
  <title>Detalles - Administración IUTEPAS</title>
</svelte:head>
<section class="bg-white w-1/2 mx-auto p-8 pt-10 rounded-lg shadow-md">
  <h1 class="text-2xl font-bold mb-4 text-surface-500">Información del Pago</h1>
  <div class="grid grid-cols-2 gap-4">
    <p><strong class="text-surface-500">Ciclo:</strong> {pago.ciclo}</p>
    <p class="capitalize">
      <strong class="text-surface-500">Estudiante:</strong>
      {data.estudiante.nombre}
    </p>
    <p>
      <strong class="text-surface-500">Fecha de pago:</strong>
      {moment(new Date(pago.fecha_pago)).format('DD-MM-YYYY')}
    </p>
    <p>
      <strong class="text-surface-500">Método de pago:</strong>
      {pago.metodo_pago.nombre}
    </p>
    <p>
      <strong class="text-surface-500">Monto:</strong>
      {#if pago.metodo_pago.nombre !== "Efectivo"}
        {moneyBsConverter(parseFloat(pago.monto.monto))}
      {:else}
        {moneyUsdConverter(parseFloat(pago.monto.monto))}
      {/if}
    </p>
  </div>

  {#if pago.metodo_pago.nombre === "Transferencia" && pago.referencia_transferencia}
    <p class="mt-2">
      <strong class="text-surface-500">Nro. de referencia:</strong>
      {pago.referencia_transferencia}
    </p>
  {/if}

  {#if pago.metodo_pago.nombre === "Efectivo"}
    <h2 class="text-xl font-bold mt-4 text-surface-700">
      Detalles de Billetes
    </h2>
    <table class="table mt-2 w-[300px]">
      <thead>
        <tr>
          <th class="p-2">Serial</th>
          <th class="p-2">Monto</th>
        </tr>
      </thead>
      <tbody>
        {#each billetes as billete}
          <tr>
            <td class="uppercase">{billete.serial}</td>
            <td class="uppercase"
              >{moneyUsdConverter(parseFloat(billete.monto))}</td
            >
          </tr>
        {/each}
      </tbody>
    </table>
  {/if}
</section>
<button class="btn variant-filled-surface mx-auto block my-5" on:click="{() => window.history.back()}">Volver a la lista</button>
