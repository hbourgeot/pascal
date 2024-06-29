<script lang="ts">
  import { onMount } from "svelte";

  let PdfViewer: any;
  let pdfUrl: string;

  onMount(async () => {
    const module = await import("svelte-pdf");
    PdfViewer = module.default;

    // Importar el PDF de manera dinámica
    const pdfModule = await import("./pensum.pdf");
    pdfUrl = pdfModule.default;
  });
</script>

<svelte:component this={PdfViewer} url={pdfUrl} data={null} />
