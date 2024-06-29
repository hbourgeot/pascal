<script lang="ts">
  import type { PageData } from "./$types";
  import { Icon } from "@steeze-ui/svelte-icon";
  import { UserCheck, Receipt, CalendarTime, User, Eye } from "@steeze-ui/tabler-icons";

  const months = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];
</script>
<svelte:head>
    <title>Inicio - Administración IUTEPAS</title>
</svelte:head>
<section class="w-full h-screen overflow-y-auto flex justify-center items-center flex-col py-5 ">
    <div class='py-[20px] text-center '>
      <h2 class="text-5xl font-bold text-pink-600 font-sans text-center">
        Bienvenido
      </h2>
      <p class='pt-2 text-[16px]'>
        Seleccione un módulo de gestión
      </p>
    </div>


    <div class='card-container w-[90%] gap-10 flex flex-wrap flex-row justify-center lg:w-[60%] h-fit lg:justify-center
    '>
      <a href="/estudiantes">
        <article>
          <div class='w-full flex h-[40%] justify-around items-center'>
            <figure class='bg-[#8c51b7] w-12 h-12 rounded-xl flex justify-center items-center'>
              <Icon class='w-8 h-8 text-white' src={User}/>
            </figure>

            <div style="border: 1px solid #969EAF;" class='text-[#969EAF] h-[30px] flex items-center justify-center p-1 px-2 w-[100px] rounded-md text-center'  >
                Seleccionar
            </div>
          </div>

          <div class='w-full pl-4 mx-auto'>
            <h2 class='font-bold text-[#003352]'>
              Estudiantes
            </h2>

            <p>Consulte la información de los estudiantes inscritos</p>
          </div>
        </article>
      </a>
        

      <a href="/movimientos">
        <article>
          <div class='w-full flex h-[40%] justify-around items-center'>
            <figure class='bg-[#ba38a4] w-12 h-12 rounded-xl flex justify-center items-center'>
              <Icon class='w-8 h-8 text-white' src={Eye}/>
            </figure>

            <div style="border: 1px solid #969EAF;" class='text-[#969EAF] h-[30px] flex items-center justify-center p-1 px-2 w-[100px] rounded-md text-center'  >
                Seleccionar
            </div>
          </div>

          <div class='w-full pl-4 mx-auto'>
            <h2 class='font-bold text-[#003352]'>
              Movimientos
            </h2>

            <p>Consulte los movimientos realizados en el sistema</p>
          </div>
        </article>
      </a>

      <a href="/pagos">
        <article>
          <div class='w-full flex h-[40%] justify-around items-center'>
            <figure class='bg-[#dc0183] w-12 h-12 rounded-xl flex justify-center items-center'>
              <Icon class='w-8 h-8 text-white' src={Receipt}/>
            </figure>

            <div style="border: 1px solid #969EAF;" class='text-[#969EAF] h-[30px] flex items-center justify-center p-1 px-2 w-[100px] rounded-md text-center'  >
                Seleccionar
            </div>
          </div>

          <div class='w-full pl-4 mx-auto'>
            <h2 class='font-bold text-[#003352]'>
              Pagos
            </h2>

            <p>Consulte los pagos efectuados por estudiantes</p>
          </div>
        </article>
      </a>
    </div>

</section>

<style>
  section.w-full {
    height: calc(100vh - 80px);
  }

  .card-container article {
    max-width: 228px;
    width: 228px;
    min-width: 210px;
    height: 150px;
    background: white;
    border: 1px solid #c9cbcf;
    border-radius: 5px;

  }

  .card-container{
    height: auto;
  }

</style>
