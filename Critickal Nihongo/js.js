window.addEventListener("load", insertarBotonesXML);


const pa = "p",
  he1 = "h1",
  he2 = "h2",
  he3 = "h3",
  di = "div",
  table = "table",
  tabla = "tabla",
  tah = "th",
  tar = "tr",
  tad = "td",
  sect = "section",
  arti = "article";
const titulo = "titulo",
  tipo = "tipo";
const style = "style",
  background_color = "background-color: ";
const idSelector = "arti",
  idMain = "contenido";
let p, p1, h1, h2, h3, div, tablo, th, tr, td;

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
  let key = $("#clases").val();
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

function wnode(texto) {
  return document.createTextNode(texto);
}

function melement(elemento) {
  return document.createElement(elemento);
}

function addTxtNodesMem(elementoHTML, elementosXML, index) {
  return elementoHTML.appendChild(wnode(elementosXML[index].childNodes[0].nodeValue));
}

function getAttribute(tagXML, atributo, index) {
  return tagXML[index].getAttribute(atributo);
}

function mkTxtDeAtr(CrearEtiquetaHTML, BuscarTagXML, AgregarAtributo, index) {
  let hijo = melement(CrearEtiquetaHTML);
  hijo.appendChild(wnode(getAttribute(BuscarTagXML, AgregarAtributo, index)));
  return hijo;
}

function articulo(xml) {
  var xmlDoc = xml.responseXML;

  const clase = xmlDoc.getElementsByTagName("clase");
  const tema = clase[0].getElementsByTagName("tema");
  const subtema = tema[0].getElementsByTagName("subtema");

  const main = document.getElementById(idMain);
  const section = document.getElementById(idSelector);
  let articulo;

  h1 = mkTxtDeAtr(he1, clase, titulo, 0);
  section.appendChild(h1);


  h2 = mkTxtDeAtr(he2, tema, titulo, 0);
  section.appendChild(h2);
  main.appendChild(section);

  for (let index = 0; index < subtema.length; index++) {
    articulo = melement(arti);
    if (getAttribute(subtema, titulo, index)) {
      h3 = mkTxtDeAtr(he3, subtema, titulo, index);
      articulo.appendChild(h3);
    }

    let parrafo = subtema[index].getElementsByTagName(pa);

    for (let index = 0; index < parrafo.length; index++) {
      p = melement(pa);
      switch (getAttribute(parrafo, tipo, index)) {
        case "ta":
          let parrafoTabla = parrafo[index].getElementsByTagName(tabla);
          crearTablo(parrafoTabla);
          break;

        case "di":
          let parrafoDi = parrafo[index].getElementsByTagName(di);
          crearDiv(parrafoDi);
          break;
        default:
          addTxtNodesMem(p, parrafo, index);
          break;
      }


      articulo.appendChild(p);
    }

    section.appendChild(articulo);
    main.appendChild(section);
  }
}

function crearTablo(parrafoElemento) {
  let tableR = parrafoElemento[0].getElementsByTagName(tar);

  tablo = melement(table);

  if (getAttribute(parrafoElemento, titulo, 0)) {
    th = mkTxtDeAtr(tah, parrafoElemento, titulo, 0);
    tablo.appendChild(th);
  }

  for (let index = 0; index < tableR.length; index++) {
    tr = melement(tar);
    let tableD = tableR[index].getElementsByTagName(tad);
    if (tableD.length > 0) {
      for (let index = 0; index < tableD.length; index++) {
        td = melement(tad);
        p1 = melement(pa);
        addTxtNodesMem(p1, tableD, index);
        td.appendChild(p1);
        tr.appendChild(td);
      }
    } else {
      p1 = melement(pa);
      addTxtNodesMem(p1, tableR, index);
      tr.appendChild(p1);
    }

    tablo.appendChild(tr);
  }

  tablo.setAttribute("class", "cajas " + getAttribute(parrafoElemento, "color", 0));
  p.appendChild(tablo);
}

function crearDiv(parrafoDiv) {
  div = melement(di);
  for (let index = 0; index < parrafoDiv.length; index++) {

    h3 = mkTxtDeAtr(he3, parrafoDiv, titulo, index);
    div.appendChild(h3);
    let divP = parrafoDiv[index].getElementsByTagName(pa);
    for (let index = 0; index < divP.length; index++) {
      p1 = melement(pa);
      addTxtNodesMem(p1, divP, index);
      div.appendChild(p1);
    }


    div.setAttribute("class", getAttribute(parrafoDiv, "class", index) + " " + getAttribute(parrafoDiv, "color", index));
    p.appendChild(div);
  }
}