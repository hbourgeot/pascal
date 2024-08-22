<script lang="ts">
  import { enhance } from "$app/forms";
  import { triggerToast } from "$lib/utils/toast";
  import moment from "moment";
  import type { ActionData, PageData } from "./$types";
  import { DatePicker } from "attractions";
  import type { SubmitFunction } from "@sveltejs/kit";
  import { goto } from "$app/navigation";
  import { modalStore, type ModalSettings } from "@skeletonlabs/skeleton";

  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form.message);
    if (form.ok) {
      goto("/estudiantes");
    }
  }

  const date = new Date();
  let tomorrow = new Date(date);
  tomorrow.setDate(date.getDate() + 1);
  let nombre = data.estudiante.nombre;
  let cedula = data.estudiante.cedula;
  let correo = data.estudiante.correo;
  let estado = data.estudiante.estado;
  let carrera = data.estudiante.carrera;
  const carreras = data.carreras as { id: string; nombre: string }[];

  let telefonoInput = "";
  let prefijo: string = data.estudiante.telefono.slice(0, 4);
  let telefono: string = data.estudiante.telefono.slice(5);
  let semestre = data.estudiante.semestre.toString();
  let direccion = data.estudiante.direccion ?? "";
  let fecha: any =
    moment(data.estudiante.fecha_nac, "DD-MM-YYYY").toDate() ?? null;
  let edad: number = data.estudiante.edad ?? 1;
  let sexo: "M" | "F" = data.estudiante.sexo ?? "M";

  $: if (telefono.length > 7) {
    telefono = telefono.slice(0, 6);
  }
  $: telefonoInput = `${prefijo}-${telefono}`;

  const handleEstudiante: SubmitFunction = async ({ formData, cancel }) => {
    const clave: string | boolean = await new Promise<string | boolean>(
      (resolve) => {
        const modal: ModalSettings = {
          type: "prompt",
          // Data
          title: "Autorización",
          body: "Introduzca la clave para poder modificar los datos del estudiante",
          valueAttr: {
            type: "password",
            minlength: 3,
            maxlength: 20,
            required: true,
            class: "px-3 py-2 input (password)",
          },
          buttonTextConfirm: "Confirmar",
          buttonTextCancel: "Cancelar",
          buttonTextSubmit: "Confirmar",
          
          // Returns the updated response value
          response: (r: string | boolean) => resolve(r),
        };
        modalStore.trigger(modal);
      }
    );

    if (clave === false) {
      return cancel();
    }

    if (clave !== data.admin) {
      triggerToast("Clave inválida", 3000);
      return cancel();
    }
    formData.append("telefono", telefonoInput);
    formData.append(
      "fecha_nac",
      moment(fecha, "DD-MM-YYYY").format("DD-MM-YYYY")
    );
    return async ({ update }) => {
      await update();
    };
  };
</script>

<svelte:head>
  <title>Ver un estudiante - Administración IUTEPAS</title>
</svelte:head>
<section class="main w-full h-full flex flex-col justify-center items-center">
  <form
    method="POST"
    use:enhance="{handleEstudiante}"
    class="flex p-4 flex-col gap-y-3 w-1/2 h-[fit-content] bg-white rounded-lg"
  >
    <h3 class="text-4xl font-bold text-pink-500 text-center my-8">
      Datos del estudiante
    </h3>
    <div class="flex justify-between mb-3">
      <label for="cedula" class="w-full">
        <span class="w-1/2">Cédula de Identidad</span><input
          disabled
          type="text"
          name="cedula"
          class="w-4/5 input (text) text-blue-900 font-semibold rounded-lg px-5 py-2"
          bind:value="{cedula}"
        /></label
      >
      <label for="" class="flex flex-col w-2/4">
        Fecha de nacimiento
        <DatePicker
          format="%d-%m-%Y"
          right="{true}"
          inputClass="!rounded-lg"
          bind:value="{fecha}"
          disabledDates="{[{ start: tomorrow }]}"
        />
      </label>
    </div>
    <div class="flex justify-between items-top">
      <label for="edad" class="flex flex-col">
        Edad
        <input
          class="input (number) text-blue-900 font-semibold rounded-lg px-5 py-1"
          required
          type="number"
          min="1"
          bind:value="{edad}"
          max="100"
          name="edad"
          id="edad"
        />
      </label>
      <label for="sexo" class="flex flex-col w-1/3">
        Sexo
        <select
          name="sexo"
          id="sexo"
          bind:value="{sexo}"
          class="select text-blue-900 font-semibold rounded-lg px-5 w-full"
        >
          <option value="M">Masculino</option>
          <option value="F">Femenino</option>
        </select>
      </label>

      <label for="telefono" class="flex flex-col w-2/5">
        Teléfono del Estudiante
        <div class="flex justify-start input-group rounded-lg">
          <select
            bind:value="{prefijo}"
            name=""
            id="prefijo"
            class="select text-blue-900 font-semibold rounded-lg w-[100px]"
          >
            <option value="0412">0412</option>
            <option value="0414">0414</option>
            <option value="0424">0424</option>
            <option value="0416">0416</option>
            <option value="0426">0426</option>
          </select>
          <input
            class="input (number) text-blue-900 font-semibold rounded-lg"
            required
            type="number"
            minlength="7"
            maxlength="7"
            name=""
            id="telefonoinp"
            bind:value="{telefono}"
          />
        </div>
      </label>
    </div>
    <label for="nombre" class="flex flex-col">
      Nombres y Apellidos
      <input
        class="input (text) text-blue-900 font-semibold rounded-lg mt-1 mb-3 py-1 px-5"
        required
        type="text"
        name="nombre"
        bind:value="{nombre}"
        minlength="6"
        id="nombre"
      />
    </label>
    <label for="direccion" class="flex flex-col">
      Dirección
      <input
        class="input (text) text-blue-900 font-semibold rounded-lg mt-1 mb-3 py-1 px-5"
        required
        type="text"
        bind:value="{direccion}"
        name="direccion"
        minlength="6"
        id="direccion"
      />
    </label>
    <label for="email" class="flex flex-col">
      Correo Electrónico
      <input
        class="input (text) text-blue-900 font-semibold rounded-lg mt-1 mb-3 py-1 px-5"
        required
        type="email"
        bind:value="{correo}"
        name="correo"
        id="email"
      />
    </label>
    <div class="flex justify-start gap-x-4 w-full">
      <label for="semestre" class="flex flex-col w-1/6">
        Semestre
        <select
          name="semestre"
          id="semestre"
          bind:value="{semestre}"
          class="select text-blue-900 font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
        >
          <option value="1">1ero</option>
          <option value="2">2do</option>
          <option value="3">3ro</option>
          <option value="4">4to</option>
          <option value="5">5to</option>
          <option value="6">6to</option>
        </select>
      </label>
      <label for="carrera" class="flex flex-col w-3/6">
        Carrera Del Estudiante
        <select
          bind:value="{carrera}"
          name="carrera"
          id="carrera"
          class="select text-blue-900 font-semibold rounded-lg mt-1 mb-3 px-5 py-3"
        >
          {#each carreras as carrera}
            <option value="{carrera.id}" class="capitalize"
              >{carrera.nombre}</option
            >
          {/each}
        </select>
      </label>
      <label for="estado" class="flex flex-col w-2/6">
        Estado Del Estudiante
        <select
          bind:value="{estado}"
          name="estado"
          id="estado"
          class="select text-blue-900 font-semibold rounded-lg mt-1 mb-3 px-5 py-3"
        >
          <option value="nuevo ingreso">Nuevo ingreso</option>
          <option value="regular">Regular</option>
          <option value="repitiente">Repitiente</option>
          <option value="abandonó">Abandonó</option>
        </select>
      </label>
    </div>
    <div
      class="flex flex-col md:flex-row justify-center gap-4 items-center w-full p-3 py-9"
    >
      <button
        type="button" on:click="{() => window.history.back( )}"
        class="bg-sky-600 btn variant-filled rounded-lg text-light-50 !text-lg font-bold w-auto px-10 py-1"
        >Cancelar</button
      >
      <button
        type="submit"
        class="bg-pink-600 btn variant-filled rounded-lg text-light-50 !text-lg font-bold w-auto px-10 py-1"
        >Guardar cambios</button
      >
    </div>
  </form>
</section>

<style lang="scss">
  .main {
    height: calc(100vh - 100px);
  }

  :global(.text-field > input) {
    background-color: #e3e4ff !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
  }

  :global(.date-picker, .dropdown-shell, .handle, .text-field) {
    width: 100% !important;
  }
</style>
