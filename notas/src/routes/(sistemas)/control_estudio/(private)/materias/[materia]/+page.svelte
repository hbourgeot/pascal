<script lang="ts">
  import { enhance } from "$app/forms";
  import type { ActionData, PageData } from "./$types";
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
  import type { Notas } from "../../../../../../app";
  import { ExpandLess, ExpandMore } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ChevronDown, FileDownload } from "@steeze-ui/tabler-icons";
  import type { SubmitFunction } from "@sveltejs/kit";
  import pascalConFondo from "$lib/images/pascalConFondo.png";

  export let data: PageData;
  export let form: ActionData;

  let printBtn: HTMLButtonElement;
  let header: HTMLElement;

  const print = () => {
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
    document.querySelector(".formField")?.classList.toggle("hidden");
    window.print();
    header.classList.toggle("hidden");
    header.classList.toggle("flex");
    document.querySelector(".app-bar")?.classList.toggle("hidden");
    document.querySelector(".formField")?.classList.toggle("hidden");
  };

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
      "Nombre",
      "Cédula",
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

  let estudianteFind: any = {
    nombre: "",
    cedula: "",
    nota1: 0,
    nota2: 0,
    nota3: 0,
  };

  $: if (estudiante)
    estudianteFind = sourceData.find((item: any) => {
      return item.cedula === estudiante;
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

  $: tableSource = {
    head: [
      "Nombre",
      "Cédula",
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

  $: sourceData = data.estudiantes.map((nota: any) => ({
    nombre: nota.nombre,
    cedula: nota.cedula,
    nota1: nota.nota1,
    nota2: nota.nota2,
    nota3: nota.nota3,
    promedio: nota.promedio,
  }));

  const handleSubmit: SubmitFunction = async ({ cancel }) => {
    let response = await new Promise<string>((resolve) => {
      const modal: ModalSettings = {
        type: "prompt",
        // Data
        title: "Espere un momento",
        body: "Ingrese la clave para poder modificar la nota",

        // Populates the input value and attributes
        value: "",
        valueAttr: {
          type: "password",
          minlength: 3,
          maxlength: 10,
          required: true,
        },
        buttonTextSubmit: "Enviar",
        buttonTextCancel: "Cancelar",
        // Returns the updated response value
        response: (r: string) => resolve(r),
      };
      modalStore.trigger(modal);
    });

    if (!response) {
      return cancel();
    }

    if (response != "1234") {
      triggerToast("Clave inválida, intente de nuevo");
      return cancel();
    }

    return async ({ update }) => {
      await update();
    };
  };
</script>

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

<main class="flex justify-center items-center bg-transparent">
  <section class="w-full h-[90vh] p-5">
    <Table
      source={tableSource}
      interactive={true}
      on:selected={handleSelect}
      regionCell="capitalize"
      regionHeadCell="text-center"
      class="mt-12"
    />
  </section>
  <section class="w-full sticky formField">
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
          class="w-full input outline-none"
        />
      </span>
      <span class="w-[30%]">
        <label for="corte" class="relative">
          Corte
          <select
            class="select outline-none text-ellipsis"
            name="nombre_campo"
            id="corte"
            bind:value={toChange}
          >
            <option value="0" disabled>Seleccione una nota a cambiar</option>
            <option value="1">1er corte</option>
            <option value="2">2do corte</option>
            <option value="3">3er corte</option>
          </select>
          <Icon src={ChevronDown} class="absolute w-5 h-5 top-10 right-2" />
        </label>
      </span>
      <span class="w-[30%]">
        <label for="calificacion"> Nota </label>
        <input
          name="valor"
          type="number"
          bind:value={nota}
          id="calificacion"
          class="input outline-none"
        />
      </span>

      <div class="w-full p-4 flex justify-center gap-8 mt-8">
        <button
          on:click={() => {
            estudiante = "";
            nota = 0;
            toChange = "0";
          }}
          class="bg-pink-600 p-4 w-52 text-white rounded-xl">Cancelar</button
        >
        <button class="bg-[#006FB0] text-white p-4 w-52 rounded-xl"
          >Editar</button
        >
      </div>
    </form>
  </section>
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

  .select {
    appearance: none;
  }

  main {
    min-height: calc(100vh - 80px);
  }

  /*span label {
    margin-bottom: 8px;
  }*/

  :global(.modal-prompt-input) {
    padding: 10px;
  }
</style>
