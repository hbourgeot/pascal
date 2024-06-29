<script lang="ts">
  import "@skeletonlabs/skeleton/themes/theme-modern.css";

  // This contains the bulk of Skeletons required styles:
  import "@skeletonlabs/skeleton/styles/skeleton.css";

  // Finally, your application's global stylesheet (sometimes labeled 'app.css')
  import "../app.postcss";
</script>

<slot />

<style>
  :global(
      input[type="number"]::-webkit-inner-spin-button,
      input[type="number"]::-webkit-outer-spin-button
    ) {
    -webkit-appearance: none;
    margin: 0;
  }
</style>
