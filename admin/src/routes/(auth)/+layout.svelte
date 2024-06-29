<script lang="ts">
  import { Toast } from "@skeletonlabs/skeleton";
</script>

<svelte:head>
	<title>Login al sistema de administracion</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>
<Toast position="t" rounded="rounded-lg" color="text-white" buttonDismiss="btn-icon btn-icon-sm variant-ghost" />
<main class="flex flex-col-reverse xl:flex-row-reverse justify-center w-full">
    <slot/>
</main>

<style lang="scss">

	main{
		background-image: url("$lib/images/layered-waves-haikei.svg");
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
		height: auto;
		@media (min-width:1280px) {
			height: 100vh;
		}
	}

</style>
