<script lang="ts">
  import { enhance } from "$app/forms";
  import type { PaginationSettings, TableSource } from "@skeletonlabs/skeleton";
  import { Paginator, tableMapperValues, Table } from "@skeletonlabs/skeleton";
  import type { ActionData, PageData } from "./$types";
  import type { SubmitFunction } from "@sveltejs/kit";
  import type { Docente } from "../../../../../app";
  import { triggerToast } from "$lib/utils/toast";
  import { invalidateAll } from "$app/navigation";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { FileDownload } from "@steeze-ui/tabler-icons";

  export let form: ActionData;
  export let data: PageData;
  let identidad: string = "V";
  let cedula: number;
  let cedulaIdentidad = "";
  let correo = "";

  $: cedulaIdentidad = `${identidad}-${cedula}`;

  $: if (form?.message) {
    triggerToast(form?.message);
  }

  const handleSubmit: SubmitFunction = ({ data, cancel }) => {
    if (sourceData.find((docente) => docente.cedula === cedulaIdentidad)) {
      triggerToast(
        `El docente con la cédula ${cedulaIdentidad} ya ha sido previamente registrado, pruebe con otra`
      );
      return cancel();
    }

    if (sourceData.find((docente) => docente.correo === correo)) {
      triggerToast(
        `El docente con el correo ${correo} ya ha sido previamente registrado, pruebe con otro`
      );
      return cancel();
    }
    data.append("cedula", cedulaIdentidad);
    return async ({ update }) => {
      await update();
    };
  };

  let docentes = data.docentes as unknown as Docente[];
  let sourceData = docentes;

  let tableSource: TableSource = {
    head: ["Cédula", "Correo", "Nombres y Apellidos", "Teléfono"],
    body: tableMapperValues(sourceData, [
      "cedula",
      "correo",
      "nombre",
      "telefono",
    ]),
  };

  let paginationSettings = {
    limit: 3,
    size: sourceData.length,
    amounts: [1, 3, 5, 10],
    offset: 0,
  };

  $: docentes = data.docentes as unknown as Docente[];
  $: sourceData = docentes.slice(
    paginationSettings.offset * paginationSettings.limit,
    paginationSettings.offset * paginationSettings.limit +
      paginationSettings.limit
  );
  $: tableSource = {
    head: ["Cédula", "Correo", "Nombres y Apellidos", "Teléfono"],
    body: tableMapperValues(sourceData, [
      "cedula",
      "correo",
      "nombre",
      "telefono",
    ]),
  };

  const generate = async () => {
    try {
      const response = await fetch(`/api/archivos/docenteria`);

      const el = document.createElement("a");
      const file = await response.blob();
      const fileHref = URL.createObjectURL(file);
      el.href = fileHref;
      el.download = `lista_docentes_materias.pdf`;
      el.click();
    } catch (e) {
      console.error(e);
    }
  };
</script>

<svelte:head>
  <title>Registrar docentes | Coordinadores | IUTEPAS</title>
</svelte:head>
<div class="h-screen flex flex-col lg:justify-center lg:items-center relative">
  <button
    type="button"
    on:click={generate}
    class="bg-blue-600 text-white px-4 py-2 rounded-full absolute top-5 right-5 flex gap-3"
    ><Icon src={FileDownload} /> Lista de docentes con materias</button
  >
  <div
    class="container h-auto lg:w-2/3 md:w-3/4 mx-auto px-4 py-8 flex flex-col lg:flex-row justify-evenly items-center gap-3 rounded-xl bg-white"
  >
    <div class="p-8 w-full max-w-[410px] rounded-xl shadow h-full lg:w-1/2">
      <h2 class="text-2xl font-semibold mb-4 text-center">Añadir Docente</h2>
      <form id="docente-form" method="post" use:enhance={handleSubmit}>
        <div class="mb-4">
          <label for="cedula" class="label">Cédula</label>
          <div
            class="input-group input-group-divider grid-cols-[auto_1fr_auto]"
          >
            <select class="select" bind:value={identidad}>
              <option value="V">V</option>
              <option value="E">E</option>
            </select>
            <input
              type="number"
              bind:value={cedula}
              min="1000000"
              id="cedula"
              class="input (text) py-2 px-7"
              required
            />
          </div>
        </div>
        <div class="mb-4">
          <label for="nombre" class="label">Nombres y apellidos</label>
          <input
            type="text"
            id="nombre"
            name="nombre"
            class="input (text) py-2 px-7"
            required
          />
        </div>
        <div class="mb-4">
          <label for="correo" class="label">Correo</label>
          <input
            type="email"
            id="correo"
            name="correo"
            bind:value={correo}
            class="input (text) py-2 px-7"
            required
          />
        </div>
        <div class="mb-4">
          <label for="telefono" class="label">Teléfono</label>
          <input
            type="tel"
            id="telefono"
            name="telefono"
            class="input py-2 px-7"
            required
          />
        </div>
        <button
          type="submit"
          class="bg-blue-600 text-white px-4 py-2 rounded-full"
          >Registrar docente</button
        >
      </form>
    </div>

    <div class="p-8 rounded-xl shadow h-full w-full">
      <h2 class="text-2xl font-semibold mb-4 text-center">
        Docentes registrados
      </h2>
      <Table source={tableSource} />
      <Paginator
        bind:settings={paginationSettings}
        showFirstLastButtons={true}
        amountText="registros"
        class="my-3"
        separatorText="de"
      />
    </div>
  </div>
</div>
