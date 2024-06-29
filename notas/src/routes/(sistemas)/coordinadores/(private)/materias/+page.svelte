<script lang="ts">
  import { TreeView, TreeViewItem } from "@skeletonlabs/skeleton";
  import { ExpandLess, ExpandMore } from "@steeze-ui/material-design-icons";
  import { Icon } from "@steeze-ui/svelte-icon";
  import type { PageData } from "./$types";

  export let data: PageData;

  let carreras = data.carreras;
</script>

<svelte:head>
  <title>Materias | Coordinadores | IUTEPAS</title>
</svelte:head>
<div class="main relative">
  <div class="absolute top-5 left-5">
    <a href="/coordinadores/editar_materia" class="btn variant-filled-primary"
      >Editar materias</a
    >
  </div>
  <div class="flex items-center p-10 flex-col w-full max-h-auto gap-6">
    <h1 class="w-[90%] text-2xl font-bold text-center">
      Materias del Ciclo Actual
    </h1>

    <div class="bg-[#56befb] rounded-2xl p-4 lg:w-2/5 w-3/4 mx-auto">
      <TreeView regionChildren="w-full">
        {#each carreras as carrera}
          <TreeViewItem class="capitalize">
            {carrera.nombre}
            <svelte:fragment slot="children">
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/1`)}
                >1er semestre</TreeViewItem
              >
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/2`)}
                >2do semestre</TreeViewItem
              >
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/3`)}
                >3er semestre</TreeViewItem
              >
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/4`)}
                >4to semestre</TreeViewItem
              >
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/5`)}
                >5to semestre</TreeViewItem
              >
              <TreeViewItem
                on:click={() =>
                  (window.location.href = `/coordinadores/materias/${carrera.id}/6`)}
                >6to semestre</TreeViewItem
              >
            </svelte:fragment>
          </TreeViewItem>
        {/each}
      </TreeView>
    </div>
  </div>
</div>

<style lang="scss">
  .main {
    height: calc(100vh - 80px);
  }
</style>
