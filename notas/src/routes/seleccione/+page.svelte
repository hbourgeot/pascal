<script>
  import Pascal from "$lib/images/pascalConFondo.png";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { ChevronLeft } from "@steeze-ui/tabler-icons";

</script>

<svelte:head>
  <title>Inicio de Sesión | Estudiantes | IUTEPAS</title>
</svelte:head>
<a href="/" class="btn variant-ghost-primary absolute top-3 left-3"
  ><Icon src={ChevronLeft} class="h-5 w-5 mr-1" /> Volver al inicio</a
>
<section
  class="w-full h-screen flex flex-col justify-center items-center mb-15 xl:mb-0 main"
>
  <div
    class="max-w-[500px] flex flex-col justify-center items-center gap-5 login xl:h-[fit-content] xl:mt-0 w-3/4"
  >
    <img src={Pascal} alt="Instituto Pascal" class="w-1/2" />
    <h1 class="text-3xl mb-8 font-bold flex justify-center items-center gap">
      Bienvenido, seleccione su rol en la universidad
    </h1>
    <a
      href="/coordinadores"
      class="w-full max-w-[340px] p-4 rounded-lg mb-6 btn variant-ghost-primary text-xl"
      >Coordinador</a
    >
    <a
      href="/control_estudio"
      class="w-full max-w-[340px] p-4 rounded-lg mb-6 btn variant-ghost-primary text-xl"
      >Control de Estudio</a
    >
    <a
      href="/superusuario"
      class="w-full max-w-[340px] p-4 rounded-lg mb-6 btn variant-ghost-primary text-xl"
      >Super usuario</a
    >
  </div>
</section>

<style lang="scss">
  :root {
    --borders: rgba(0, 0, 0, 0.2);
  }

  .login {
    background-color: white;
    padding: 10px;
    border-radius: 15px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
      rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
  }
  .main {
    background-image: url("$lib/images/layered-waves-haikei.svg");
    background-size: cover;
    background-position: bottom center;
    background-repeat: no-repeat;
    background-attachment: fixed;
  }
</style>
