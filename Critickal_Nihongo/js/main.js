window.addEventListener("load", main);

import * as Xson from "./json.js";
import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";

function consola(params) {
  console.log(params)
}

function abrirJson(JS) {
  return Xson.abrirJson(JS)
    .then((resultado) => {
      return((resultado));
    })
    .catch((error) => {
        console.error(error);
    });
}

function main() {  
  insertarClasesEnHeader();
}

async function insertarClasesEnHeader() {
  try {
    const arch = await abrirJson("Botones");
    const grados = await arch.grados
    const lista = etikedo.troviIdn(cst.IDSELECT);

    for(let index = 0; index < grados.length; index++){
      const grado =grados[index]
      const opcion = etikedo.fari(cst.OP)
      etikedo.almetiTekston(opcion, grado[0]);
      etikedo.almetiAtributon(opcion, "value", grado[1])
      etikedo.almetiFilon(lista, opcion)
    }
    console.log(lista)

  } catch (error) {
    console.error('Error al abrir el archivo JSON:', error);
  }
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