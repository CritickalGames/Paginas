window.addEventListener("load", main);

import * as Xson from "./json.js";
import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";
//Variables globales
var claseActual; //Guarda el archivo JSON de la clase

function consola(params) {
  console.log(params)
}//Para el debugg unicamente

function abrirJson(json) {
  return Xson.abrirJson(json)
    .then((resultado) => {
      return((resultado));
    })
    .catch((error) => {
        console.error(error);
    });
}//Todos los archivos pasan por acá.

function main() {
  agregarEventos();//Cuando una etiqueta necesita un evento, lo agrego acá
  insertarClasesEnHeader(); //Actualiza el Select con los botones de clada grado
}

async function agregarEventos() {
  //Las etiquetas son constantes
  const SELECT = etikedo.troviIdn(cst.IDSELECT);

  //agregar Eventos
  SELECT.addEventListener("change", seleccionarClase)
}
//Llamado en agregarEventos
async function seleccionarClase() {
  const OPCION = etikedo.troviIdn(cst.IDSELECT).value;
  abrirClase(OPCION);
}

async function insertarClasesEnHeader() {
  try {
    const ARCH = await abrirJson("Botones");
    const GRADOS = await ARCH.grados
    const LISTA = etikedo.troviIdn(cst.IDSELECT);

    for(let index = 0; index < GRADOS.length; index++){
      const grado =GRADOS[index];
      const key = Object.keys(grado);
      const opcion = etikedo.krei(cst.OP);
      etikedo.almetiTekston(opcion, key);
      etikedo.almetiAtributon(opcion, "value", grado.key)
      etikedo.almetiFilon(LISTA, opcion)
    }

  } catch (error) {
    console.error('Error al abrir el archivo JSON:\n\n', error);
  }
  
  try{
    const primeraPagina = etikedo.troviIdn(cst.IDSELECT).value;
    await abrirClase(primeraPagina) //Cuando cargue, cargará la pagina inicial.
  }catch(error){
    console.error('Error al cargar la primera página:\n\n', error);
  }
  
}
//Llamado en Insertar y Seleccionar
async function abrirClase(OPCION) {
  const ARCH = await abrirJson(OPCION);
  const LECCION = await ARCH;
  const SECTION = etikedo.troviIdn(cst.IDTEMA);
  /*Limpiar sections*/
  limpiar(SECTION);
  const TITULO_CLASE = LECCION.clase;
  const TIUTLO_TEMA = LECCION.tema.titulo;
  const SUBTEMAS = LECCION.tema.subtemas;

  for (let index = 0; index < SUBTEMAS.length; index++) {
    let article="";//4 aún no es un articulo
    const SUBTEMA = SUBTEMAS[index];
    if (SUBTEMA.titulo.length > 0) {
      article= etikedo.krei("article");
      const H1= etikedo.krei(cst.H1);
      etikedo.almetiTekston(H1, SUBTEMA.titulo);
      etikedo.almetiFilon(article, H1);
    }

    for (let indexJ = 0; indexJ < SUBTEMA.contenido.length; indexJ++) {
      const CONTENIDO = SUBTEMA.contenido[indexJ];
      const ETIQUETA = CONTENIDO[0];
      const ATRIBUTOS = CONTENIDO[1];
      const INFORMACION = CONTENIDO[2];
      const objtHTML=tipoEtiqueta(ETIQUETA, ATRIBUTOS, INFORMACION);
      etikedo.almetiFilon(article, objtHTML);
    }
    consola(article)
    etikedo.almetiFilon(SECTION, article);
  }
}
//abrirClase
function limpiar(tema) {
  tema.innerHTML=""
}
//abrirClase
function tipoEtiqueta(etiqueta, atributos, informacion) {
  let objtHTML = etikedo.krei(etiqueta);
  const CLASE = atributos["class"];
  const TITULO = atributos["titulo"];
  const COLOR = atributos["color"];
  objtHTML=agregarClases(objtHTML,CLASE,COLOR);
  switch (etiqueta) {
    case cst.P:
      return crearP(objtHTML, informacion);//No necesita titulo
    case cst.TABLA:
      return crearTabla(objtHTML,TITULO, informacion);
    case cst.DIV:
      return crearDiv(objtHTML,TITULO, informacion);
    default:
      break;
  }
}
//tipoEtiqueta
function agregarClases(ETIQUETA, CLASE, COLOR) {
  etikedo.almetiAtributon(ETIQUETA, "class" ,CLASE+" "+COLOR);  
  return ETIQUETA;
}
//tipoEtiqueta
function crearP(etiqueta, informacion) {
  const TXT = informacion.contenido;
  etikedo.almetiTekston(etiqueta, TXT);
  return etiqueta;
}
//tipoEtiqueta
function crearTabla(etiqueta,titulo, informacion) {
  const FILAS = informacion.tr;
  for (let index = 0; index < FILAS.length; index++) {
    const TR = etikedo.krei("tr");
    const COLUMNA = FILAS[index];
    for (let index = 0; index < COLUMNA.length; index++) {
      const key = Object.keys(COLUMNA[index]);
      const T_DH=etikedo.krei(key);
      const VALOR = COLUMNA[index][key];
      if (key == "th") {
          const H1 = etikedo.krei(cst.H1);
          etikedo.almetiTekston(H1, titulo);
          etikedo.almetiFilon(T_DH, H1);
      }else{
          etikedo.almetiTekston(T_DH, VALOR);
      }
      etikedo.almetiFilon(TR, T_DH);
    }
    etikedo.almetiFilon(etiqueta, TR);
  }
  return etiqueta;
}
//tipoEtiqueta
function crearDiv(objtHTML,titulo, informacion) {
  const CONTENIDO = informacion.contenido
  for (let index = 0; index < CONTENIDO.length; index++) {
    const ETIQUETA = CONTENIDO[index][0];
    const ATRIBUTOS= CONTENIDO[index][1];
    const INFORMACION= CONTENIDO[index][2];
    const objtHTML2=tipoEtiqueta(ETIQUETA, ATRIBUTOS, INFORMACION);
    etikedo.almetiFilon(objtHTML, objtHTML2);
  }
  return objtHTML;
}

/*

function insertarOption(xml) {
  const xmlDoc = xml.responseXML;
  const grados = xmlDoc.getElementsByTagName("grados");
  const clases = grados[0].getElementsByTagName("grado");
  
  const select = document.getElementById("clases");
  let option;
  for (let index = 0; index < clases.length; index++) {
    option = melement("option");
    addTxtNodesMem(option, clases, index);

    let condicion = getAttribute(clases, "estado", index);
    if (condicion == "x") {
      option.setAttribute(style, "color: red");
    } else if (condicion == "y") {
      option.setAttribute(style, "color: blue");
    }
    select.appendChild(option);
  }
  elegirClaseXML();
}

function elegirClaseXML() {
  let key;
  $("#clases").change(function () {
    key = $("#clases").val();
    document.getElementById(idSelector).innerHTML = "";
    cambiarPagina(key);
  });
  cambiarPagina(key);
}

function cambiarPagina(key) {
  let origen = "XArchivos/";
  let fin = ".xml";
  document.getElementById(idSelector);
  let archivo = "";
  archivo = origen + key + fin;
  insertarXMLClases(archivo);
}

function insertarXMLClases(archivo) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      articulo(this);
    }
  };
  xhttp.open("GET", archivo, true);
  xhttp.send();
}*/