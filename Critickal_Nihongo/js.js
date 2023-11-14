import {manipularHTML as JsHTML} from "./js"
import {etiquetasConst as etiqueta} from "./js"
window.addEventListener("load", main);

function main() {  
  insertarBotonesXML();
}


function insertarBotonesXML() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      insertarOption(this);
    }
  };
  xhttp.open("GET", "Xarchivos/Botones.xml", true);
  xhttp.send();
}

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
}