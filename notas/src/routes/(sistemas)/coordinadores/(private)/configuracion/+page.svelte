<script lang="ts">
  import { enhance } from "$app/forms";
  import type { Docente } from "../../../../../app";
  import type { ActionData, PageData } from "./$types";
  import { onMount } from "svelte";
  import { triggerToast } from "$lib/utils/toast";

  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form.message);
    if (form.ok)
      setTimeout(() => (window.location.href = "/coordinadores"), 3000);
  }

  let config = data.config;
  let years: number[] = [];

  onMount(() => {
    const cicloActual = new Date().getFullYear();

    // Llenar el select con los años siguientes
    for (let i = cicloActual; i <= cicloActual + 10; i++) {
      years = [...years, i];
    }
  });
</script>

<svelte:head>
  <title>Configuraciones | Coordinadores | IUTEPAS</title>
</svelte:head>
<div class="container lg:w-2/5 md:w-2/3 mx-auto px-4 py-8">
  <div class="bg-white p-8 rounded-3xl shadow">
    <h2 class="text-2xl font-semibold mb-4">Realizar configuraciones</h2>
    <p class="my-3 italic text-gray-500">
      En este apartado puedes configurar lo referente a la configuración del
      sistema, fechas de bloqueo, de horarios, porcentajes...
    </p>
    <form
      id="docente-form"
      method="post"
      use:enhance={({ data }) => {
        // @ts-ignore
        const anio = document.getElementById("ciclo1")?.value;
        // @ts-ignore
        const ciclo = document.getElementById("ciclo2")?.value;
        data.append("ciclo", `${anio}-${ciclo}`);
        return async ({ update }) => {
          await update();
        };
      }}
      class="grid grid-cols-2 gap-3"
    >
      <div class="col-start-1 col-end-3">
        <label for="ciclo1" class="label">Ciclo (Año y lapso):</label>
        <div class="input-group flex justify-center">
          <select
            id="ciclo1"
            required
            value={config.ciclo.split("-")[0]}
            class="select border-r-1 border-blue-300 border-solid"
          >
            {#each years as year}
              <option value={year}>{year}</option>
            {/each}
          </select>
          <select
            id="ciclo2"
            value={config.ciclo.split("-")[1]}
            required
            class="select"
          >
            <option value="1">1</option>
            <option value="2">2</option>
          </select>
        </div>
      </div>
      <div>
        <label for="porc1">Porcentaje del primer corte:</label>
        <input
          class="input (number) h-10 p-2"
          type="number"
          id="porc1"
          name="porc1"
          min="5"
          max="100"
          step="1"
          value={config.porc1}
          required
        />
      </div>

      <div>
        <label for="porc2">Porcentaje del segundo corte:</label>
        <input
          class="input (number) h-10 p-2"
          type="number"
          id="porc2"
          name="porc2"
          value={config.porc2}
          min="5"
          max="100"
          step="1"
          required
        />
      </div>

      <div>
        <label for="porc3">Porcentaje del tercer corte:</label>
        <input
          class="input (number) h-10 p-2"
          type="number"
          id="porc3"
          name="porc3"
          min="5"
          max="100"
          step="1"
          value={config.porc3}
          required
        />
      </div>
      <div>
        <label for="cuota1">Fecha Cuota 1:</label>
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="cuota1"
          name="cuota1"
          value={config.cuota1}
          required
        />
      </div>
      <div>
        <label for="cuota2">Fecha Cuota 2:</label>
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="cuota2"
          name="cuota2"
          value={config.cuota2}
          required
        />
      </div>
      <div>
        <label for="cuota3">Fecha Cuota 3:</label>
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="cuota3"
          name="cuota3"
          value={config.cuota3}
          required
        />
      </div>
      <div>
        <label for="cuota4">Fecha Cuota 4:</label>
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="cuota4"
          name="cuota4"
          value={config.cuota4}
          required
        />
      </div>
      <div>
        <label for="cuota5">Fecha Cuota 5:</label>
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="cuota5"
          name="cuota5"
          value={config.cuota5}
          required
        />
      </div>
      <div>
        <label for="horario_inicio"
          >Fecha de Apertura para inscribir horarios:</label
        >
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="horario_inicio"
          name="horario_inicio"
          value={config.horario_inicio}
          required
        />
      </div>
      <div>
        <label for="horario_fin">Fecha de Cierre para inscribir horarios:</label
        >
        <input
          class="input (date) h-10 p-2"
          type="date"
          id="horario_fin"
          name="horario_fin"
          value={config.horario_fin}
          required
        />
      </div>
      <button
        type="submit"
        class="bg-blue-600 text-white px-7 mt-5 py-2 rounded-full col-span-2 mx-auto"
        >Editar configuración</button
      >
    </form>
  </div>
</div>

<style>
  :global(.bx--form-requirement) {
    font-size: 12px;
    color: #db0098;
  }
</style>
