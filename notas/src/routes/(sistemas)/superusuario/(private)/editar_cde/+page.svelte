<script lang="ts">
  import { enhance } from "$app/forms";
  import type { TableSource, ToastSettings } from "@skeletonlabs/skeleton";
  import {
    toastStore,
    Toast,
    tableMapperValues,
    Table,
  } from "@skeletonlabs/skeleton";
  import type { ActionData, PageData } from "./$types";
  import type { SubmitFunction } from "@sveltejs/kit";
  import type { ControlEstudio, Docente } from "../../../../../app";
  import { triggerToast } from "$lib/utils/toast";

  export let form: ActionData;
  export let data: PageData;
  let identidad: string = "V";
  let cedula: number;
  let cedulaIdentidad = "";
  let correo = "";

  $: cedulaIdentidad = `${identidad}-${cedula}`;

  $: if (form?.message) {
    const t: ToastSettings = {
      message: form?.message,
    };

    toastStore.trigger(t);
  }

  const handleSubmit: SubmitFunction = ({ data, cancel }) => {
    data.append("cedula", cedulaIdentidad);
    return async ({ update }) => {
      await update();
    };
  };

  let sourceData = data.controlEstudio as unknown as ControlEstudio[];
  $: sourceData = data.controlEstudio as unknown as ControlEstudio[];

  let disabled = true;
  let cde: ControlEstudio;
  $: disabled = cde ? false : true;

  const handleClick = (e: CustomEvent) => {
    cedula = e.detail[0].split(/^(V-|E-)/g)[2];
    identidad = e.detail[0].split(/^(V-|E-)/g)[1].replace("-", "");
    cde = {
      cedula: "",
      correo: e.detail[1],
      nombre: e.detail[2],
      telefono: e.detail[3],
    };
  };

  let tableSource: TableSource = {
    head: ["Cédula", "Correo", "Nombre", "Teléfono"],
    body: tableMapperValues(sourceData, [
      "cedula",
      "correo",
      "nombre",
      "telefono",
    ]),
  };

  $: tableSource = {
    head: ["Cédula", "Correo", "Nombre", "Teléfono"],
    body: tableMapperValues(sourceData, [
      "cedula",
      "correo",
      "nombre",
      "telefono",
    ]),
  };
</script>

<svelte:head>
  <title>Editar personal | Super usuario | IUTEPAS</title>
</svelte:head>
<div
  class="container lg:w-2/3 md:w-3/4 mx-auto px-4 py-8 flex flex-col lg:flex-row justify-evenly items-start gap-3 rounded-xl min-h-[95vh]"
>
  {#if form?.message}
    <Toast position="t" />
  {/if}

  <section class="flex bg-white shadow rounded-xl">
    <div class="p-8 h-full w-1/2">
      <h2 class="text-2xl font-semibold mb-4 text-center">
        Editar Personal de Control de Estudio
      </h2>
      <form id="docente-form" method="post" use:enhance={handleSubmit}>
        <div class="mb-4">
          <label for="cedula" class="label">Cedula</label>
          <div
            class="input-group input-group-divider grid-cols-[auto_1fr_auto]"
          >
            <select class="select" bind:value={identidad} disabled>
              <option value="V">V</option>
              <option value="E">E</option>
            </select>
            <input
              type="number"
              bind:value={cedula}
              min="1000000"
              id="cedula"
              class="input (text) py-2 px-7"
              disabled
              required
            />
          </div>
        </div>
        <div class="mb-4">
          <label for="nombre" class="label">Nombre</label>
          <input
            type="text"
            id="nombre"
            value={cde?.nombre ?? ""}
            name="nombre"
            class="input (text) py-2 px-7"
            {disabled}
            required
          />
        </div>
        <div class="mb-4">
          <label for="correo" class="label">Correo</label>
          <input
            type="email"
            id="correo"
            name="correo"
            value={cde?.correo ?? ""}
            class="input (text) py-2 px-7"
            {disabled}
            required
          />
        </div>
        <div class="mb-4">
          <label for="telefono" class="label">Telefono</label>
          <input
            type="tel"
            id="telefono"
            name="telefono"
            class="input py-2 px-7"
            {disabled}
            value={cde?.telefono ?? ""}
            required
          />
        </div>
        <button
          type="reset"
          on:click={() => (disabled = true)}
          class="bg-pink-600 rounded-2xl mr-2 text-white px-4 py-2 rounded"
          >Resetear campos</button
        >
        <button
          type="submit"
          class="bg-blue-600 rounded-2xl text-white px-4 py-2 rounded"
          >Editar personal</button
        >
      </form>
    </div>

    <div class="p-8 h-full w-full">
      <h2 class="text-2xl font-semibold mb-4 text-center">
        Personal registrado
      </h2>
      <Table
        source={tableSource}
        interactive={true}
        regionBody="capitalize"
        on:selected={handleClick}
      />
    </div>
  </section>
</div>
