window.addEventListener("load", main);

import * as Xson from "./json.js";
import * as crearHTMLconJSON from "./crearhtmlConJSon.js";
import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";

function consola(params) {
  console.log(params)
}//Para el debugg unicamente

function abrirJson(carpeta, json) {
  return Xson.abrirJson(carpeta, json)
    .catch((error) => {
      console.error(error);
      throw error; // Rechaza la promesa con el error original
    });
}//Todos los archivos pasan por acá.


function main() {
  agregarEventos();//Cuando una etiqueta necesita un evento, lo agrego acá
  insertarOptionsEnSection(); //Actualiza el Select con los botones de clada grado
}

async function agregarEventos() {
  //Las etiquetas son constantes
  const OBJ_SELECT = etikedo.troviIdn(cst.ID_SELECT);

  //agregar Eventos
  OBJ_SELECT.addEventListener("change", seleccionarClase)
}

async function seleccionarClase() {
  const SELECT_VALUE = etikedo.troviIdn(cst.ID_SELECT).value;
  try {
    const ARCH = await abrirJson("Japones", SELECT_VALUE);
    const OBJ_SECTION = etikedo.troviIdn(cst.ID_SECTION);
    limpiar(OBJ_SECTION);
    cargarHTMLconJSON(ARCH, OBJ_SECTION); 
  } catch (error) {
    console.error('Error al cargar el JSON:', error);
    // Maneja el error según sea necesario
  }
}

function limpiar(tema) {
  tema.innerHTML=""
}

function cargarHTMLconJSON(ARCH, PADRE) {
  crearHTMLconJSON.crearPagina(ARCH, PADRE)
}

async function insertarOptionsEnSection() {
  try {
    const OBJ_SELECT = etikedo.troviIdn(cst.ID_SELECT);
    const ARCH = await abrirJson("","Botones");
    const CLASES = ARCH.clases;

    for (let index = 0; index < CLASES.length; index++) {
      const OBJ_OPTION = etikedo.krei(cst.E_OP);
      etikedo.aldoniTekston(CLASES[index][0], OBJ_OPTION);
      etikedo.aldoniAtributon(OBJ_OPTION, cst.ATR_VALUE, CLASES[index][1]);
      etikedo.aldoniFilon(OBJ_OPTION, OBJ_SELECT);
    }
  } catch (error) {
    consola(error);
  }

  try {
    await seleccionarClase();
  } catch (error) {
    consola(error);
  }
}
