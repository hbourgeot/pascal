<script lang="ts">
  import { browser } from "$app/environment";
  import { enhance } from "$app/forms";
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import { onMount } from "svelte";
  import type { ActionData, PageData, SubmitFunction } from "./$types";
  import { moneyUsdConverter } from "$lib/resources/moneyConverter";
  import {
    RadioGroup,
    RadioItem,
    Autocomplete,
    popup,
    SlideToggle,
  } from "@skeletonlabs/skeleton";
  import type {
    AutocompleteOption,
    PopupSettings,
  } from "@skeletonlabs/skeleton";
  import { DatePicker } from "attractions";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { X } from "@steeze-ui/tabler-icons";
  import { triggerToast } from "$lib/utils/toast";
  import moment from "moment";

  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form.message, 3000);
  }

  let billetes: { serial: string; monto: number }[] = [];
  let serialBillete = "";
  let montoBillete = "";
  let fecha_pago: any = new Date();
  let totalBilletes = 0;
  const date = new Date();
  let tomorrow = new Date(date);
  tomorrow.setDate(date.getDate() + 1);

  let venezolano: boolean = true;

  let estudiante = "";
  $: if (estudiante || venezolano) {
    if (estudiante.includes("-"))
      estudiante = venezolano
        ? estudiante.replace("E-", "V-")
        : estudiante.replace("V-", "E-");
    else estudiante = `${venezolano ? "V-" : "E-"}${estudiante}`;
  }

  function eliminarBillete(i: number) {
    let billete = billetes[i];
    billetes = billetes.filter((bill) => bill != billete);
    totalBilletes = billetes
      .map((billete) => billete.monto)
      .reduce((a, b) => a + b);
  }

  function addBillete() {
    if (montoBillete == "") {
      triggerToast("Por favor ingrese el monto del billete", 3000);
      return;
    }

    if (serialBillete == "") {
      triggerToast("Por favor digite el serial", 3000);
      return;
    }
    billetes = [
      ...billetes,
      { serial: serialBillete, monto: parseInt(montoBillete) },
    ];
    serialBillete = "";
    montoBillete = "";
    totalBilletes = billetes
      .map((billete) => billete.monto)
      .reduce((a, b) => a + b);
  }

  const handleSubmit: SubmitFunction = ({ formData, cancel }) => {
    if(!data.estudiantes.map(est => est.cedula).includes(estudiante)){
      triggerToast("No hay algún estudiante con esa cédula en nuestro sistema", 3000);
      return cancel();
    }
    if(!estudiante.includes('-')){
      triggerToast("Por favor, seleccione si el estudiante es extranjero o no", 3000)
      return cancel()
    }
    for (const billete of billetes) {
      formData.append("billetes", JSON.stringify(billete));
    }

    formData.append(
      "fecha_pago",
      moment(fecha_pago, "DD-MM-YYYY").format("YYYY-MM-DD")
    );

    return async ({ update }) => {
      await update();
    };
  };

  let selectedMetodo = "";
</script>

<svelte:head>
  <title>Registrar Pago - Administración IUTEPAS</title>
</svelte:head>
<main class="w-full">
  <div class="mx-auto lg:w-1/2 md:w-3/4 w-full p-4">
    <h1 class="text-2xl font-semibold mb-4">Formulario de Pago</h1>
    <form
      class="bg-white shadow-md rounded-lg px-8 pt-6 pb-8 flex flex-col gap-3"
      method="post"
      use:enhance="{handleSubmit}"
    >
      <!-- Campo: Cédula del Estudiante (Select) -->
      <div>
        <label
          class="text-gray-700 font-bold mb-2 label"
          for="cedula_estudiante">Estudiante</label
        >
        <SlideToggle
          name="slider-label"
          active="bg-primary-500"
          background="bg-primary-700"
          bind:checked="{venezolano}"
          >{venezolano ? "Es venezolano" : "Es extranjero"}</SlideToggle
        >

        <input
          class="input autocomplete px-3 py-2 rounded-lg"
          type="text"
          required
          minlength="3"
          name="cedula_estudiante"
          bind:value="{estudiante}"
          placeholder="V-12345678"
        />
      </div>
      <div>
        <label class="text-gray-700 font-bold mb-2 label" for="concepto"
          >Concepto del pago</label
        >
        <select
          class="select p-[10px] rounded-lg capitalize"
          name="descripcion"
          id="concepto"
          required
        >
          <option value="pre_inscripcion">Pre Inscripción</option>
          <option value="inscripcion">Inscripción</option>
          <option value="cuota1">Cuota 1</option>
          <option value="cuota2">Cuota 2</option>
          <option value="cuota3">Cuota 3</option>
          <option value="cuota4">Cuota 4</option>
          <option value="cuota5">Cuota 5</option>
        </select>
      </div>
      <div>
        <label for="fecha" class="text-gray-700 font-bold mb-2 label"
          >Fecha del Pago</label
        >
        <DatePicker
          format="%d-%m-%Y"
          right="{true}"
          bind:value="{fecha_pago}"
          inputClass="!rounded-lg"
          disabledDates="{[{ start: tomorrow }]}"
        />
      </div>
      <div>
        <!-- Campo: Método de Pago (Radio Buttons) -->
        <label for="" class="label text-gray-700 font-bold"
          >Método de Pago</label
        >
        <RadioGroup
          name="metodo_pago"
          active="variant-filled-primary"
          hover="hover:variant-soft-primary"
          rounded="rounded-lg"
          display="flex"
          class="justify-evenly"
          required
        >
          <RadioItem
            bind:group="{selectedMetodo}"
            name="metodo" required
            value="Transferencia">Transferencia</RadioItem
          >
          <RadioItem
            bind:group="{selectedMetodo}"
            name="metodo" required
            value="Efectivo">Efectivo</RadioItem
          >
          <RadioItem bind:group="{selectedMetodo}" required name="metodo" value="Punto"
            >Punto</RadioItem
          >
        </RadioGroup>
      </div>
      <!-- Campos de Entidades Dependiendo del Método de Pago -->
      <!-- Campo: Monto -->
      <div>
        <label class="label text-gray-700 font-bold mb-2" for="monto"
          >Monto {selectedMetodo === "Efectivo"
            ? "del pago total ($)"
            : "(Bs.)"}</label
        >
        <input
          class="input (number) w-full py-2 px-3 rounded-lg"
          id="monto"
          name="monto"
          min="1"
          type="number"
          required
          placeholder="Monto"
          step="0.01"
        />
      </div>

      <!-- Campo: Referencia de Transferencia (solo si es Transferencia) -->
      {#if selectedMetodo === "Transferencia"}
        <div class="mb-4">
          <label
            class="label text-gray-700 font-bold mb-2"
            for="referencia_transferencia">Referencia de la Transferencia</label
          >
          <input
            class="input (number) rounded w-full py-2 px-3"
            id="referencia_transferencia"
            name="referencia_transferencia"
            type="text"
            required
            placeholder="Referencia de Transferencia"
          />
        </div>
      {/if}
      {#if selectedMetodo === "Efectivo"}
        <div class="mb-4 flex justify-between items-center gap-x-5">
          <div>
            <label class="label text-gray-700 font-bold mb-2" for="serial"
              >Serial del billete</label
            >
            <input
              class="input (number) rounded w-full py-2 px-3"
              id="serial"
              type="text"
              bind:value="{serialBillete}"
              placeholder="LDE..."
            />
          </div>
          <div>
            <label class="label text-gray-700 w-full font-bold mb-2" for="serial"
              >Monto del billete</label
            >
            <select
              class="select rounded w-[175px] py-3 px-3"
              id="monto-billete"
              bind:value="{montoBillete}"
              placeholder="1"
            >
              <option value="1">1$</option>
              <option value="5">5$</option>
              <option value="10">10$</option>
              <option value="20">20$</option>
              <option value="50">50$</option>
              <option value="100">100$</option>
            </select>
          </div>
          <button
            type="button"
            class="btn variant-filled-primary bg-pink-600 w-fit px-5 h-fit"
            on:click="{addBillete}">Añadir billete</button
          >
        </div>
        {#if billetes.length > 0}
          <table class="table">
            <thead>
              <th class="text-left !text-lg">Serial</th>
              <th class="text-left !text-lg">Monto</th>
              <th class="text-left !text-lg">Eliminar</th>
            </thead>
            <tbody>
              {#each billetes as billete, i}
                <!-- TODO: Agregar boton para eliminar el item -->
                <tr>
                  <td class=" !text-lg">{billete.serial}</td>
                  <td class=" !text-lg">{billete.monto}$</td>
                  <td class="!w-fit !text-lg"
                    ><button
                      class="btn variant-filled-surface rounded-full p-1"
                      on:click="{() => eliminarBillete(i)}"
                      ><Icon src="{X}" class="h-4 w-4" /></button
                    ></td
                  >
                </tr>
              {/each}
            </tbody>
            <tfoot>
              <tr>
                <th>Total</th>
                <th></th>
                <th>{totalBilletes}$</th>
              </tr>
            </tfoot>
          </table>
        {/if}
      {/if}

      <!-- Botón Enviar -->
      <div class="flex items-center justify-between">
        <button
          class="btn variant-filled-primary bg-pink-500 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="submit"
        >
          Realizar Pago
        </button>
      </div>
    </form>
  </div>
</main>

<style>
  :global(.text-field > input) {
    background-color: #e3e4ff !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
  }

  :global(.date-picker, .dropdown-shell, .handle, .text-field) {
    width: 100% !important;
  }

  main{
    min-height: calc(100vh - 65px);
    overflow-y: visible;
  }
</style>
