<script lang="ts">
  import { Table, tableMapperValues, type TableSource } from "@skeletonlabs/skeleton";
  import type { PageData } from "./$types";
  import { DatePicker } from "attractions";
  import moment from "moment";

  export let data: PageData;

  let logs = data.logs;

  let tipo = "";
  let fecha: any = null;

  
let tableSimple: TableSource = {
	head: ['Nivel', 'Mensaje', 'Fecha', 'Usuario', 'Módulo'],
	// The data visibly shown in your table body UI.
	body: tableMapperValues(logs, ["level", "message", "timestamp", "usuario", "modulo"]),
};

$: tableSimple = {
	head: ['Nivel', 'Mensaje', 'Fecha', 'Usuario', 'Módulo'],
	// The data visibly shown in your table body UI.
	body: tableMapperValues(logs, ["level", "message", "timestamp", "usuario", "modulo"]),
}; 
				

  const filtrarPorFecha = () => {
    logs = data.logs.filter((log) => {
      let logDate = moment(log.timestamp, "DD-MM-YYYY");
      console.log(logDate, log.timestamp);
      return fecha.start <= logDate && logDate <= fecha.end;
    });
  };

  const logClassResolver = (log: "Advertencia" | "Información" | "Error" | "Crítico" | string): string => {
    let className = "";
    switch(log) {
      case "Advertencia":
        className = "!bg-warning-200";
        break;
      case "Información":
        className = "!bg-info-200";
        break;
      case "Error":
        className = "!bg-error-200"
        break;
      case "Crítico":
        className = "!bg-purple-300"
        break;
      default:
        className = "!bg-info-200"
        break;
    }

    console.log(className, log)

    return className;
  }
</script>

<svelte:head>
  <title>Movimientos | Super usuario | IUTEPAS</title>
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
        bind:value={tipo}
        class="select"
        on:change={() => {logs = data.logs.filter((log) =>
            tipo !== "" ? log.level === tipo : log
          ); console.log(tipo)}}
      >
        <option value="">Todos</option>
        <option value="Información">Información</option>
        <option value="Advertencia">Advertencia</option>
        <option value="Error">Error</option>
        <option value="Crítico">Crítico</option>
      </select>
    </div>
    <div class="mb-4 h-[73px]">
      <label for="" class="label">Mostrar registros entre:</label>
      <div>
        <DatePicker
          format="%d-%m-%Y"
          range
          top={false}
          locale="es-ES"
          bind:value={fecha}
          on:change={filtrarPorFecha}
        >
          <svelte:fragment slot="between-inputs"
            ><span class="mx-2">a</span></svelte:fragment
          >
        </DatePicker>
      </div>
    </div>
    <button
      type="button"
      class="btn variant-filled bg-sky-500 p-4 h-fit"
      on:click={() => {
        fecha = null;
        logs = data.logs;
        tipo = "";
      }}>Resetear campos</button
    >
    <button class="btn variant-filled bg-[#db0081] h-fit p-4"
      >Descargar movimientos</button
    >
  </div>

  <div class="overflow-y-auto h-[61.5vh] mt-5 table-container"> <!-- 61.5vh -->
    <!-- make a html table -->
	<!-- Native Table Element -->
	<table class="table !bg-gray">
		<thead>
			<tr>
        {#each ['Nivel', 'Mensaje', 'Fecha', 'Usuario', 'Módulo'] as header}
				<th>{header}</th>
        {/each}
			</tr>
		</thead>
		<tbody>
			{#each logs as log}
				<tr class={logClassResolver(log.level)}>
					<td>{log.level}</td>
					<td>{log.message}</td>
					<td>{log.timestamp}</td>
					<td>{log.usuario}</td>
          <td>{log.modulo}</td>
				</tr>
			{/each}
		</tbody>
	</table>
</div>
</section>

<style>
  :global(.text-field > input) {
    background-color: rgb(216, 217, 252) !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
    border-radius: 24px !important;
  }
  :global(.time-picker, .handle) {
    width: 100% !important;
  }

  :global(.table tbody tr:nth-child(even)){
    background-color: unset !important;
  }
</style>