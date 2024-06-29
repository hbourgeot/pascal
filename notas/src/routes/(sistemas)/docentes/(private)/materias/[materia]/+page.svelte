<script lang="ts">
  import { enhance } from "$app/forms";
  import type { ActionData, PageData, SubmitFunction } from "./$types";
  import {
    FileDropzone,
    Modal,
    modalStore,
    Table,
  } from "@skeletonlabs/skeleton";
  import type {
    TableSource,
    ModalSettings,
    ModalComponent,
  } from "@skeletonlabs/skeleton";
  import { tableMapperValues } from "@skeletonlabs/skeleton";
  import { triggerToast } from "$lib/utils/toast";
  import ModalFile from "$lib/components/ModalFile.svelte";
  import { onMount } from "svelte";
  import { ExpandLess, ExpandMore } from "@steeze-ui/material-design-icons";

  import { Icon } from "@steeze-ui/svelte-icon";
  import pascalConFondo from "$lib/images/pascalConFondo.png";
  import { FileDownload } from "@steeze-ui/tabler-icons";

  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form?.message);
  }

  let sourceData = data.estudiantes.map((nota: any) => ({
    nombre: nota.nombre,
    cedula: nota.cedula,
    nota1: nota.nota1,
    nota2: nota.nota2,
    nota3: nota.nota3,
    promedio: nota.promedio,
  }));

  let tableSource: TableSource = {
    head: [
      "Nombre completo",
      "C.I.",
      "1er corte",
      "2do corte",
      "3er corte",
      "Promedio",
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

  let estudiante: string = "";
  let campo: string = "";
  let nota: number = 0;
  let toChange: string = "0";

  let uploadForm: HTMLFormElement;
  let myFile: any;
  let downloadFile: string;

  let estudianteFind: any = {
    nombre: "",
    cedula: "",
    nota1: 0,
    nota2: 0,
    nota3: 0,
  };
  $: if (estudiante) {
    estudianteFind = data.estudiantes.find(
      (item: any) => item.cedula === estudiante
    );
  }

  $: sourceData = data.estudiantes.map((nota: any) => ({
    nombre: nota.nombre,
    cedula: nota.cedula,
    nota1: nota.nota1,
    nota2: nota.nota2,
    nota3: nota.nota3,
    promedio: nota.promedio,
  }));

  $: tableSource = {
    head: [
      "Nombre completo",
      "C.I.",
      "1er corte",
      "2do corte",
      "3er corte",
      "Promedio",
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

  let printBtn: HTMLButtonElement;
  let header: HTMLElement;
  let sidebar: HTMLElement;

  const print = () => {
    header.classList.toggle("hidden");
    header.classList.toggle("flex");

    sidebar.classList.toggle("hidden");
    document.querySelector(".app-bar")?.classList.toggle("hidden");

    window.print();

    header.classList.toggle("hidden");
    header.classList.toggle("flex");

    sidebar.classList.toggle("hidden");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
  };

  onMount(async () => {
    const response = await fetch(
      //@ts-ignore
      `/api/archivos?ciclo=${data.ciclo}&folder=${data.materia.id}`
    );
    const contentType = response.headers.get("content-type");
    if (contentType && !contentType.includes("application/json")) {
      const file = await response.blob();
      downloadFile = URL.createObjectURL(file);
    } else {
      downloadFile = "";
    }
  });

  const handleSelect = (e: CustomEvent) => {
    estudiante = e.detail[1];
    switch (toChange) {
      case "1":
        campo = "nota1";
        nota = e.detail[2];
        break;
      case "2":
        campo = "nota2";
        nota = e.detail[3];
        break;
      case "3":
        campo = "nota3";
        nota = e.detail[4];
        break;
    }
  };

  const modalComponentRegistry: Record<string, ModalComponent> = {
    // Custom Modal 1
    modalFile: {
      // Pass a reference to your custom component
      ref: ModalFile,
    },
  };

  const handleForm = async () => {
    try {
      myFile = await new Promise<FileList>((resolve) => {
        const modal: ModalSettings = {
          type: "component",
          // Pass the component registry key as a string:
          component: "modalFile",
          title: "Agregar archivo",
          body: "Sube tu planificación en formato PDF",
          response: (r: FileList) => {
            resolve(r);
          },
        };
        modalStore.trigger(modal);
      });

      myFile = myFile.item(0);

      myFile = myFile; // Force Svelte
      uploadForm.requestSubmit();

      triggerToast("Planificacion cargada exitosamente");
    } catch (error) {
      console.error("An error occurred:", error);
    }
  };

  const handleSubmit: SubmitFunction = ({ formData, cancel }) => {
    if (estudiante == "") {
      triggerToast("Por favor seleccione un estudiante");
      return cancel();
    }

    if (toChange == "0") {
      triggerToast("Por favor seleccione un corte");
      return cancel();
    }

    return async ({ update }) => {
      await update();
      estudiante = "";
    };
  };
</script>

<svelte:head>
  <title>{data.materia.nombre} | Docentes | IUTEPAS</title>
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
<main
  class="flex justify-center items-baseline bg-transparent h-[calc(100vh-80px)]"
>
  <section class="w-full p-5">
    <h1 class="text-3xl font-bold text-primary-500 my-4">
      Notas de estudiantes en <span class="text-secondary-500 normal-case"
        >{data.materia.nombre}</span
      >
    </h1>
    {#if sourceData[0].cedula !== null}
      <Table
        source={tableSource}
        interactive={true}
        on:selected={handleSelect}
        regionBody="capitalize"
      />
    {:else}
      <h3 class="text-xl font-bold">
        La materia no tiene estudiantes registrados
      </h3>
    {/if}
  </section>
  <section class="w-full sticky" bind:this={sidebar}>
    <div
      class="flex mt-16 flex-wrap justify-around w-[80%] mx-auto h-auto border rounded-2xl border-dark-100 bg-white p-5"
    >
      <button
        bind:this={printBtn}
        class="btn bg-pink-600 text-white save"
        on:click={print}
      >
        <Icon class="w-8 h-8" src={FileDownload} />

        Descargar Notas
      </button>
    </div>
    {#if sourceData[0].cedula !== null}
      <form
        use:enhance={handleSubmit}
        method="post"
        class="flex mt-16 flex-wrap justify-around w-[80%] mx-auto h-auto border rounded-2xl border-dark-100 bg-white"
      >
        <h3 class="w-full pt-4 pl-8 text-black pb-4 text-2xl">
          Asignacion de Notas
        </h3>
        <span class="w-[30%]">
          <label for="estudiante"> Estudiante </label>
          <input
            readonly
            bind:value={estudiante}
            type="text"
            id="estudiante"
            name="cedula_estudiante"
            required
            class="w-full input"
          />
        </span>
        <span class="w-[30%]">
          <label for="corte"> Corte </label>
          <select
            class="select"
            name="nombre_campo"
            required
            disabled={!estudiante.length ? true : false}
            id="corte"
            bind:value={toChange}
          >
            <option value="0" disabled>Seleccione una nota a cambiar</option>
            <option value="1" disabled={estudianteFind.nota1 != 0}
              >1er corte</option
            >
            <option value="2" disabled={estudianteFind.nota2 != 0}
              >2do corte</option
            >
            <option value="3" disabled={estudianteFind.nota3 != 0}
              >3er corte</option
            >
          </select>
        </span>
        <span class="w-[30%]">
          <label for="calificacion"> Nota </label>
          <input
            disabled={!estudiante.length ? true : false}
            name="valor"
            type="number"
            required
            bind:value={nota}
            id="calificacion"
            class="input"
          />
        </span>

        <div class="w-full p-4 flex justify-center gap-8 mt-8">
          <button
            type="button"
            disabled={!estudiante.length ? true : false}
            on:click={() => {
              estudiante = "";
              nota = 0;
              toChange = "0";
            }}
            class="bg-pink-600 p-4 w-52 text-white rounded-xl">Cancelar</button
          >
          <button
            class="bg-[#006FB0] text-white p-4 w-52 rounded-xl"
            disabled={!estudiante.length ? true : false}
            formaction="?/notas">Editar</button
          >
        </div>
        <details
          class="flex w-full my-5 mx-auto flex-col items-center justify-center"
        >
          <summary
            class=" flex w-full h-[40px] items-center gap-4 pl-4 rounded border border-gray-200"
          >
            <span class="expand">
              <Icon src={ExpandMore} class="icon " />
            </span>
            <span class="expanded">
              <Icon src={ExpandLess} class="icon " />
            </span>
            ¿Hay alguna nota errónea?
          </summary>

          <form
            action="?/peticion"
            method="post"
            class="flex mt-16 flex-wrap justify-around w-[80%] mx-auto h-auto rounded-2xl gap-2"
          >
            <span class="w-[48%]">
              <label for="estudiante_peticion"> Estudiante </label>
              <input
                readonly
                bind:value={estudiante}
                type="text"
                id="estudiante_peticion"
                name="id_estudiante"
                class="w-full input"
              />
            </span>
            <span class="w-[48%]">
              <label for="corte_peticion"> Corte </label>
              <select class="select" name="nombre_campo" id="corte_peticion">
                <option value="0" disabled>Seleccione una nota a cambiar</option
                >
                <option value="1" disabled={estudianteFind.nota1 == 0}
                  >1er corte</option
                >
                <option value="2" disabled={estudianteFind.nota2 == 0}
                  >2do corte</option
                >
                <option value="3" disabled={estudianteFind.nota3 == 0}
                  >3er corte</option
                >
              </select>
            </span>
            <span class="w-full">
              <label for="descripcion_peticion"> Descripción </label>
              <textarea
                rows="3"
                name="descripcion"
                id="descripcion_peticion"
                class="input rounded-2xl p-3"
              />
            </span>
            <button type="submit" class="btn variant-filled"
              >Pedir permiso</button
            >
          </form>
        </details>
      </form>
    {/if}
    <div
      class="bg-white flex mt-16 flex-wrap justify-around w-[80%] mx-auto h-auto border rounded-2xl border-dark-100"
    >
      <h3 class="w-full pt-4 pl-8 text-black pb-4 text-2xl">
        Cargar planificación
      </h3>
      <button class="btn variant-filled" on:click={() => handleForm()}
        >Cargar</button
      >
    </div>
  </section>
  <form
    action="?/carga"
    method="post"
    use:enhance={({ data }) => {
      data.set("files", myFile);
      return async ({ update }) => {
        await update();
      };
    }}
    class="hidden"
    bind:this={uploadForm}
  >
    <FileDropzone name="files" bind:files={myFile} />
  </form>
  <Modal components={modalComponentRegistry} />
</main>

<style>
  input,
  select {
    width: 100%;
    border: 1px solid gray;
    padding: 14px;
    border-radius: 8px;
  }
  span label {
    margin-bottom: 8px;
  }

  details .expanded {
    display: none;
  }

  details[open] .expanded {
    display: flex;
  }

  details[open] .expand {
    display: none;
  }

  textarea {
    resize: vertical;
  }
</style>
