<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { Estudiante } from "../../../../app";
  import type { PageData } from "./$types";
  import { Eye } from "@steeze-ui/tabler-icons";
  import { moneyBsConverter, moneyUsdConverter } from "$lib/resources/moneyConverter";
  import moment from "moment";
  import { onMount } from "svelte";
  import { triggerToast } from "$lib/utils/toast";

  export let data: PageData

  let estudiante: Estudiante = data.estudiante;

  onMount(() => {
    if (estudiante === null) {
      triggerToast("No se ha encontrado el estudiante");
      window.history.back();
    }
  });
</script>
<svelte:head>
  <title>Pagos de un estudiante - Administración IUTEPAS</title>
</svelte:head>
<main class="w-full p-5">
  <h1 class="text-4xl font-bold text-center">Pagos de <span class="text-secondary-500 capitalize">{estudiante?.nombre}</span></h1>
  {#if data?.pagos?.length === 0}
    <p class="text-center text-xl mt-5">No se han encontrado pagos para este estudiante</p>
  {:else}
  <table class="container table mx-auto my-5 !text-xl text-left">
    <thead>
      <th>Fecha</th>
      <th>Monto</th>
      <th>Método</th>
      <th>Descripción</th>
      <th>Ciclo</th>
      <th>Ver</th>
    </thead>
    <tbody>
      {#each data.pagos as pago}
      <tr>
        <td class="!text-xl">{moment.utc(new Date(pago.fecha_pago)).format('DD-MM-YYYY')}</td>
        <td class="!text-xl">
          {#if pago.metodo_pago.nombre !== "Efectivo"}
          {moneyBsConverter(parseFloat(pago.monto.monto))}
          {:else}
            {moneyUsdConverter(parseFloat(pago.monto.monto))}
          {/if}
        </td>
        <td class="capitalize !text-xl">{pago.metodo_pago.nombre}</td>
        <td class="capitalize !text-xl">{pago.metodo_pago.descripcion.replace("_", " ")}</td>
        <td class="!text-xl">{pago.ciclo}</td>
        <td><a href={`/pagos/${data.estudiante.cedula}/${pago.id}`} class="btn variant-filled-surface py-1 px-4 rounded-full"><Icon src={Eye} class="h-6 w-6"/></a></td>
      </tr>
      {/each}
    </tbody>
  </table>
  {/if}
</main>
<style></style>