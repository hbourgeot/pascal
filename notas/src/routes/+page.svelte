<script>
  import Header from "$lib/components/Header.svelte";
  import logo from "../lib/images/pascal-fondo.png";
  import graduados from "$lib/images/est1.jpg";
  import first from "$lib/images/est2.jpg";
  import second from "$lib/images/est4.jpg";
  import footer from "$lib/images/footer-banner.jpg";
  import Saos from "saos";
  import cyc from "$lib/images/cyc.jpg";
  import cye from "$lib/images/cye.jpeg";
  import admban from "$lib/images/admban.jpg";
  import admemp from "$lib/images/admemp.jpg";
  import tda from "$lib/images/tda.jpeg";
  import informatica from "$lib/images/informatica.jpg";
  import disgraf from "$lib/images/disgraf.jpg";

  import { Icon } from "@steeze-ui/svelte-icon";
  import { MapPin } from "@steeze-ui/tabler-icons";
  import Carousel from "svelte-carousel";
</script>

<main class="w-full h-screen overflow-x-hidden">
  <Header />

  <section class="relative">
    <div class="hero relative w-full h-[90vh] block lg:h-[90vh]">
      <div class=" backdrop absolute w-full h-full bg-gray-900" />

      <div class="w-full absolute flex justify-center py-12">
        <Saos
          animation={"slide-in-top 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both"}
        >
          <figure class="w-full">
            <img class="w-[250px] mx-auto py-12" src={logo} alt="" />
          </figure>

          <div
            class="text-center text-[30px] flex flex-col gap-8 text-white font-bold"
          >
            <p style="line-height: 40px">
              INSTITUTO UNIVERSITARIO DE TECNOLOGIA
            </p>
            <p class="text-[54px]">PASCAL</p>
            <p style="line-height: 40px">PORQUE TU FUTURO ES HOY</p>
          </div>
        </Saos>
      </div>
    </div>
  </section>

  <section class="w-full h-[90vh] flex items-center justify-center bg-blue-600">
    <div
      class="flex flex-col mx-auto h-full w-11/12 justify-center items-center gap-4 md:flex-row md:h-auto"
    >
      <Saos animation={"from-left 600ms linear both "}>
        <figure class="">
          <img src={graduados} class="w-1/2" alt="" />
        </figure>
      </Saos>
      <Saos animation={"from-right 600ms linear both"}>
        <div class="max-w-[600px] text-center mt-4 lg:pl-5">
          <h2 class="pb-8 font-bold">¿QUIENES SOMOS?</h2>
          <p
            class="text-justify text-white text-[20px] leading-10 font-semibold"
          >
            El Instituto Universitario de Tecnología Pascal (IUTPASCAL) es una
            organización de Educación Superior de carácter privado, que te
            ofrece carreras de forma presencial o semipresencial que te permiten
            estudiar a tu propio ritmo.
          </p>
        </div>
      </Saos>
    </div>
  </section>

  <section class=" w-full h-auto bg-white">
    <div
      class="w-11/12 mx-auto flex justify-center flex-col p-4 gap-8 text-black font-medium text-[20px] leading-8 lg:flex-row lg:p-8"
      style="border-bottom: 2px solid gray"
    >
      <div class="lg:w-[50%] h-auto">
        <Saos animation={"from-left 600ms linear both"}>
          <figure class=" mx-auto">
            <img src={second} class="w-1/2 mx-auto" alt="" />
          </figure>
          <div>
            <h2 class="!text-blue-700 text-center py-8 uppercase">Misión</h2>
            <ul class="flex flex-col gap-6">
              <li class="text-justify">
                • Favorecer, a través de los estudios de nivel superior el
                desarrollo y la promoción del hombre, de la comunidad y la
                región donde está establecida la institución.
              </li>
              <li>
                • Formar Técnicos Superiores caracterizados por un alto de nivel
                de capacitación práctica, en atención a las necesidades de
                desarrollo social y económico del país en general y de la región
                en particular.
              </li>
              <li>
                • Capacitar a los estudiantes a fin de que afronten con éxito
                las exigencias específicas de los estudios profesionales de
                nivel superior.
              </li>
            </ul>
          </div>
        </Saos>
      </div>

      <div class="lg:w-[50%] h-auto">
        <Saos animation={"from-right 600ms linear both"}>
          <figure class=" mx-auto">
            <img src={first} alt="" class="w-1/2 mx-auto" />
          </figure>
          <div>
            <h2 class="!text-blue-700 text-center py-8 uppercase">Visión</h2>
            <p class="text-justify">
              El Instituto Universitario de Tecnología Pascal (IUTPASCAL) es una
              organización de Educación Superior de carácter privado, sin fines
              de lucro, cuyo objetivo es formar Técnicos Superiores
              Universitarios en áreas prioritarias de las ciencias tecnológicas,
              el cual ofrece a sus estudiantes herramientas para que estos
              asuman actitudes críticas, analíticas, responsables y nacionales
              capaces de participar activamente en el desarrollo que impone la
              región y Venezuela.
            </p>
          </div>
        </Saos>
      </div>
    </div>
  </section>

  <section class="w-full h-auto p-4 bg-pink-600">
    <div class="mx-auto max-h-full w-11/12 md:h-auto p-3">
      <h2 class="pb-8 font-bold uppercase text-center">nuestras carreras</h2>
      <Carousel
        autoplay
        autoplayDuration={5000}
        autoplayProgressVisible
        pauseOnFocus
      >
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{disgraf}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Diseño Gráfico</h2>
            <p class="text-sm lg:text-base my-2">
              Embárcate en un viaje creativo con el Diseño Gráfico. Descubre
              cómo dar vida a tus ideas a través de la combinación de imágenes y
              texto. Explora los fundamentos del diseño, la composición y la
              comunicación visual mientras creas impactantes piezas gráficas.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde la creación de logotipos hasta la maquetación de revistas,
              el Diseño Gráfico abarca una amplia gama de posibilidades para
              expresar tu creatividad. Aprende a utilizar herramientas digitales
              y conceptos estéticos para comunicar mensajes visuales efectivos.
            </p>
            <a
              href="/diseno_grafico"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Contabilidad y Costos -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{cyc}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Contabilidad y Costos</h2>
            <p class="text-sm lg:text-base my-2">
              Sumérgete en el mundo financiero con la carrera de Contabilidad y
              Costos. Aprende a interpretar los números detrás de las
              operaciones empresariales y a tomar decisiones informadas para
              optimizar los recursos financieros.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde el análisis de estados financieros hasta la planificación
              tributaria, esta carrera te proporcionará las habilidades
              necesarias para mantener el equilibrio financiero de las
              organizaciones. Explora cómo la contabilidad puede influir en la
              toma de decisiones estratégicas y en el crecimiento sostenible de
              las empresas.
            </p>
            <a
              href="/contabilidad_costos"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Administración Bancaria y Financiera -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{admban}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">
              Administración Bancaria y Financiera
            </h2>
            <p class="text-sm lg:text-base my-2">
              Descubre el mundo de las finanzas y la banca a través de esta
              emocionante carrera. Aprende cómo funcionan las instituciones
              financieras, explora los mercados y comprende los conceptos clave
              de la gestión de riesgos y las inversiones.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde la banca minorista hasta las estrategias de inversión, esta
              carrera te proporcionará una base sólida en el sector financiero.
              Explora cómo las decisiones económicas y políticas influyen en la
              economía global y cómo puedes contribuir al éxito financiero de
              individuos y empresas.
            </p>
            <a
              href="/admin_bancaria_finan"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Administración de Empresas -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{admemp}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Administración de Empresas</h2>
            <p class="text-sm lg:text-base my-2">
              Desarrolla habilidades de liderazgo y gestión con la carrera de
              Administración de Empresas. Aprende a coordinar equipos, tomar
              decisiones estratégicas y optimizar recursos para alcanzar los
              objetivos corporativos.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde la gestión de proyectos hasta la planificación estratégica,
              esta carrera te proporcionará las herramientas necesarias para
              enfrentar los desafíos del mundo empresarial. Explora cómo las
              habilidades de comunicación, la ética empresarial y la innovación
              pueden influir en el éxito a largo plazo de las organizaciones.
            </p>
            <a
              href="/admin_empresas"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Informática -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{informatica}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Informática</h2>
            <p class="text-sm lg:text-base my-2">
              Adéntrate en el emocionante mundo de la Informática. Aprende a
              programar, desarrollar software y crear soluciones tecnológicas
              innovadoras para abordar los desafíos modernos.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde la codificación hasta la arquitectura de sistemas, esta
              carrera te proporcionará habilidades en lenguajes de programación,
              diseño de algoritmos y desarrollo de aplicaciones. Explora cómo la
              tecnología informática está transformando industrias y mejorando
              la vida de las personas en todo el mundo.
            </p>
            <a
              href="/informatica"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Tecnología de Alimentos -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{tda}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Tecnología de Alimentos</h2>
            <p class="text-sm lg:text-base my-2">
              Explora la ciencia y la creatividad detrás de la Tecnología de
              Alimentos. Aprende cómo crear, procesar y mejorar productos
              alimenticios seguros y deliciosos para el consumo humano.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde la investigación de ingredientes hasta la producción y
              distribución, esta carrera te proporcionará conocimientos sobre
              nutrición, seguridad alimentaria y tecnologías de procesamiento.
              Descubre cómo contribuir a la innovación en la industria
              alimentaria y aportar soluciones para una alimentación sostenible.
            </p>
            <a
              href="/tecnologia_de_alimentos"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>

        <!-- Comunicación y Electrónica -->
        <div
          class="relative h-[500px] bg-cover bg-center"
          style="background-image: url('{cye}');"
        >
          <div class="absolute inset-0 bg-sky-600/80 transition duration-300" />
          <div
            class="absolute inset-0 flex flex-col justify-center items-center text-white p-4 max-w-[900px] w-full mx-auto"
          >
            <h2 class="text-2xl font-semibold">Comunicación y Electrónica</h2>
            <p class="text-sm lg:text-base my-2">
              Descubre la fusión entre la tecnología y la comunicación con la
              carrera de Comunicación y Electrónica. Aprende cómo diseñar y
              desarrollar sistemas electrónicos para transmitir información de
              manera efectiva.
            </p>
            <p class="text-sm lg:text-base my-2">
              Desde las telecomunicaciones hasta la electrónica de consumo, esta
              carrera te proporcionará conocimientos sobre circuitos, señales y
              tecnologías de transmisión. Explora cómo las redes digitales y las
              soluciones de comunicación están conectando a las personas en todo
              el mundo y revolucionando la forma en que nos comunicamos.
            </p>
            <a
              href="/comunicacion_electronica"
              target="_blank"
              class="mt-4 btn variant-filled-surface bg-pink-600">Ver Pensum</a
            >
          </div>
        </div>
      </Carousel>
    </div>
  </section>

  <section class="bg-white w-full h-full flex items-center justify-center">
    <Saos
      animation={"scale-in-center 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both"}
    >
      <figure class="w-full h-full mx-auto">
        <img src={footer} class="mx-auto" alt="footerImg" />
      </figure>
    </Saos>
  </section>

  <section class="container py-12 mx-auto md:px-6 bg-white">
    <div
      class="block rounded-lg bg-[#969EAF]/20 shadow-[0_2px_15px_-3px_rgba(0,0,0,0.07),0_10px_20px_-2px_rgba(0,0,0,0.04)]"
    >
      <div class="flex flex-wrap items-center">
        <div class="block w-full lg:flex lg:w-6/12 xl:w-6/12">
          <div class="h-[500px] w-full">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15707.605368690223!2d-67.4631426!3d10.188667!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e802191d1a3c495%3A0x946544827370ba45!2sInstituto%20Universitario%20de%20Tecnologia%20Pascal!5e0!3m2!1sen!2sve!4v1694989618341!5m2!1sen!2sve"
              width="600"
              height="450"
              style="border:0;"
              allowfullscreen
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"
              class="left-0 top-0 h-full w-full rounded-t-lg lg:rounded-tr-none lg:rounded-bl-lg"
              title="IU Pascal location"
            />
          </div>
        </div>

        <div
          class="w-full lg:w-6/12 xl:w-6/12 flex flex-col items-center py-16 gap-12"
        >
          <p class="font-bold text-4xl text-center">Donde nos encontramos?</p>
          <div class="flex items-center">
            <div class="rounded-md bg-blue-600 p-4">
              <Icon class="w-6 h-6 text-white" src={MapPin} />
            </div>
            <div class="ml-6">
              <p class="mb-2">
                Calle Miranda sector Barrancón. Edif. Mayra Local 2-16. <br /> Cagua
                - Edo. Aragua.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer
    class="footer p-10 bg-white text-blue-800 flex items-center justify-around"
    style="border-top: 1px solid rgb(229 231 235);
  "
  >
    <aside>
      <img class="w-14 h-14 mb-2" src={logo} alt="logo" />
      <p>Instituto Universitario Pascal<br />Estudios Técnicos Superiores</p>
    </aside>
    <nav>
      <p class="font-bold text-xl mb-4">Contactanos!</p>
      <div class="grid grid-flow-col gap-4 items-center justify-center">
        <a
          href="https://www.instagram.com/iutpascal_oficial/"
          rel="noopener noreferrer"
          target="_blank"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            x="0px"
            y="0px"
            width="32"
            height="32"
            viewBox="0 0 48 48"
          >
            <radialGradient
              id="yOrnnhliCrdS2gy~4tD8ma_Xy10Jcu1L2Su_gr1"
              cx="19.38"
              cy="42.035"
              r="44.899"
              gradientUnits="userSpaceOnUse"
              ><stop offset="0" stop-color="#fd5" /><stop
                offset=".328"
                stop-color="#ff543f"
              /><stop offset=".348" stop-color="#fc5245" /><stop
                offset=".504"
                stop-color="#e64771"
              /><stop offset=".643" stop-color="#d53e91" /><stop
                offset=".761"
                stop-color="#cc39a4"
              /><stop offset=".841" stop-color="#c837ab" /></radialGradient
            ><path
              fill="url(#yOrnnhliCrdS2gy~4tD8ma_Xy10Jcu1L2Su_gr1)"
              d="M34.017,41.99l-20,0.019c-4.4,0.004-8.003-3.592-8.008-7.992l-0.019-20	c-0.004-4.4,3.592-8.003,7.992-8.008l20-0.019c4.4-0.004,8.003,3.592,8.008,7.992l0.019,20	C42.014,38.383,38.417,41.986,34.017,41.99z"
            /><radialGradient
              id="yOrnnhliCrdS2gy~4tD8mb_Xy10Jcu1L2Su_gr2"
              cx="11.786"
              cy="5.54"
              r="29.813"
              gradientTransform="matrix(1 0 0 .6663 0 1.849)"
              gradientUnits="userSpaceOnUse"
              ><stop offset="0" stop-color="#4168c9" /><stop
                offset=".999"
                stop-color="#4168c9"
                stop-opacity="0"
              /></radialGradient
            ><path
              fill="url(#yOrnnhliCrdS2gy~4tD8mb_Xy10Jcu1L2Su_gr2)"
              d="M34.017,41.99l-20,0.019c-4.4,0.004-8.003-3.592-8.008-7.992l-0.019-20	c-0.004-4.4,3.592-8.003,7.992-8.008l20-0.019c4.4-0.004,8.003,3.592,8.008,7.992l0.019,20	C42.014,38.383,38.417,41.986,34.017,41.99z"
            /><path
              fill="#fff"
              d="M24,31c-3.859,0-7-3.14-7-7s3.141-7,7-7s7,3.14,7,7S27.859,31,24,31z M24,19c-2.757,0-5,2.243-5,5	s2.243,5,5,5s5-2.243,5-5S26.757,19,24,19z"
            /><circle cx="31.5" cy="16.5" r="1.5" fill="#fff" /><path
              fill="#fff"
              d="M30,37H18c-3.859,0-7-3.14-7-7V18c0-3.86,3.141-7,7-7h12c3.859,0,7,3.14,7,7v12	C37,33.86,33.859,37,30,37z M18,13c-2.757,0-5,2.243-5,5v12c0,2.757,2.243,5,5,5h12c2.757,0,5-2.243,5-5V18c0-2.757-2.243-5-5-5H18z"
            />
          </svg>
        </a>
        <a
          href="https://api.whatsapp.com/send/?phone=584243664959&text&type=phone_number&app_absent=0"
          rel="noopener noreferrer"
          target="_blank"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            x="0px"
            y="0px"
            width="32"
            height="32"
            viewBox="0 0 48 48"
          >
            <path
              fill="#fff"
              d="M4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98c-0.001,0,0,0,0,0h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303z"
            /><path
              fill="#fff"
              d="M4.868,43.803c-0.132,0-0.26-0.052-0.355-0.148c-0.125-0.127-0.174-0.312-0.127-0.483l2.639-9.636c-1.636-2.906-2.499-6.206-2.497-9.556C4.532,13.238,13.273,4.5,24.014,4.5c5.21,0.002,10.105,2.031,13.784,5.713c3.679,3.683,5.704,8.577,5.702,13.781c-0.004,10.741-8.746,19.48-19.486,19.48c-3.189-0.001-6.344-0.788-9.144-2.277l-9.875,2.589C4.953,43.798,4.911,43.803,4.868,43.803z"
            /><path
              fill="#cfd8dc"
              d="M24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,4C24.014,4,24.014,4,24.014,4C12.998,4,4.032,12.962,4.027,23.979c-0.001,3.367,0.849,6.685,2.461,9.622l-2.585,9.439c-0.094,0.345,0.002,0.713,0.254,0.967c0.19,0.192,0.447,0.297,0.711,0.297c0.085,0,0.17-0.011,0.254-0.033l9.687-2.54c2.828,1.468,5.998,2.243,9.197,2.244c11.024,0,19.99-8.963,19.995-19.98c0.002-5.339-2.075-10.359-5.848-14.135C34.378,6.083,29.357,4.002,24.014,4L24.014,4z"
            /><path
              fill="#40c351"
              d="M35.176,12.832c-2.98-2.982-6.941-4.625-11.157-4.626c-8.704,0-15.783,7.076-15.787,15.774c-0.001,2.981,0.833,5.883,2.413,8.396l0.376,0.597l-1.595,5.821l5.973-1.566l0.577,0.342c2.422,1.438,5.2,2.198,8.032,2.199h0.006c8.698,0,15.777-7.077,15.78-15.776C39.795,19.778,38.156,15.814,35.176,12.832z"
            /><path
              fill="#fff"
              fill-rule="evenodd"
              d="M19.268,16.045c-0.355-0.79-0.729-0.806-1.068-0.82c-0.277-0.012-0.593-0.011-0.909-0.011c-0.316,0-0.83,0.119-1.265,0.594c-0.435,0.475-1.661,1.622-1.661,3.956c0,2.334,1.7,4.59,1.937,4.906c0.237,0.316,3.282,5.259,8.104,7.161c4.007,1.58,4.823,1.266,5.693,1.187c0.87-0.079,2.807-1.147,3.202-2.255c0.395-1.108,0.395-2.057,0.277-2.255c-0.119-0.198-0.435-0.316-0.909-0.554s-2.807-1.385-3.242-1.543c-0.435-0.158-0.751-0.237-1.068,0.238c-0.316,0.474-1.225,1.543-1.502,1.859c-0.277,0.317-0.554,0.357-1.028,0.119c-0.474-0.238-2.002-0.738-3.815-2.354c-1.41-1.257-2.362-2.81-2.639-3.285c-0.277-0.474-0.03-0.731,0.208-0.968c0.213-0.213,0.474-0.554,0.712-0.831c0.237-0.277,0.316-0.475,0.474-0.791c0.158-0.317,0.079-0.594-0.04-0.831C20.612,19.329,19.69,16.983,19.268,16.045z"
              clip-rule="evenodd"
            />
          </svg>
        </a>
      </div>
    </nav>
  </footer>
</main>

<style>
  .hero {
    background: url("../lib/images/est7.jpg") center/cover no-repeat;
    background-attachment: fixed;
  }

  /* section {
    backdrop-filter: blur(10px);
  } */

  .backdrop {
    opacity: 50%;
    z-index: 0;
  }

  h2 {
    font-size: 30px;
    color: white;
    font-weight: bold;
  }

  @keyframes -global-slide-in-top {
    0% {
      transform: translateY(-1000px);
      opacity: 0;
    }
    100% {
      transform: translateY(0);
      opacity: 1;
    }
  }

  @keyframes -global-from-left {
    0% {
      transform: rotateX(50deg) translateX(-100vw);
      opacity: 1;
    }
    100% {
      transform: rotateX(0deg) translateX(0);
      opacity: 1;
    }
  }

  @keyframes -global-from-right {
    0% {
      transform: rotateX(-50deg) translateX(100vw);
      opacity: 1;
    }
    100% {
      transform: rotateX(0deg) translateX(0);
      opacity: 1;
    }
  }

  @keyframes -global-scale-in-center {
    0% {
      transform: scale(0);
      opacity: 1;
    }
    100% {
      transform: scale(1);
      opacity: 1;
    }
  }

  :global(.sc-carousel-button, .sc-carousel-progress__indicator) {
    background-color: white !important;
  }

  :global(.sc-carousel__content-container, .sc-carousel__pages-container) {
    height: 500px !important;
  }
</style>
