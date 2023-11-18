window.addEventListener("load", main);

import * as Xson from "./json.js";
import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";

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

function agregarClases(objHTML, Array) {
  let valor="";
  for (const key in Array) {
    valor+=Array[key]+" ";
  }
  etikedo.almetiAtributon(objHTML, "class" ,valor);  
  return objHTML;
}

function limpiar(tema) {
  tema.innerHTML=""
}
function main() {
  agregarEventos();//Cuando una etiqueta necesita un evento, lo agrego acá
  insertarClasesEnSection(); //Actualiza el Select con los botones de clada grado
}

async function agregarEventos() {
  //Las etiquetas son constantes
  const OBJ_SELECT = etikedo.troviIdn(cst.ID_SELECT);

  //agregar Eventos
  OBJ_SELECT.addEventListener("change", seleccionarClase)
}

async function seleccionarClase() {
  const SELECT_VALUE = etikedo.troviIdn(cst.ID_SELECT).value;
  const ARCH = await abrirJson(SELECT_VALUE);
  cargarClase(ARCH);
}

async function insertarClasesEnSection() {
  try {
    const OBJ_SELECT = etikedo.troviIdn(cst.ID_SELECT);
    const ARCH = await abrirJson("Botones");
    const CLASES = ARCH.clases;

    for (let index = 0; index < CLASES.length; index++) {
      const OBJ_OPTION = etikedo.krei(cst.E_OP);
      etikedo.almetiTekston(OBJ_OPTION, CLASES[index][0]);
      etikedo.almetiAtributon(OBJ_OPTION, cst.ATR_VALUE, CLASES[index][1]);
      etikedo.almetiFilon(OBJ_OPTION, OBJ_SELECT);
    }
  } catch (error) {
    consola("falló 'ABRIRJSON()'\n\n"+error);
  }

  try {
    await seleccionarClase();
  } catch (error) {
    consola("falló 'CARGARCLASE()'\n\n"+error);
  }
}

function cargarClase(ARCH) {
  //limpiar
  const OBJ_SECTION = etikedo.troviIdn(cst.ID_SECTION)
  limpiar(OBJ_SECTION);

  //Cargar
  const TITULO = ARCH.titulo_clase;
  const TITULO_TEMA = ARCH.tema.titulo;
  const SUBTEMAS = ARCH.tema.subtemas
  for (const key in SUBTEMAS) {
    const SUBTEMA = SUBTEMAS[key];
    const OBJ_ARTICLE = etikedo.krei(cst.E_ART);
    const TITULO_SUBTEMA= SUBTEMA.titulo;
    const CONTENIDO_SUBTEMA = SUBTEMA.contenido
    for (const key in CONTENIDO_SUBTEMA) {
      const ETIQUETA = CONTENIDO_SUBTEMA[key]
      const objHTML= crearEtiqueta(ETIQUETA);
      etikedo.almetiFilon(objHTML, OBJ_ARTICLE)
    }
    etikedo.almetiFilon(OBJ_ARTICLE, OBJ_SECTION)
  }
}

function crearEtiqueta(OBJ_JSON) {
  const NOMBRE = OBJ_JSON[0];
  const ATRIBUTOS = OBJ_JSON[1];
  const INFO = OBJ_JSON[2];

  const objHTML = etikedo.krei(NOMBRE);
  
  const CLASE = ATRIBUTOS[cst.ATR_JSON_CLASE]
  const COLOR = ATRIBUTOS[cst.ATR_JSON_COLOR]
  const TITULO = ATRIBUTOS[cst.ATR_JSON_TITULO]

  agregarClases(objHTML, [CLASE, COLOR]);

  switch (NOMBRE) {
    case cst.E_P:
      return llenar_P(objHTML, INFO);
    case cst.E_TABLA:
      return llenar_Tabla(objHTML, TITULO, INFO);
    case cst.E_DIV:
      return llenar_Div(objHTML, TITULO, INFO);  
    default:
      break;
  }
}

function llenar_P(objHTML, INFO) {
  etikedo.almetiTekston(objHTML, INFO.contenido);
  return objHTML;
}

function llenar_Tabla(objHTML, TITULO, INFO) {
  const FILAS = INFO.tr;
  for (const key in FILAS) {
    const OBJ_TR = etikedo.krei(cst.E_TR);
    const COLUMNAS = FILAS[key];
    for (const key in COLUMNAS) {
      const ID_COLUMNA = Object.keys(COLUMNAS[key]);
      const OBJ_T_DH=etikedo.krei(ID_COLUMNA)
      const TXT = COLUMNAS[key][ID_COLUMNA]
      if (Object.keys(COLUMNAS[key])=="th") {
        const OBJ_H1 = etikedo.krei(cst.E_H1);
        etikedo.almetiTekston(OBJ_H1, TXT);
        etikedo.almetiFilon(OBJ_H1, OBJ_T_DH)
      } else {
        etikedo.almetiTekston(OBJ_T_DH, TXT);
      }
      etikedo.almetiFilon(OBJ_T_DH, OBJ_TR)
    }
    etikedo.almetiFilon(OBJ_TR, objHTML)
  }
  return objHTML;
}

function llenar_Div(objHTML, TITULO, INFO) {
  const CONTENIDO = INFO.contenido
  for (const key in CONTENIDO) {
    const ETIQUETA = CONTENIDO[key];
    const objHTML2 = crearEtiqueta(ETIQUETA);
    etikedo.almetiFilon(objHTML2, objHTML);
  }
  return objHTML;
}