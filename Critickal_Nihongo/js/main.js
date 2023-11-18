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

function agregarClases(ETIQUETA, Array) {
  etikedo.almetiAtributon(ETIQUETA, "class" ,Array[0]+" "+Array[1]);  
  return ETIQUETA;
}

function limpiar(tema) {
  tema.innerHTML=""
}
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
