<script lang="ts">
  // Props
  /** Exposes parent props to this component. */
  export let parent: any;

  // Stores
  import { FileDropzone, modalStore } from "@skeletonlabs/skeleton";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { FileUpload } from "@steeze-ui/tabler-icons";

  let theFiles: FileList;

  // We've created a custom submit function to pass the response and close the modal.

  function onFormSubmit(): void {
    if ($modalStore[0].response) $modalStore[0].response(theFiles);
    modalStore.close();
  }

  // Base Classes
  const cBase = "card p-4 w-modal shadow-xl space-y-4";
  const cHeader = "text-2xl font-bold";
  const cForm = "p-4 space-y-4 rounded-container-token";
</script>

<!-- @component This example creates a simple form modal. -->

{#if $modalStore[0]}
  <div class="modal-example-form {cBase}">
    <header class="{cHeader}">
      {$modalStore[0].title ?? "(title missing)"}
    </header>
    <article>{$modalStore[0].body ?? "(body missing)"}</article>
    <!-- Enable for debugging: -->
    <form class="modal-form {cForm}">
      <FileDropzone
        name="files"
        bind:files="{theFiles}"
        accept="application/pdf"
      >
        <svelte:fragment slot="lead">
          {#if !theFiles}
            <Icon
              src="{FileUpload}"
              theme="rounded"
              class="h-[90px] w-[90px] mx-auto"
            />
          {:else}
            <p class="rounded-2xl p-2 bg-secondary-200">
              {theFiles.item(0)?.name}
            </p>
          {/if}
        </svelte:fragment>
        <svelte:fragment slot="message">
          {#if !theFiles}
            Sube o arrastra aquí tu archivo de planificación
          {:else}
            ¡Archivo listo para ser cargado!
          {/if}
        </svelte:fragment>
        <svelte:fragment slot="meta">
          {#if !theFiles}
            Solo se permiten archivos <b>PDF</b>
          {/if}
        </svelte:fragment>
      </FileDropzone>
    </form>
    <!-- prettier-ignore -->
    <footer class="modal-footer {parent.regionFooter}">
            <button class="btn {parent.buttonNeutral}" on:click={parent.onClose}>Cancelar</button>
            <button class="btn {parent.buttonPositive}" on:click={onFormSubmit}>Cargar</button>
        </footer>
  </div>
{/if}
