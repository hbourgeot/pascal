<script lang="ts">
  import { enhance } from "$app/forms";
  import {
    type ModalSettings,
    modalStore,
    type ModalComponent,
    Modal,
    Table,
    type TableSource,
    tableMapperValues,
    Paginator,
    SlideToggle,
  } from "@skeletonlabs/skeleton";

  import { TimePicker, Label } from "attractions";
  import type { Docente, Materia } from "../../../../../app";
  import type { ActionData, PageData, SubmitFunction } from "./$types";
  import ModalList from "$lib/components/ModalList.svelte";
  import { triggerToast } from "$lib/utils/toast";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ChevronDown } from "@steeze-ui/tabler-icons";

  import Select from "svelte-select";
  import moment from "moment";

  export let data: PageData;
  export let form: ActionData;

  let docentesSelect: Docente[] = data.docentes as unknown as Docente[];
  let materias: string[] = data.materias;
  let tableMaterias = data.tableMaterias;
  let listMaterias = data.list;
  let materiasIDs: string[] = [];
  let clicked: boolean = false;
  let prelacion: string = "";
  let horaInicio: any = null;
  let horaFin: any = null;
  let horaInicio2: any = null;
  let horaFin2: any = null;
  let materia: Materia = {
    ciclo: "",
    dia: "",
    dia2: "",
    hora_fin: "",
    hora_fin2: "",
    hora_inicio: "",
    hora_inicio2: "",
    hp: 0,
    ht: 0,
    id: "",
    id_carrera: "",
    id_docente: "",
    maximo: 0,
    nombre: "",
    prelacion: "",
    semestre: 0,
    unidad_credito: 0,
    cantidad_estudiantes: 0,
    modalidad: "",
  };

  let sourceData: Materia[] = tableMaterias;
  let paginationSettings = {
    limit: 5,
    size: sourceData.length,
    amounts: [1, 3, 5, 10],
    offset: 0,
  };

  let showExtraDays = materia.dia2 !== null && materia.dia2 !== "";

  let days = [
    { value: "lunes", label: "Lunes" },
    { value: "martes", label: "Martes" },
    { value: "miercoles", label: "Miércoles" },
    { value: "jueves", label: "Jueves" },
    { value: "viernes", label: "Viernes" },
    { value: "sabado", label: "Sábado" },
    { value: "domingo", label: "Domingo" },
  ];

  let tableSource: TableSource = {
    head: ["ID", "Nombre", "U.C", "Dias de clase", "Semestre", "Prelación"],
    body: tableMapperValues(
      sourceData.map((val) => ({
        ...val,
        dia: `${val.dia} ${
          val.dia2 !== "" && val.dia2 !== null ? "y " + val.dia2 : ""
        }`,
      })),
      ["id", "nombre", "unidad_credito", "dia", "semestre", "prelacion"]
    ),
  };

  $: listMaterias = data.list.filter(
    (mat: Materia) => mat.semestre < materia.semestre
  );

  const carreras = data.carreras ?? [];
  let modalComponentRegistry: Record<string, ModalComponent> = {
    // Custom Modal 1
    modalList: {
      // Pass a reference to your custom component
      ref: ModalList,
      props: { materias: listMaterias, estudiantes: false },
    },
  };

  $: listMaterias = data.list.filter(
    (mat: Materia) => mat.semestre < materia.semestre && mat.id !== materia.id
  );
  $: modalComponentRegistry = {
    // Custom Modal 1
    modalList: {
      // Pass a reference to your custom component
      ref: ModalList,
      props: { materias: listMaterias, estudiantes: false },
    },
  };

  $: if (materiasIDs.length > 0) {
    prelacion = materiasIDs.join(" - ");
  }

  $: if (form?.message) {
    triggerToast(form.message);
  }

  $: tableMaterias = data.tableMaterias;
  $: sourceData = data.tableMaterias.slice(
    paginationSettings.offset * paginationSettings.limit,
    paginationSettings.offset * paginationSettings.limit +
      paginationSettings.limit
  );

  $: tableSource = {
    head: ["ID", "Nombre", "U.C", "Días de clase", "Semestre", "Prelación"],
    body: tableMapperValues(
      sourceData.map((val) => ({
        ...val,
        dia: `${val.dia}${
          val.dia2 !== "" && val.dia2 !== null ? " y " + val.dia2 : ""
        }`,
      })),
      ["id", "nombre", "unidad_credito", "dia", "semestre", "prelacion"]
    ),
  };
  moment({});

  const handleAdd = async () => {
    try {
      materiasIDs = await new Promise<string[]>((resolve) => {
        const modal: ModalSettings = {
          type: "component",
          // Pass the component registry key as a string:
          component: "modalList",
          title: "Seleccionar materias",
          body: "Selecciona las materias que deseas inscribir, vuelve a pulsar en ella para descartarla de la inscripcion",
          response: (r: string[]) => {
            resolve(r);
          },
        };
        modalStore.trigger(modal);
      });

      for (const id of materiasIDs) {
        const materiaFind = materias.find((mat) => mat == id.toString());
        if (!materiaFind) {
          materias.push(
            materias.find(
              (materia) => materia == id.toString()
            ) as unknown as string
          );
        } else {
          materias = materias.filter((mat) => mat === id.toString());
        }
      }
      clicked = true;
    } catch (e) {
      console.error(e);
    }
  };

  const handleSubmit: SubmitFunction = ({ formData }) => {
    formData.append(
      "hora_inicio",
      moment(horaInicio, "hh:mm A").format("hh:mm A")
    );

    formData.append("hora_fin", moment(horaFin, "hh:mm A").format("hh:mm A"));
    if (materia.dia2) {
      formData.append(
        "hora_inicio2",
        moment(horaInicio2, "hh:mm A").format("hh:mm A")
      );
      formData.append(
        "hora_fin2",
        moment(horaFin2, "hh:mm A").format("hh:mm A")
      );
    }
    return async ({ update }) => {
      await update();
    };
  };

  const handleClick = (e: CustomEvent) => {
    materia = tableMaterias.find((mat: Materia) => mat.id === e.detail[0]);
    let dateHelper: number[] = [];
    if (materia.dia) {
      dateHelper = [
        parseInt(materia.hora_inicio.split(":")[0]),
        parseInt(materia.hora_inicio.split(":")[1].split(" ")[0]),
      ];
      console.log(dateHelper);
      if (materia.hora_inicio.includes("PM")) dateHelper[0] += 12;
      horaInicio = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

      dateHelper = [
        parseInt(materia.hora_fin.split(":")[0]),
        parseInt(materia.hora_fin.split(":")[1].split(" ")[0]),
      ];
      console.log(dateHelper);
      if (materia.hora_fin.includes("PM")) dateHelper[0] += 12;
      horaFin = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

      if (materia.dia2) {
        dateHelper = [
          parseInt(materia.hora_inicio2.split(":")[0]),
          parseInt(materia.hora_inicio2.split(":")[1].split(" ")[0]),
        ];
        console.log(dateHelper);
        if (materia.hora_inicio2.includes("PM")) dateHelper[0] += 12;
        horaInicio2 = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

        dateHelper = [
          parseInt(materia.hora_fin2.split(":")[0]),
          parseInt(materia.hora_fin2.split(":")[1].split(" ")[0]),
        ];
        console.log(dateHelper);
        if (materia.hora_fin2.includes("PM")) dateHelper[0] += 12;
        horaFin2 = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);
      }
    }
    prelacion = materia.prelacion;
    showExtraDays = materia.dia2 !== null && materia.dia2 !== "";
  };
</script>

<svelte:head>
  <title>Editar materias | Coordinadorss | IUTEPAS</title>
</svelte:head>
<section class="screen">
  <div
    class="container lg:w-4/5 md:w-5/6 mx-auto px-4 py-8 flex flex-col lg:flex-row justify-evenly items-center gap-3 rounded-xl bg-white"
  >
    <div class="p-8 rounded-xl shadow h-full w-1/2">
      <h2 class="text-2xl font-semibold mb-4 text-center">Editar materia</h2>
      <form id="docente-form" method="post" use:enhance={handleSubmit}>
        <div class="flex justify-between items-end gap-4">
          <div class="mb-4">
            <label for="id" class="label">Código de Materia</label>
            <input
              type="text"
              readonly
              bind:value={materia.id}
              id="id"
              name="id"
              class="input (text) py-2 px-7 outline-none"
              required
            />
          </div>
          <div class="mb-4">
            <label for="nombre" class="label">Nombre</label>
            <input
              type="text"
              id="nombre"
              bind:value={materia.nombre}
              name="nombre"
              class="input (text) py-2 px-7 outline-none"
              required
            />
          </div>
          <div class="mb-4 w-1/3">
            <label for="maximo" class="label">Capacidad</label>
            <input
              type="number"
              id="maximo"
              name="maximo"
              bind:value={materia.maximo}
              class="input (number) py-2 px-7 outline-none"
              min="0"
              required
            />
          </div>
        </div>
        <div class="flex justify-between items-end gap-4">
          <div class="mb-4 w-1/3">
            <label for="credito" class="label relative"
              >Unidades de Crédito
              <select
                id="credito"
                name="unidad_credito"
                bind:value={materia.unidad_credito}
                class="select py-2 px-7 outline-none"
                required
              >
                <option value="1">1 U.C</option>
                <option value="2">2 U.C</option>
                <option value="3">3 U.C</option>
                <option value="4">4 U.C</option>
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
          <div class="mb-4 w-1/3">
            <label for="hp" class="label relative"
              >Horas Prácticas
              <select
                class="select py-2 px-7 outline-none"
                id="hp"
                bind:value={materia.hp}
                name="hp"
                required
              >
                <option value="1">1h</option>
                <option value="2">2h</option>
                <option value="3">3h</option>
                <option value="4">4h</option>
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
          <div class="mb-4 w-1/3">
            <label for="ht" class="label relative"
              >Horas Teóricas
              <select
                class="select py-2 px-7 outline-none"
                bind:value={materia.ht}
                id="ht"
                name="ht"
                required
              >
                <option value="1">1h</option>
                <option value="2">2h</option>
                <option value="3">3h</option>
                <option value="4">4h</option>
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
        </div>
        <div class="flex justify-between gap-x-5">
          <div class="mb-4 w-1/3">
            <label for="semestre" class="label relative"
              >Semestre
              <select
                name="semestre"
                id="semestre"
                class="select py-2 px-7 outline-none"
                bind:value={materia.semestre}
                required
              >
                <option value="1">1ro</option>
                <option value="2">2do</option>
                <option value="3">3ro</option>
                <option value="4">4to</option>
                <option value="5">5to</option>
                <option value="6">6to</option>
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
          <div class="mb-4 w-1/3">
            <label for="carrera" class="label relative"
              >Carrera
              <select
                name="id_carrera"
                id="carrera"
                class="select py-2 px-7 outline-none"
                bind:value={materia.id_carrera}
              >
                {#each carreras as carrera}
                  <option value={carrera.id}>{carrera.nombre}</option>
                {/each}
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
          <div class="mb-4 w-1/3">
            <label for="modalidad" class="label">Modalidad</label>
            <select
              name="modalidad"
              id="modalidad"
              class="select py-2 px-7"
              required
              bind:value={materia.modalidad}
            >
              <option value="Presencial">Presencial</option>
              <option value="Virtual">Virtual</option>
            </select>
          </div>
        </div>
        <div class="flex justify-between items-center gap-x-4">
          <div class="mb-4 w-1/2">
            <label for="docente" class="label relative"
              >Docente
              <select
                name="id_docente"
                id="docente"
                class="select py-2 px-3 outline-none"
                bind:value={materia.id_docente}
                required
              >
                {#each docentesSelect as docente}
                  <option value={docente.cedula}>{docente.nombre}</option>
                {/each}
              </select>

              <Icon src={ChevronDown} class="absolute top-8 right-4 w-5 h-5" />
            </label>
          </div>
          <div class="mb-4 w-1/2">
            <label for="dia" class="label">Primer Día de Clase</label>
            <select name="dia" id="dia" class="select" bind:value={materia.dia}>
              {#each days as day}
                <option value={day.value}>{day.label}</option>
              {/each}
            </select>
          </div>
          {#if showExtraDays}
            <div class="mb-4 w-1/2">
              <label for="dia2" class="label">Segundo Día de Clase</label>
              <select
                name="dia2"
                id="dia2"
                bind:value={materia.dia2}
                class="select"
              >
                {#each days as day}
                  <option value={day.value}>{day.label}</option>
                {/each}
              </select>
            </div>
          {/if}
        </div>
        <div class="flex justify-between items-center gap-x-5">
          <div class="mb-4 w-1/4">
            <label for="" class="label">Hora inicio</label>
            <TimePicker format="%H:%M %P" bind:value={horaInicio}>
              <svelte:fragment slot="hours-label"
                ><Label>Horas</Label></svelte:fragment
              >
              <svelte:fragment slot="minutes-label"
                ><Label>Minutos</Label></svelte:fragment
              >
              <svelte:fragment slot="now-label"
                ><Label>Hora Actual</Label></svelte:fragment
              >
            </TimePicker>
          </div>
          <div class="mb-4 w-1/3">
            <label for="" class="label">Hora fin</label>
            <TimePicker format="%H:%M %P" bind:value={horaFin}>
              <svelte:fragment slot="hours-label"
                ><Label>Horas</Label></svelte:fragment
              >
              <svelte:fragment slot="minutes-label"
                ><Label>Minutos</Label></svelte:fragment
              >
              <svelte:fragment slot="now-label"
                ><Label>Hora Actual</Label></svelte:fragment
              >
            </TimePicker>
          </div>
          {#if showExtraDays}
            <div class="mb-4 w-1/3">
              <label for="" class="label">Hora inicio Día 2</label>
              <TimePicker format="%H:%M %P" bind:value={horaInicio2}>
                <svelte:fragment slot="hours-label"
                  ><Label>Horas</Label></svelte:fragment
                >
                <svelte:fragment slot="minutes-label"
                  ><Label>Minutos</Label></svelte:fragment
                >
                <svelte:fragment slot="now-label"
                  ><Label>Hora Actual</Label></svelte:fragment
                >
              </TimePicker>
            </div>
            <div class="mb-4 w-1/3">
              <label for="" class="label">Hora fin Dia 2</label>
              <TimePicker format="%H:%M %P" bind:value={horaFin2}>
                <svelte:fragment slot="hours-label"
                  ><Label>Horas</Label></svelte:fragment
                >
                <svelte:fragment slot="minutes-label"
                  ><Label>Minutos</Label></svelte:fragment
                >
                <svelte:fragment slot="now-label"
                  ><Label>Hora Actual</Label></svelte:fragment
                >
              </TimePicker>
            </div>
          {/if}
        </div>
        <div
          class="mb-4 flex flex-row-reverse items-center justify-between gap-3"
        >
          <button
            type="button"
            on:click={handleAdd}
            disabled={materia.semestre <= 1}
            class="bg-blue-600 text-white px-4 py-2 rounded-xl"
            >Seleccionar prelación</button
          >
          <div>
            <input
              type="text"
              class="input (text) py-2 px-7 my-3"
              readonly
              bind:value={prelacion}
              name="prelacion"
              minlength="1"
            />
            <p class="text-sm text-red-400">
              Nota: cada que hagas click en ese botón, tendrás que elegir la
              prelación desde cero
            </p>
          </div>
        </div>
        <SlideToggle
          bind:checked={showExtraDays}
          active="bg-primary-500"
          name=""
          class="my-3"
          disabled={materia.id == ""}
          size="lg"
          >{showExtraDays
            ? "Dos días a la semana"
            : "Un día a la semana"}</SlideToggle
        >
        <button
          type="submit"
          class="bg-blue-600 w-full text-white px-4 py-2 rounded-md"
          >Editar materia</button
        >
      </form>
    </div>

    <div class="p-8 rounded-xl shadow h-full w-1/2">
      <h2 class="text-2xl font-semibold mb-4 text-center">
        Materias registradas
      </h2>
      <Table
        source={tableSource}
        on:selected={handleClick}
        interactive={true}
      />
      <Paginator
        bind:settings={paginationSettings}
        showFirstLastButtons={true}
        amountText="registros"
        class="my-3"
        separatorText="de"
      />
    </div>
  </div>
</section>
<Modal components={modalComponentRegistry} />

<style>
  :global(.bx--form-requirement) {
    font-size: 12px;
    color: #db0098;
  }

  .screen {
    height: calc(100vh - 80px);
  }

  .select {
    appearance: none;
  }

  :global(.bx--form-requirement) {
    font-size: 12px;
    color: #db0098;
  }

  .screen {
    height: calc(100vh - 80px);
  }

  :global(.text-field) {
    width: 100% !important;
  }

  :global(.text-field > input) {
    background-color: rgb(216, 217, 252) !important;
    border: #9799fc solid 3px !important;
    color: #3751a0;
    border-radius: 24px !important;
  }
  :global(.time-picker, .handle) {
    width: 100% !important;
  }
</style>
