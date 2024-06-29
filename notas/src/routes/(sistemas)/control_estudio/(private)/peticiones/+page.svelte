<script lang="ts">
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { PageData } from "./$types";
  import { Cancel, Check, Close } from "@steeze-ui/material-design-icons";
  import { enhance } from "$app/forms";

  export let data: PageData;
  let peticiones = data.peticiones;

  let toChange = "Pendiente";
  $: if (toChange) {
    console.log(peticiones);
    peticiones = data.peticiones.filter((peticion) =>
      peticion.peticion.estado.includes(toChange)
    );
  }
</script>

<svelte:head>
  <title>Peticiones | Control de estudio | IUTEPAS</title>
</svelte:head>
<main class="container mx-auto p-4 h-screen">
  <div class="table-container">
    <h1 class="text-4xl p-3 text-center">Peticiones hasta el momento</h1>
    <div class="container w-1/5 flex flex-col gap-2 my-2">
      <h2 class="text-xl text-center">Filtrar por estado:</h2>
      <select
        class="select mx-auto"
        name="nombre_campo"
        id="corte"
        bind:value={toChange}
      >
        <option value="Pendiente">Pendientes</option>
        <option value="Denegado">Denegadas</option>
        <option value="Aprobado">Aprobadas</option>
        <option value="Terminado">Terminadas</option>
      </select>
    </div>

    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>Emisor</th>
          <th>Mensaje</th>
          <th>Estado</th>
          <th>Estudiante</th>
          <th>Materia</th>
          <th class={toChange != "Pendiente" ? "hidden" : ""}>Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each peticiones as peticion}
          <tr>
            <td class="!align-middle">{peticion.peticion.id}</td>
            <td class="!align-middle"
              >{peticion.docente.cedula} - {peticion.docente.nombre}</td
            >
            <td class="!align-middle">{peticion.peticion.descripcion}</td>
            <td class="!align-middle">{peticion.peticion.estado}</td>
            <td class="!align-middle"
              >{peticion.estudiante.cedula} - {peticion.estudiante.nombre}</td
            >
            <td class="!align-middle"
              >{peticion.materia.id} - {peticion.materia.nombre}</td
            >
            <td class="align-top"
              ><form
                use:enhance={({ formData }) => {
                  formData.append("peticion", peticion.peticion.id.toString());
                  return async ({ update }) => {
                    await update();
                  };
                }}
                method="post"
                class="btn-group variant-ghost-primary [&>*+*]:border-red-500 {peticion
                  .peticion.estado != 'Pendiente'
                  ? 'hidden'
                  : ''} py-0"
              >
                <button
                  title="Aprobar petición"
                  formaction="?/aprobar"
                  class="py-0"
                  ><Icon src={Check} theme="rounded" size="15px" /></button
                >
                <button
                  title="Denegar petición"
                  formaction="?/denegar"
                  class="py-0"
                  ><Icon src={Close} theme="rounded" size="15px" /></button
                >
              </form></td
            >
          </tr>
        {/each}
      </tbody>
      <tfoot>
        <tr>
          <th colspan="3">Total de peticiones: </th>
          <td />
          <td />
          <td>{peticiones.length}</td>
        </tr>
      </tfoot>
    </table>
  </div>
</main>
