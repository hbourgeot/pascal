<script lang="ts">
  import type { PageData } from "./$types";
  import {DatePicker} from "attractions"
  import moment from "moment";

  export let data: PageData;

  let logs = data.logs;

  let tipo = "";
  let fecha: any = null;

  $: console.log(fecha);

  const filtrarPorFecha = () => {
    logs = data.logs.filter(log => {
      let logDate = moment(log.timestamp, "DD-MM-YYYY");
      console.log(logDate, log.timestamp);
      return fecha.start <= logDate && logDate <= fecha.end;
    })
  }
</script>
<svelte:head>
  <title>Movimientos del sistema - Administración IUTEPAS</title>
</svelte:head>
<section class="p-4 w-full">
  <h2 class="text-5xl mt-5 mb-10 ml-4 font-bold text-sky-600 text-center">
    Movimientos registrados
  </h2>
  <div class="flex items-center justify-center gap-x-5">
    <div class="mb-4">
      <label for="filtro" class="label mb-2">Tipo de movimiento</label><select
        name="filtro"
        id="filtro"
        bind:value="{tipo}"
        class="select"
        on:change="{() =>
          (logs = data.logs.filter((log) => tipo !== "" ? log.level === tipo : log))}"
      >
        <option value="">Todos</option>
        <option value="info">Información</option>
        <option value="warn">Advertencia</option>
      </select>
    </div>
    <div class="mb-4 h-[73px]">
      <label for="" class="label">Mostrar registros entre:</label>
      <div>
        <DatePicker format="%d-%m-%Y" range top={false} locale="es-ES" bind:value="{fecha}" on:change={filtrarPorFecha}>
          <svelte:fragment slot="between-inputs"><span class="mx-2">a</span></svelte:fragment>
        </DatePicker>
      </div>
    </div>
    <button type="button" class="btn variant-filled bg-sky-500 p-4 h-fit font-bold" on:click="{() => {fecha = null; logs = data.logs; tipo=""}}">Resetear campos</button>
  </div>

  <div class="p-5 font-mono bg-gray-200 w-full overflow-y-auto h-[68.5vh]">
    {#each logs as log}
      <p
        class="text-lg text-left {log.level !== 'info'
          ? 'text-orange-600'
          : ''}"
      >
        {log.timestamp} [{log.level.toUpperCase()}] {log.message}
      </p>
    {/each}
  </div>
</section>
<style lang="scss">
  :global(.text-field > input){
    background-color: rgb(216,217,252) !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
    border-radius: 24px !important;
  }
</style>