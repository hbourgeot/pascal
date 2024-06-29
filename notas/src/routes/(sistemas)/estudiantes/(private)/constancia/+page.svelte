<script lang="ts">
  import constancia1 from "$lib/images/constancia1.png";
  import constancia2 from "$lib/images/constancia2.png";

  import type { PageData } from "./$types";
  import { onMount } from "svelte";
  import jsPDF from "jspdf";
  import html2canvas from "html2canvas";
  import { goto } from "$app/navigation";
  import { triggerToast } from "$lib/utils/toast";

  const fechaActual = new Date();

  // Obtener los componentes de la fecha
  var dia = fechaActual.getDate();
  var mes = fechaActual.getMonth();
  var anio = fechaActual.getFullYear();

  // Array con los nombres de los meses
  var meses = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];

  // Array con los nombres de los números del 1 al 31 en formato de palabras
  var numerosPalabras = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "siete",
    "ocho",
    "nueve",
    "diez",
    "once",
    "doce",
    "trece",
    "catorce",
    "quince",
    "dieciséis",
    "diecisiete",
    "dieciocho",
    "diecinueve",
    "veinte",
    "veintiuno",
    "veintidós",
    "veintitrés",
    "veinticuatro",
    "veinticinco",
    "veintiséis",
    "veintisiete",
    "veintiocho",
    "veintinueve",
    "treinta",
    "treinta y uno",
  ];

  // Obtener la fecha formateada
  var fecha =
    "a los " +
    numerosPalabras[dia - 1] +
    " días del mes de " +
    meses[mes] +
    " del año " +
    anio +
    ".";

  export let data: PageData;

  onMount(() => {
    const toPDF = document.getElementById("constancia");

    html2canvas(toPDF).then((canvas) => {
      const contentWidth = canvas.width;
      const contentHeight = canvas.height;

      const pdf = new jsPDF("p", "pt", "letter");

      // Establecer los márgenes deseados (en puntos)
      const margin = 40; // Margen de 40 puntos

      // Calcular el ancho y alto disponibles para el contenido en función de los márgenes
      const availableWidth = pdf.internal.pageSize.getWidth() - margin * 2;
      const availableHeight = pdf.internal.pageSize.getHeight() - margin * 2;

      // Calcular el factor de escala para ajustar el contenido al espacio disponible
      const scaleFactor = Math.min(
        availableWidth / contentWidth,
        availableHeight / contentHeight
      );

      // Calcular las nuevas dimensiones del contenido escalado
      const scaledWidth = contentWidth * scaleFactor;
      const scaledHeight = contentHeight * scaleFactor;

      // Calcular las coordenadas para centrar el contenido en la página
      const x = (pdf.internal.pageSize.getWidth() - scaledWidth) / 2;
      const y = (pdf.internal.pageSize.getHeight() - scaledHeight) / 2;

      // Agregar la imagen del lienzo escalado al PDF
      const imgData = canvas.toDataURL("image/jpeg", 1.0);
      pdf.addImage(imgData, "JPEG", x, y, scaledWidth, scaledHeight);

      //Guarda el PDF
      pdf.save("constancia.pdf");
      triggerToast("Constancia de estudios descargada!");
      window.close();
    });
  });
</script>

<div class="fixed top-0 left-0 z-50 bg-white h-screen w-screen text-xl p-3">
  Descargando pdf...
</div>

<main id="constancia">
  <div class="c28 doc-content z-2 overlay">
    <p class="c13 flex flex-row-reverse justify-between items-center">
      <span
        style="
          overflow: hidden;
          display: inline-block;
          margin: 0 0;
          border: 0 solid #000000;
          width: auto;
        "
        ><img
          alt=""
          src={constancia1}
          style="
            margin-left: -0px;
            margin-top: -0px;
            height: 150px;
            width: 1500px;
            transform: rotate(0rad) translateZ(0px);
            -webkit-transform: rotate(0rad) translateZ(0px);
          "
          title=""
        /></span
      ><span
        style="
          overflow: hidden;
          display: inline-block;
          margin: 0;
          border: 0 solid #000000;
          transform: rotate(0rad) translateZ(0px);
          -webkit-transform: rotate(0rad) translateZ(0px);
          width: 442.6px;
          height: 134px;
        "
        ><img
          alt=""
          src={constancia2}
          style="
            width: 442.6px;
            height: 134px;
            margin-left: 0;
            margin-top: 0;
            transform: rotate(0rad) translateZ(0px);
            -webkit-transform: rotate(0rad) translateZ(0px);
          "
          title=""
        /></span
      >
    </p>
    <p class="c13 c3"><span class="c8" /></p>
    <p class="c3 c13"><span class="c8" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c1"><span class="c7">CONSTANCIA DE ESTUDIOS</span></p>
    <p class="c1 c3" id="h.gjdgxs"><span class="c4" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c1 c3"><span class="c4" /></p>
    <p class="c5 c23">
      <span class="c11"
        >Quien suscribe <span class="c12">Dr. José Manuel Briceño Soto</span>,
        venezolano, mayor de edad, titular de Cédula de Identidad
        <span class="c12">N° V-10.371.547</span>, actuando en mi carácter de Sub
        director del
        <span class="c12">INSTITUTO UNIVERSITARIO DE TECNOLOGÍA PASCAL</span>,
        por medio de la presente se hace <span class="c12">constar</span> que
        el/la bachiller <span class="c12 capitalize">{data.nombre}</span>,
        titular de la cédula de identidad N°
        <span class="c12">{data.cedula},</span>
        es alumno/alumna regular de la institución, registrado bajo el número
        <span class="c12">Rif.J-30767674-4</span> para cursar el
        <span class="c12">{data.semestre} semestre</span> en el lapso académico
        2023-1 en la especialidad de
        <span class="c12 c20 uppercase">{data.carrera}.</span>
      </span>
    </p>
    <p class="c3 c5"><span class="c2" /></p>
    <p class="c5 c23">
      <span class="c2"
        >Constancia que se expide a solicitud de la parte interesada, en Cagua {fecha}
      </span>
    </p>
    <p class="c5 c23 c3"><span class="c9" /></p>
    <p class="c10"><span class="c9">Atentamente, </span></p>
    <p class="c10 c3"><span class="c9" /></p>
    <table class="c29">
      <tr class="c15">
        <td class="c19" colspan="1" rowspan="1">
          <p class="c18 c3"><span class="c9" /></p>
        </td>
      </tr>
      <tr class="c26">
        <td class="c6" colspan="1" rowspan="1">
          <p class="c1">
            <span class="c30">Dr.</span><span class="c31">&nbsp;</span><span
              class="c12">&nbsp;Jos&eacute; Manuel Brice&ntilde;o Soto</span
            >
          </p>
        </td>
      </tr>
      <tr class="c0">
        <td class="c24" colspan="1" rowspan="1">
          <p class="c1"><span class="c14">Sub_Director </span></p>
        </td>
      </tr>
    </table>
    <p class="c10 c3"><span class="c9" /></p>
    <p class="c3 c10"><span class="c9" /></p>
    <p class="c10 c3"><span class="c9" /></p>
    <p class="c10 c3"><span class="c9" /></p>
    <p class="c21">
      <span class="c16"
        >Gaceta Oficial N&ordm; 36.104 / Decreto Presidencial N&ordm; 1608 /
        RIF: J-30767674-4</span
      >
    </p>
    <p class="c1">
      <span class="c20 c22"
        >Calle Miranda, Sector Barranc&oacute;n. Edificio Mayra 2-16. Cagua
        2122, Estado Aragua.
      </span>
    </p>
    <p class="c1">
      <span class="c20 c22">Correo: controldeestudiospascal@gmail.com</span>
    </p>
  </div>
</main>

<style>
  @import url(https://themes.googleusercontent.com/fonts/css?kit=fpjTOVmNbO4Lz34iLyptLaIg6ghpHn1vhFthO1ORc08MRJdvAhQIE_EQ1n0u-GCfh-IFCFI2Ux9-D7ryZG0yUw);

  #constancia {
    min-width: 700px;
  }
  table td {
    padding: 0;
  }
  .c24 {
    border-right-style: solid;
    padding: 0 5.4pt 0 5.4pt;
    border-bottom-color: #000000;
    border-top-width: 0;
    border-right-width: 0;
    border-left-color: #000000;
    vertical-align: top;
    border-right-color: #000000;
    border-left-width: 0;
    border-top-style: solid;
    border-left-style: solid;
    border-bottom-width: 0;
    width: 240.9pt;
    border-top-color: #000000;
    border-bottom-style: solid;
  }
  .c6 {
    border-right-style: solid;
    padding: 0 5.4pt 0 5.4pt;
    border-bottom-color: #000000;
    border-top-width: 1pt;
    border-right-width: 0;
    border-left-color: #000000;
    vertical-align: top;
    border-right-color: #000000;
    border-left-width: 0;
    border-top-style: solid;
    border-left-style: solid;
    border-bottom-width: 0;
    width: 240.9pt;
    border-top-color: #000000;
    border-bottom-style: solid;
  }
  .c19 {
    border-right-style: solid;
    padding: 0 5.4pt 0 5.4pt;
    border-bottom-color: #000000;
    border-top-width: 0;
    border-right-width: 0;
    border-left-color: #000000;
    vertical-align: top;
    border-right-color: #000000;
    border-left-width: 0;
    border-top-style: solid;
    border-left-style: solid;
    border-bottom-width: 1pt;
    width: 240.9pt;
    border-top-color: #000000;
    border-bottom-style: solid;
  }
  .c21 {
    padding-top: 1pt;
    border-top-width: 0.5pt;
    border-top-color: #000000;
    padding-bottom: 0;
    line-height: 1;
    orphans: 2;
    border-top-style: solid;
    widows: 2;
    text-align: center;
  }
  .c8 {
    color: #000000;
    font-weight: 400;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 10pt;
    font-family: "Times New Roman", serif;
    font-style: normal;
  }
  .c4 {
    color: #000000;
    font-weight: 700;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 16pt;
    font-family: "Times New Roman", serif;
    font-style: normal;
  }
  .c2 {
    color: #000000;
    font-weight: 400;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 14pt;
    font-family: "Calibri", sans-serif;
    font-style: normal;
  }
  .c16 {
    color: #000000;
    font-weight: 700;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 10pt;
    font-family: "Open Sans", sans-serif;
    font-style: normal;
  }
  .c14 {
    color: #000000;
    font-weight: 700;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 14pt;
    font-family: "Arial", sans-serif;
    font-style: normal;
  }
  .c9 {
    color: #000000;
    font-weight: 400;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 16pt;
    font-family: "Times New Roman", serif;
    font-style: normal;
  }
  .c10 {
    padding-top: 0;
    text-indent: 35.4pt;
    padding-bottom: 0;
    line-height: 1.5;
    orphans: 2;
    widows: 2;
    text-align: center;
  }
  .c7 {
    color: #000000;
    font-weight: 700;
    text-decoration: none;
    vertical-align: baseline;
    font-size: 16pt;
    font-family: "Arial", sans-serif;
    font-style: normal;
  }
  .c5 {
    padding-top: 0;
    padding-bottom: 0;
    line-height: 1.5;
    orphans: 2;
    widows: 2;
    text-align: justify;
  }
  .c1 {
    padding-top: 0;
    padding-bottom: 0;
    line-height: 1;
    orphans: 2;
    widows: 2;
    text-align: center;
  }
  .c18 {
    padding-top: 0;
    padding-bottom: 0;
    line-height: 1.5;
    orphans: 2;
    widows: 2;
    text-align: center;
  }
  .c13 {
    padding-top: 0;
    padding-bottom: 0;
    line-height: 1;
    orphans: 2;
    widows: 2;
    text-align: left;
  }
  .c29 {
    border-spacing: 0;
    border-collapse: collapse;
    margin-right: auto;
  }
  .c20 {
    color: #000000;
    text-decoration: none;
    vertical-align: baseline;
    font-style: normal;
  }
  .c28 {
    background-color: rgba(255, 255, 255, 0.85);
    max-width: 540pt;
    padding: 36pt 36pt 36pt 36pt;
  }
  .c12 {
    font-size: 14pt;
    font-family: "Calibri", sans-serif;
    font-weight: 700;
  }
  .c22 {
    font-weight: 500;
    font-size: 8pt;
    font-family: "Open Sans", sans-serif;
  }
  .c30 {
    font-size: 14pt;
    font-family: "Arial", sans-serif;
    font-weight: 700;
  }
  .c11 {
    font-size: 14pt;
    font-family: "Calibri", sans-serif;
    font-weight: 400;
  }
  .c31 {
    font-size: 16pt;
    font-family: "Arial", sans-serif;
    font-weight: 700;
  }
  .c26 {
    height: 16.6pt;
  }
  .c15 {
    height: 23.9pt;
  }
  .c23 {
    text-indent: 35.4pt;
  }
  .c0 {
    height: 15.9pt;
  }
  .c3 {
    height: 10pt;
  }
  p {
    margin: 0;
    color: #000000;
    font-size: 10pt;
    font-family: "Times New Roman", serif;
  }
  main {
    background-image: url("$lib/images/pascalConFondo.png");
    background-repeat: no-repeat;
    background-size: 540pt;
    background-position: center bottom;
    max-width: 540pt;
    height: auto;
  }
</style>
