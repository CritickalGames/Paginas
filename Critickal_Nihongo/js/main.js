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

function limpiar(tema) {
  tema.innerHTML=""
}
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

function cargarClase(ARCH) {
  //limpiar página
  const OBJ_SECTION = etikedo.troviIdn(cst.ID_SECTION)
  limpiar(OBJ_SECTION);

  //Cargar
  const TITULO = ARCH.titulo_clase;
  const TITULO_TEMA = ARCH.tema.titulo_tema;
  consola(ARCH)
  const OBJ_H1=etikedo.krei(cst.E_H1);
  const OBJ_H2=etikedo.krei(cst.E_H2);
  etikedo.aldoniTekston(TITULO, OBJ_H1);
  etikedo.aldoniTekston(TITULO_TEMA, OBJ_H2);
  etikedo.aldoniFilon(OBJ_H1, OBJ_SECTION)
    etikedo.aldoniFilon(OBJ_H2, OBJ_SECTION)
  const SUBTEMAS = ARCH.tema.subtemas
  for (const key in SUBTEMAS) {
    const SUBTEMA = SUBTEMAS[key];
    const OBJ_ARTICLE = etikedo.krei(cst.E_ART);
    if (SUBTEMA.titulo.length>0) {
      const TITULO_SUBTEMA= SUBTEMA.titulo;
      const OBJ_H3 = etikedo.krei(cst.E_H3)
      etikedo.aldoniTekston(TITULO_SUBTEMA, OBJ_H3);
      etikedo.aldoniFilon(OBJ_H3, OBJ_ARTICLE)
    }
    const CONTENIDO_SUBTEMA = SUBTEMA.contenido
    for (const key in CONTENIDO_SUBTEMA) {
      const ETIQUETA = CONTENIDO_SUBTEMA[key]
      const objHTML= crearEtiqueta(ETIQUETA);
      etikedo.aldoniFilon(objHTML, OBJ_ARTICLE)
    }
    
    etikedo.aldoniFilon(OBJ_ARTICLE, OBJ_SECTION)
  }
}

function crearEtiqueta(OBJ_JSON) {
  const NOMBRE = OBJ_JSON[0];
  const ATRIBUTOS = OBJ_JSON[1];
  const INFO = OBJ_JSON[2];

  const objHTML = etikedo.krei(NOMBRE);
  
  const CLASE = ATRIBUTOS[cst.ATR_JSON_CLASE]
  const STILO = ATRIBUTOS[cst.ATR_JSON_ESTILO]
  const TITULO = ATRIBUTOS[cst.ATR_JSON_TITULO]

  etikedo.aldoniKlasojn(objHTML, [CLASE]);
  etikedo.aldoniStilon(objHTML, STILO)

  switch (NOMBRE) {
    case cst.E_P:
      return llenar_P(objHTML, INFO);
    case cst.E_TABLA:
      return llenar_Tabla(objHTML, TITULO, INFO, STILO);
    case cst.E_DIV:
      return llenar_Div(objHTML, TITULO, INFO);  
    default:
      break;
  }
}


function llenar_P(objHTML, INFO) {
  etikedo.aldoniTekston(INFO.contenido, objHTML);
  return objHTML;
}

function llenar_Tabla(objHTML, TITULO, INFO, STILO) {
  const FILAS = INFO.tr;
  if (TITULO.length!=0) {
    const OBJ_TR_TITULO = etikedo.krei(cst.E_TR);
    const OBJ_TH_TITULO = etikedo.krei(cst.E_TH);
    etikedo.aldoniTekston(TITULO, OBJ_TH_TITULO)
    etikedo.aldoniStilonAlTablo(OBJ_TH_TITULO, STILO)
    etikedo.aldoniFilon(OBJ_TH_TITULO, OBJ_TR_TITULO);
    etikedo.aldoniFilon(OBJ_TR_TITULO, objHTML)
  }
  for (const key in FILAS) {
    const OBJ_TR = etikedo.krei(cst.E_TR);
    const COLUMNAS = FILAS[key];

    for (const key in COLUMNAS) {
      const ID_COLUMNA = Object.keys(COLUMNAS[key]);
      const ETIQUETA = ID_COLUMNA[0]
      const ID_ATRS= ID_COLUMNA[1]
      const ATRS= COLUMNAS[key][ID_ATRS]

      const OBJ_T_DH=etikedo.krei(ETIQUETA)
      const TXT = COLUMNAS[key][ETIQUETA]
      etikedo.aldoniTekston(TXT, OBJ_T_DH);

      if (INFO.alinear){
        etikedo.aldoniStilon(OBJ_TR, {"alinear":INFO.alinear})
      }
      etikedo.aldoniStilonAlTablo(OBJ_T_DH, ATRS)
      etikedo.aldoniFilon(OBJ_T_DH, OBJ_TR)
    }
    etikedo.aldoniFilon(OBJ_TR, objHTML)
  }
  return objHTML;
}

function llenar_Div(objHTML, TITULO, INFO) {
  const CONTENIDO = INFO.contenido
  for (const key in CONTENIDO) {
    const ETIQUETA = CONTENIDO[key];
    const objHTML2 = crearEtiqueta(ETIQUETA);
    etikedo.aldoniFilon(objHTML2, objHTML);
  }
  return objHTML;
}