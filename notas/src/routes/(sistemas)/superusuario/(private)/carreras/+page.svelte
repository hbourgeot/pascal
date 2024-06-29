<script lang="ts">
  import { enhance } from "$app/forms";
  import type { TableSource, ToastSettings } from "@skeletonlabs/skeleton";
  import {
    toastStore,
    Toast,
    tableMapperValues,
    Table,
    SlideToggle,
  } from "@skeletonlabs/skeleton";
  import type { ActionData, PageData } from "./$types";
  import type { SubmitFunction } from "@sveltejs/kit";
  import type { Docente } from "../../../../../app";
  import { triggerToast } from "$lib/utils/toast";
  import type { Coordinacion } from "../../../../../app";
  import type { Unlink } from "@steeze-ui/tabler-icons";

  export let form: ActionData;
  export let data: PageData;

  let carreraId = "";
  let nombreCarrera = "";

  let isEditar = false;

  const handleSubmit: SubmitFunction = ({ data, cancel }) => {
    if (!isEditar) {
      if (sourceData.find((carrera) => carrera.id === carreraId)) {
        triggerToast(
          `La carrera con el código ${carreraId} ya ha sido previamente registrado, pruebe con otro`
        );
        return cancel();
      }

      if (sourceData.find((carrera) => carrera.nombre === nombreCarrera)) {
        triggerToast(
          `${nombreCarrera} ya ha sido previamente registrado, pruebe con otro`
        );
        return cancel();
      }
    }
    return async ({ update }) => {
      await update();
      isEditar = false;
    };
  };

  let sourceData = data.carreras as unknown as { id: string; nombre: string }[];

  let tableSource: TableSource = {
    head: ["Código", "Nombre"],
    body: tableMapperValues(sourceData, ["id", "nombre"]),
  };

  $: sourceData = data.carreras as unknown as { id: string; nombre: string }[];

  $: tableSource = {
    head: ["Código", "Nombre"],
    body: tableMapperValues(sourceData, ["id", "nombre"]),
  };

  const handleClick = (e: CustomEvent) => {
    carreraId = e.detail[0];
    nombreCarrera = e.detail[1];
  };
</script>

<svelte:head>
  <title>Carreras | Super usuario | IUTEPAS</title>
</svelte:head>
<div
  class="container lg:w-2/3 md:w-3/4 mx-auto px-4 py-8 flex flex-col lg:flex-row justify-evenly items-center rounded-xl"
>
  {#if form?.message}
    <Toast position="t" />
  {/if}
  <div
    class="p-8 rounded-xl shadow h-full w-1/2 flex flex-col justify-center bg-white"
  >
    <h2 class="text-2xl font-semibold mb-4 text-center">
      {#if isEditar}Editar{:else}Agregar{/if} Carrera
    </h2>
    <form id="docente-form" method="post" use:enhance={handleSubmit}>
      <div class="mb-4">
        <label for="cedula" class="label">Código</label>
        <input
          type="text"
          bind:value={carreraId}
          id="id"
          name="id"
          readonly={isEditar}
          class="input (text) py-2 px-7"
          required
        />
      </div>
      <div class="mb-4">
        <label for="nombre" class="label">Nombre</label>
        <input
          type="text"
          id="nombre"
          disabled={isEditar && nombreCarrera == ""}
          bind:value={nombreCarrera}
          name="nombre"
          class="input (text) py-2 px-7"
          required
        />
      </div>
      {#if !isEditar}
        <button
          type="submit"
          formaction="?/post"
          class="bg-blue-600 text-white px-4 py-2 rounded">Guardar</button
        >
      {:else}
        <button
          type="submit"
          formaction="?/put"
          class="bg-blue-600 text-white px-4 py-2 rounded">Guardar</button
        >
      {/if}
    </form>

    <SlideToggle
      bind:checked={isEditar}
      name="isEditar"
      active="bg-primary-500"
      class="my-3"
      size="lg">Cambiar modo</SlideToggle
    >
  </div>

  <div
    class="p-8 rounded-xl shadow h-full w-full flex flex-col justify-center bg-white"
  >
    <h2 class="text-2xl font-semibold mb-4 text-center">
      Carreras registradas
    </h2>
    <Table
      source={tableSource}
      interactive={isEditar}
      on:selected={handleClick}
    />
  </div>
</div>

<style>
  .container {
    height: calc(100vh - 82px);
  }
</style>
