window.addEventListener("load", main);

import * as Xson from "./json.js";
import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";

function consola(params) {
  console.log(params)
}//Para el debugg unicamente

function abrirJson(carpeta,json) {
  return Xson.abrirJson(carpeta, json)
    .then((resultado) => {
      return((resultado));
    })
    .catch((error) => {
        console.error(error);
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
  const ARCH = await abrirJson("Ejemplos","ejemplo3");
  cargarClase(ARCH);
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
  //limpiar
  const OBJ_SECTION = etikedo.troviIdn(cst.ID_SECTION)
  limpiar(OBJ_SECTION);

  //Cargar
  const TITULO = ARCH.titulo_clase;
  const TITULO_TEMA = ARCH.tema.titulo_tema;

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
      if(objHTML){
        etikedo.aldoniFilon(objHTML, OBJ_ARTICLE)
      }
    }
    
    etikedo.aldoniFilon(OBJ_ARTICLE, OBJ_SECTION)
  }
}

function crearEtiqueta(OBJ_JSON) {
  const ETIQUETA=OBJ_JSON.etikedo
  const INFO=OBJ_JSON.info
  
  const objHTML = etikedo.krei(ETIQUETA);
  let ATR="";
  let stiloTh="";
  let TITULO="";
  if (OBJ_JSON.titulo) {
    TITULO=OBJ_JSON.titulo;
  }
  if (OBJ_JSON.atr) {
    ATR=OBJ_JSON.atr;
    etikedo.aldoniAtributojn(objHTML, ATR);
  }
  if (OBJ_JSON.style) {
    stiloTh=OBJ_JSON.style;
  }
  switch (ETIQUETA) {
    case cst.E_P:
      return llenar_P(objHTML, INFO);
    case cst.E_TABLA:
      return llenar_Tabla(objHTML, TITULO, INFO, stiloTh);
    case cst.E_DIV:
      return llenar_Div(objHTML, TITULO, INFO);
    default:
      break;
  }
}
//crearetiqueta
function llenar_P(objHTML, INFO) {
  etikedo.aldoniTekston(INFO, objHTML);
  return objHTML;
}
//crearetiqueta
function llenar_Tabla(objHTML, TITULO, INFO, stiloTh) {
  const FILAS = INFO.tr;
  agregarTitulo(objHTML, TITULO, stiloTh)
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
      etikedo.aldoniStilon(OBJ_T_DH, ATRS)
      etikedo.aldoniFilon(OBJ_T_DH, OBJ_TR)
    }
    etikedo.aldoniFilon(OBJ_TR, objHTML)
  }
  return objHTML;
}
//llenar_Tabla
function agregarTitulo(objHTML, TITULO, style) {
  if (TITULO.length!=0) {
    const OBJ_TR_TITULO = etikedo.krei(cst.E_TR);
    const OBJ_TH_TITULO = etikedo.krei(cst.E_TH);
    etikedo.aldoniTekston(TITULO, OBJ_TH_TITULO)
    etikedo.aldoniStilon(OBJ_TH_TITULO, style)
    etikedo.aldoniFilon(OBJ_TH_TITULO, OBJ_TR_TITULO);
    etikedo.aldoniFilon(OBJ_TR_TITULO, objHTML)
  }
  return objHTML;
}
//crearetiqueta
function llenar_Div(objHTML, TITULO, INFO) {
  const CONTENIDO = INFO
  for (const key in CONTENIDO) {
    const ETIQUETA = CONTENIDO[key];
    const objHTML2 = crearEtiqueta(ETIQUETA);
    etikedo.aldoniFilon(objHTML2, objHTML);
  }
  return objHTML;
}