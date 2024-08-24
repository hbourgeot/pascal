<script lang="ts">
  import { enhance } from "$app/forms";
  import type {
    ModalComponent,
    ModalSettings,
    TableSource,
  } from "@skeletonlabs/skeleton";
  import {
    Modal,
    Paginator,
    SlideToggle,
    Step,
    Stepper,
    Table,
    modalStore,
    tableMapperValues,
  } from "@skeletonlabs/skeleton";

  import ModalList from "$lib/components/ModalList.svelte";
  import { triggerToast } from "$lib/utils/toast";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ChevronDown } from "@steeze-ui/tabler-icons";
  import { Label, TimePicker } from "attractions";
  import type { Docente, Materia } from "../../../../../app";
  import type { ActionData, PageData, SubmitFunction } from "./$types";

  import moment from "moment";

  export let data: PageData;
  export let form: ActionData;
  let docenteForm: HTMLFormElement;

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

  let filteredData = tableMaterias;

  let paginationSettings = {
    limit: 10,
    amounts: [5, 7, 10, 30],
    offset: 0,
    size: filteredData.length,
  };

  let disabled = false;
  let locked = false;

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
    body: [],
  };

  const carreras = data.carreras ?? [];
  let modalComponentRegistry: Record<string, ModalComponent> = {
    // Custom Modal 1
    modalList: {
      // Pass a reference to your custom component
      ref: ModalList,
      props: { materias: listMaterias, estudiantes: false },
    },
  };
  let search = "";

  $: listMaterias = data.list.filter(
    // @ts-ignore
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

  $: locked = materia.id === "";

  $: {
    // Actualiza filteredData cuando cambie search o tableMaterias
    tableMaterias = data.tableMaterias.filter(
      (val) =>
        val.nombre.toLowerCase().includes(search.toLowerCase()) ||
        val.id.toLowerCase().includes(search.toLowerCase()) ||
        val.semestre.toString().includes(search) ||
        val.unidad_credito.toString().includes(search) ||
        val?.dia?.toLowerCase().includes(search.toLowerCase())
    );

    filteredData = tableMaterias.slice(
      paginationSettings.offset,
      paginationSettings.offset + paginationSettings.limit
    );

    // Ajusta el tamaño de la paginación basado en los datos filtrados
    paginationSettings.size = tableMaterias.length;

    // Actualiza tableSource.body después de calcular sourceData
    tableSource.body = tableMapperValues(
      filteredData.map((val) => ({
        ...val,
        dia: `${val?.dia ?? ""} ${
          val.dia2 !== "" && val.dia2 !== null ? "y " + val.dia2 : ""
        }`,
      })),
      ["id", "nombre", "unidad_credito", "dia", "semestre", "prelacion"]
    );
  }

  const handleAdd = async () => {
    try {
      materiasIDs = await new Promise<string[]>((resolve) => {
        const modal: ModalSettings = {
          type: "component",
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
    if (horaInicio) {
      formData.append(
        "hora_inicio",
        moment(horaInicio, "hh:mm A").format("hh:mm A")
      );
    }

    if (horaFin) {
      formData.append("hora_fin", moment(horaFin, "hh:mm A").format("hh:mm A"));
    }

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
      disabled = true;
      window.location.reload();
      await update({ reset: true });
    };
  };

  const handleClick = (e: CustomEvent) => {
    // @ts-ignore
    materia = tableMaterias.find((mat: Materia) => mat.id === e.detail[0]);
    let dateHelper: number[] = [];
    if (materia.dia) {
      dateHelper = [
        parseInt(materia.hora_inicio.split(":")[0]),
        parseInt(materia.hora_inicio.split(":")[1].split(" ")[0]),
      ];
      if (materia.hora_inicio.includes("PM")) dateHelper[0] += 12;
      horaInicio = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

      dateHelper = [
        parseInt(materia.hora_fin.split(":")[0]),
        parseInt(materia.hora_fin.split(":")[1].split(" ")[0]),
      ];
      if (materia.hora_fin.includes("PM")) dateHelper[0] += 12;
      horaFin = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

      if (materia.dia2) {
        dateHelper = [
          parseInt(materia.hora_inicio2.split(":")[0]),
          parseInt(materia.hora_inicio2.split(":")[1].split(" ")[0]),
        ];
        if (materia.hora_inicio2.includes("PM")) dateHelper[0] += 12;
        horaInicio2 = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);

        dateHelper = [
          parseInt(materia.hora_fin2.split(":")[0]),
          parseInt(materia.hora_fin2.split(":")[1].split(" ")[0]),
        ];
        if (materia.hora_fin2.includes("PM")) dateHelper[0] += 12;
        horaFin2 = new Date(0, 0, 0, dateHelper[0], dateHelper[1]);
      }
    }

    prelacion = materia.prelacion;
    showExtraDays = materia.dia2 !== null && materia.dia2 !== "";
  };

  const requestSubmit = () => {
    docenteForm.requestSubmit();
  };
</script>

<svelte:head>
  <title>Editar materias | Coordinadores | IUTEPAS</title>
</svelte:head>
<section class="screen pb-8">
  <div
    class="container mx-auto px-4 py-6 flex flex-col lg:flex-row justify-evenly items-center gap-3 rounded-xl bg-white w-fit"
  >
    <Stepper stepTerm="Paso" on:complete="{requestSubmit}" buttonBackLabel="Regresar" buttonNextLabel="Continuar" buttonCompleteLabel="Guardar">
      <Step locked="{locked}">
        <svelte:fragment slot="header">Materia a editar</svelte:fragment>
        <div class="p-8 rounded-xl h-full w-full">
          <div class="mb-4 w-fit">
            <label for="materia" class="label mb-1"
              >Código, Nombre, Semestre, Día de clases o U.C de la materia</label
            >
            <input
              type="text"
              id="materia"
              bind:value="{search}"
              class="input (text) py-2 px-7 outline-none"
              required
            />
          </div>
          {#if tableSource.body.length === 0}
            <p class="text-center text-red-400">No se encontraron resultados</p>
          {:else}
            <Table
              source="{tableSource}"
              on:selected="{(e) => {
                triggerToast('Materia seleccionada, puede continuar', 3000);
                handleClick(e);
              }}"
              interactive="{true}"
            />
          {/if}
          <Paginator
            bind:settings="{paginationSettings}"
            showFirstLastButtons="{true}"
            amountText="registros"
            class="my-3"
            separatorText="de"
          />
        </div>
      </Step>
      <Step>
        <svelte:fragment slot="header">Edición de {materia.id}</svelte:fragment>
        <div class="p-8 rounded-xl shadow h-full w-full">
          <form
            id="docente-form"
            method="post"
            use:enhance="{handleSubmit}"
            action="?/submit"
            bind:this="{docenteForm}"
          >
            <div class="flex justify-between items-end gap-4">
              <div class="mb-4">
                <label for="id" class="label">Código de Materia</label>
                <input
                  type="text"
                  readonly
                  bind:value="{materia.id}"
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
                  bind:value="{materia.nombre}"
                  name="nombre"
                  class="input (text) py-2 px-7 outline-none"
                  required
                  disabled="{disabled}"
                />
              </div>
              <div class="mb-4 w-1/3">
                <label for="maximo" class="label">Capacidad</label>
                <input
                  type="number"
                  id="maximo"
                  name="maximo"
                  bind:value="{materia.maximo}"
                  class="input (number) py-2 px-7 outline-none"
                  min="0"
                  required
                  disabled="{disabled}"
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
                    bind:value="{materia.unidad_credito}"
                    class="select py-2 px-7 outline-none"
                    required
                    disabled="{disabled}"
                  >
                    <option value="{0}">0 U.C</option>
                    <option value="{1}">1 U.C</option>
                    <option value="{2}">2 U.C</option>
                    <option value="{3}">3 U.C</option>
                    <option value="{4}">4 U.C</option>
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
                </label>
              </div>
              <div class="mb-4 w-1/3">
                <label for="hp" class="label relative"
                  >Horas Prácticas
                  <select
                    class="select py-2 px-7 outline-none"
                    id="hp"
                    bind:value="{materia.hp}"
                    name="hp"
                    required
                    disabled="{disabled}"
                  >
                    <option value="{0}">0h</option>
                    <option value="{1}">1h</option>
                    <option value="{2}">2h</option>
                    <option value="{3}">3h</option>
                    <option value="{4}">4h</option>
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
                </label>
              </div>
              <div class="mb-4 w-1/3">
                <label for="ht" class="label relative"
                  >Horas Teóricas
                  <select
                    class="select py-2 px-7 outline-none"
                    bind:value="{materia.ht}"
                    id="ht"
                    name="ht"
                    required
                    disabled="{disabled}"
                  >
                    <option value="{0}">0h</option>
                    <option value="{1}">1h</option>
                    <option value="{2}">2h</option>
                    <option value="{3}">3h</option>
                    <option value="{4}">4h</option>
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
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
                    bind:value="{materia.semestre}"
                    required
                    disabled="{disabled}"
                  >
                    <option value="{1}">1ro</option>
                    <option value="{2}">2do</option>
                    <option value="{3}">3ro</option>
                    <option value="{4}">4to</option>
                    <option value="{5}">5to</option>
                    <option value="{6}">6to</option>
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
                </label>
              </div>
              <div class="mb-4 w-1/3">
                <label for="carrera" class="label relative"
                  >Carrera
                  <select
                    name="id_carrera"
                    id="carrera"
                    class="select py-2 px-7 outline-none"
                    bind:value="{materia.id_carrera}"
                    disabled="{disabled}"
                  >
                    {#each carreras as carrera}
                      <option value="{carrera.id}">{carrera.nombre}</option>
                    {/each}
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
                </label>
              </div>
              <div class="mb-4 w-1/3">
                <label for="modalidad" class="label">Modalidad</label>
                <select
                  name="modalidad"
                  id="modalidad"
                  class="select py-2 px-7"
                  required
                  bind:value="{materia.modalidad}"
                  disabled="{disabled}"
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
                    bind:value="{materia.id_docente}"
                    required
                    disabled="{disabled}"
                  >
                    {#each docentesSelect as docente}
                      <option value="{docente.cedula}">{docente.nombre}</option>
                    {/each}
                  </select>

                  <Icon
                    src="{ChevronDown}"
                    class="absolute top-8 right-4 w-5 h-5"
                  />
                </label>
              </div>
              <div class="mb-4 w-1/2">
                <label for="dia" class="label">Primer Día de Clase</label>
                <select
                  name="dia"
                  id="dia"
                  class="select"
                  bind:value="{materia.dia}"
                  disabled="{disabled}"
                >
                  {#each days as day}
                    <option value="{day.value}">{day.label}</option>
                  {/each}
                </select>
              </div>
              {#if showExtraDays}
                <div class="mb-4 w-1/2">
                  <label for="dia2" class="label">Segundo Día de Clase</label>
                  <select
                    name="dia2"
                    id="dia2"
                    bind:value="{materia.dia2}"
                    class="select"
                    disabled="{disabled}"
                  >
                    {#each days as day}
                      <option value="{day.value}">{day.label}</option>
                    {/each}
                  </select>
                </div>
              {/if}
            </div>
            <div class="flex justify-between items-center gap-x-5">
              <div class="mb-4 w-1/4">
                <label for="" class="label">Hora inicio</label>
                <TimePicker
                  format="%H:%M %P"
                  bind:value="{horaInicio}"
                  disabled="{disabled}"
                >
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
                <TimePicker
                  format="%H:%M %P"
                  bind:value="{horaFin}"
                  disabled="{disabled}"
                >
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
                  <TimePicker
                    format="%H:%M %P"
                    bind:value="{horaInicio2}"
                    disabled="{disabled}"
                  >
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
                  <TimePicker
                    format="%H:%M %P"
                    bind:value="{horaFin2}"
                    disabled="{disabled}"
                  >
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
                on:click="{handleAdd}"
                disabled="{materia.semestre <= 1}"
                class="bg-blue-600 text-white px-4 py-2 rounded-xl"
                >Seleccionar prelación</button
              >
              <div>
                <input
                  type="text"
                  class="input (text) py-2 px-7 my-3"
                  readonly
                  bind:value="{prelacion}"
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
              bind:checked="{showExtraDays}"
              active="bg-primary-500"
              name=""
              class="my-3"
              disabled="{materia.id == ''}"
              size="lg"
              >{showExtraDays
                ? "Dos días a la semana"
                : "Un día a la semana"}</SlideToggle
            >
          </form>
        </div>
      </Step>
    </Stepper>
  </div>
</section>
<Modal components="{modalComponentRegistry}" />

<style>
  :global(.bx--form-requirement) {
    font-size: 12px;
    color: #db0098;
  }

  .screen {
    min-height: calc(100vh - 80px);
  }

  .select {
    appearance: none;
  }

  :global(.bx--form-requirement) {
    font-size: 12px;
    color: #db0098;
  }

  .screen {
    min-height: calc(100vh - 80px);
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
