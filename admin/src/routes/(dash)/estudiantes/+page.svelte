<script lang="ts">
  import { createSearchStore, searchHandler } from "$lib/resources/store";
  import { onDestroy } from "svelte";
  import type { Estudiante } from "../../../app";
  import type { ActionData, PageData, SubmitFunction } from "./$types";
  import ModalLarge from "$lib/components/ModalLarge.svelte";
    import DatePicker from "$lib/components/DatePicker.svelte";;
  import { enhance } from "$app/forms";
  import { browser } from "$app/environment";
  import moment from "moment"
  import { triggerToast } from "$lib/utils/toast";

  export let data: PageData;
  export let form: ActionData;

  $: if (form?.message) {
    triggerToast(form.message, 3000);
  }

  const carreras = data.carreras;

  const date = new Date();
  let formEl: HTMLFormElement;
  let tomorrow = new Date(date);
  tomorrow.setDate(date.getDate() + 1);
  let estado: string = "nuevo ingreso";
  let documento: string = "V";
  let addStudent: boolean = false;
  let cedula: string = "";
  let cedulaInput: string = "";
  let prefijo: string = "0412";
  let telefonoInput: string = "";
  let telefono: string = "";
  $: cedula = `${documento}-${cedulaInput}`;
  $: telefono = `${prefijo}-${telefonoInput}`;

  let estudiantes: Estudiante[] = data.estudiantes;
  $: estudiantes = data.estudiantes;
  let estudiantesTerms = estudiantes.map((estudiante) => ({
    ...estudiante,
    searchTerms: `${estudiante.cedula} ${estudiante.cedula.replace(
      "V-" || "E-",
      ""
    )} ${estudiante.correo} ${estudiante.estado} ${
      estudiante.telefono
    } ${carreras.find((carrera: any) => carrera.id == estudiante.carrera)?.nombre.toLowerCase()} ${
      estudiante.semestre
    }to ${estudiante.nombre.toLowerCase()}`,
  }));

  const estudianteSearch = createSearchStore(estudiantesTerms);
  $: if (telefonoInput.toString().length > 7) {
    telefonoInput = telefonoInput.toString().slice(0, 7);
  }

  const unsubscribe = estudianteSearch.subscribe((model) =>
    searchHandler(model)
  );
  onDestroy(() => {
    unsubscribe();
  });

  const months = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];

  let semestre = "";
  let edad = 0;
  let carreraSeleccionada = "";
  let search = "";
  let fecha: any = null;

  const handleSubmit: SubmitFunction = ({ formData, cancel }) => {
    if (estudiantes.find((estudiante) => estudiante.cedula === cedula)) {
      triggerToast("Ya existe un estudiante con esa cédula, introduzca otra", 3000);
      return cancel();
    }

    if(documento == "V" && cedula.length > 10){
      triggerToast("Si el estudiante es venezolano, por favor digite una cédula de máximo 8 dígitos")
      return cancel();
    }

    if(documento=="E" && cedula.length > 12){
      triggerToast("La población de la tierra no sobrepasa los 10 dígitos")
      return cancel()
    }
    formData.append("cedula", cedula);
    formData.append("telefono", telefono);
    formData.append('fecha_nac', moment(fecha, "DD-MM-YYYY").format("DD-MM-YYYY"))

    return async ({ update, formElement }) => {
      await update();
      formElement.reset()
    };
  };

</script>

<svelte:head>
  <title>Estudiantes - Administración IUTEPAS</title>
</svelte:head>

<section
  class="main w-full flex flex-col justify-evenly items-center p-7"
>
  <div
    class="flex absolute top-5 right-5 self-end justify-around items-center w-[auto]"
  >
    <button
      type="button"
      class="rounded-lg bg-sky-600 text-white font-bold py-3 px-5 btn variant-filled"
      on:click="{() => (addStudent = true)}">Agregar Estudiante</button
    >
  </div>
  <section
    class="flex flex-col justify-evenly w-3/4 font-bold self-center gap-y-5"
  >
    <h2
      class="text-sky-600 !justify-self-start text-5xl text-center font-extrabold"
    >
      Estudiantes
    </h2>
    <div class="flex justify-around">
      <label for="carrera" class="flex flex-col w-1/4 label">
        Seleccione la carrera
        <select
          name="carrera"
          id="carrera"
          class="select font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
          bind:value="{carreraSeleccionada}"
          on:change="{() =>
            ($estudianteSearch.search = `${carreraSeleccionada} ${semestre}`)}"
        >
          <option value="disabled" disabled>Filtrar por carrera</option>
          <option value="">Todas las carreras</option>
          {#each carreras as carrera}
            <option value="{carrera.nombre.toLowerCase()}">{carrera.nombre}</option>
          {/each}
        </select>
      </label>
      <label for="semestre" class="flex flex-col w-1/4">
        Seleccione el semestre
        <select
          name="semestre"
          id="semestre"
          bind:value="{semestre}"
          on:change="{() =>
            ($estudianteSearch.search = `${carreraSeleccionada} ${semestre}`)}"
          class="select font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
        >
          <option value="disabled" disabled>Filtrar por semestre</option>
          <option value="">Todos los semestres</option>
          <option value="1to">1ro</option>
          <option value="2to">2do</option>
          <option value="3to">3ro</option>
          <option value="4to">4to</option>
          <option value="5to">5to</option>
          <option value="6to">6to</option>
        </select>
      </label>
      <label for="personalizado" class="flex flex-col w-1/4">
        Búsqueda personalizada
        <input
          type="text"
          bind:value="{search}"
          on:change="{() => ($estudianteSearch.search = search)}"
          class="input (text) font-semibold rounded-lg mt-1 mb-3 px-5 py-3 w-full"
          placeholder="Buscar estudiante..."
        />
      </label>
    </div>
    <a
      href="/estudiantes/filtrado?s={$estudianteSearch.search}"
      class="self-center bg-pink-600 text-center px-5 py-2 rounded-md text-light-50 font-bold w-[250px] btn variant-filled"
      >Ver estudiantes</a
    >
    <!-- <div class="flex flex-col self-center gap-y-5">
        <h2 class="text-center text-sky-600 text-4xl font-extrabold">
          Reporte de divisas
        </h2>
        <a
        href="/reportes/billetes"
        class="bg-pink-600 text-center px-5 py-2 rounded-md text-light-50 font-bold w-full"
        >Generar reporte</a
      >
      </div> -->
  </section>
</section>
<ModalLarge open="{addStudent}" headerText="Añadir estudiante" big>
  <form method="post" use:enhance="{handleSubmit}" bind:this={formEl} class="flex flex-col gap-1">
    <div class="flex justify-between mb-3">
      <label for="cedula" class="flex flex-col w-2/5">
        Cédula de Identidad
        <div class="flex justify-start input-group rounded-lg">
          <select
            bind:value="{documento}"
            name="documento"
            id="documento"
            class="select text-blue-900 font-semibold rounded-lg px-5 w-auto"
          >
            <option value="V">V</option>
            <option value="E">E</option>
          </select>
          <input
            class="input (text) text-blue-900 font-semibold rounded-lg px-3"
            required
            type="number"
            min="0"
            on:invalid="{() => {
              let html = window.document.getElementById('cedula');
              //@ts-ignore
              html.setCustomValidity('Por favor ingrese solo números');
            }}"
            minlength="5"
            name="cedula"
            id="cedula"
            bind:value="{cedulaInput}"
          />
        </div>
      </label>
      <label for="" class="flex flex-col w-2/4">
        Fecha de nacimiento
        <DatePicker
          bind:value={fecha}
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
          bind:value={edad}
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
          value="M"
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
            bind:value="{telefonoInput}"
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
          value="1"
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
          value="1"
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
          <option value="abandona">Abandonó</option>
        </select>
      </label>
    </div>
    <div
      class="flex flex-col md:flex-row justify-center gap-4 items-center w-full p-3"
    >
      <button
        type="button"
        class="btn variant-filled-secondary bg-sky-600 text-white text-light-50 font-bold w-[160px] rounded-lg px-2 py-1"
        on:click="{() => {
          addStudent = false;
          cedulaInput=""
          telefonoInput=""
          formEl.reset();
        }}">Cancelar</button
      >
      <button
        type="submit"
        class="btn variant-filled-primary bg-pink-600 text-white font-bold w-[160px] rounded-lg px-2 py-1"
        >Añadir</button
      >
    </div>
  </form>
</ModalLarge>

<style lang="scss">

  :global(.text-field > input){
    background-color: #e3e4ff !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
  }

  :global(.date-picker,.dropdown-shell,.handle,.text-field){
    width: 100% !important;
  }

  .main{
    height: calc(100vh - 150px) !important;
  }
</style>
