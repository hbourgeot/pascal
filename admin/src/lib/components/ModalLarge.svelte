<script lang="ts">
  import { slide } from "svelte/transition";

  export let headerText = "";
  export let open: boolean;
  export let big: boolean = false

</script>

{#if open}

  <div id="logOutModal" class="pitch-black w-screen h-screen  min-h-screen flex justify-center items-center z-90 top-0 left-0 overflow-hidden fixed bg-[#00000099] z-200">
    <dialog transition:slide class="shadow-xl rounded-lg bg-white p-0 overflow-hidden {big ? 'w-[750px]' : 'w-auto max-w-md'} <md:(w-4/5) block">
        
      <b class="text-3xl text-center w-full block mt-12">{headerText}</b>
  
      <section class="p-8 ">
        <slot />
      </section>
   
    </dialog>
  </div>

{/if}

<style lang="scss" scoped>
</style>


<!--PARTE DE AFUERA-->