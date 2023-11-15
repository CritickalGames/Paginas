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
      const grado =GRADOS[index]
      const opcion = etikedo.krei(cst.OP)
      etikedo.almetiTekston(opcion, grado[0]);
      etikedo.almetiAtributon(opcion, "value", grado[1])
      etikedo.almetiFilon(LISTA, opcion)
    }
  } catch (error) {
    console.error('Error al abrir el archivo JSON:', error);
  }
  const primeraPagina = etikedo.troviIdn(cst.IDSELECT).value;
  await abrirClase(primeraPagina) //Cuando cargue, cargará la pagina inicial.
}
//Llamado en Insertar y Seleccionar
async function abrirClase(OPCION) {
  const ARCH = await abrirJson(OPCION);
  const LECCION = await ARCH;
  const TEMA = etikedo.troviIdn(cst.IDTEMA);
  /*Limpiar sections*/
  limpiar(TEMA);
  /*Conseguir las etiquetas[0], crear las etiquetas, agregar nodo de texto[1]*/
  /* ":3 = Hecho", ":/ = No Logrado", "Cada carita significa una sección de lo pedido"
      x/y Y es la cantidad de secciones necesarias
      [pendientes], {hechos}
    La "clase" es el titulo del section.1.:3 x/2
    El "titulo" del tema debe ser el subtitulo del section.2 :3 x/2
    Cada posición de "subtemas" es un article.3 :3 x/3
      El "titulo" debe ser titulo del articulo. Si no hay, no hay.4 :3 :3 :3 x/4
      Cada posición del "contenido" es una etiqueta.5 x/1 [completar tareas]
        La "posición 0" es la etiqueta a crear.6 :3 x/2
        La "posición 1" son los atributos.7 :3 x/2
        La "posición 2" es el contenido.8 :3 x/3 [obtener, completar tareas, almeti]
          Cada "posición" es una etiqueta.9
            La "posición 0" es la etiqueta.10
            La "posición 1" es el contenido.11
            Si la "posición" es un array,12
              cada posición interna es una etiqueta que sigue las normas anteriores.13
  */
  const TITULO_CLASE = LECCION.clase;//1.1
  const TIUTLO_TEMA = LECCION.tema.titulo;//2.1
  const SUBTEMAS = LECCION.tema.subtemas;//3.1 [recorrer,hacer los internos]

  for (let index = 0; index < SUBTEMAS.length; index++) {
    let article="";//4 aún no es un articulo
    const SUBTEMA = SUBTEMAS[index];
    if (SUBTEMA.titulo.length > 0) {//4.1 [agregar contenido]
      article= etikedo.krei("article");//4.2
      const H1= etikedo.krei(cst.H1);
      etikedo.almetiTekston(H1, SUBTEMA.titulo);//4.3
      etikedo.almetiFilon(article, H1);//4.3
    }//4.3/4 {compruebo si hay titulo, creo articulo, agrego titulo}

    for (let indexJ = 0; indexJ < SUBTEMA.contenido.length; indexJ++) {//4.4
      const CONTENIDO = SUBTEMA.contenido[indexJ];
      const ETIQUETA = CONTENIDO[0];//6.1 [crear etiqueta]
      const ATRIBUTOS = CONTENIDO[1];//7.1 [agregar atributos]
      const INFORMACION = CONTENIDO[2];//8.1 [Recorrer array, almeti on]
      const objtHTML=tipoEtiqueta(ETIQUETA, ATRIBUTOS, INFORMACION); //5.1 {distinguir etiqueta}
      consola(CONTENIDO)
    }//4.4/4{agregar contenido} //5.1 {completar tareas}

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
      break;
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
  const TR = informacion.tr;
  for (let index = 0; index < TR.length; index++) {
    const COLUMNA = TR[index];
    switch (key) {
      case value:
        
        break;
    
      default:
        break;
    }    
  }
  return etiqueta;
}
//tipoEtiqueta
function crearDiv(etiqueta,titulo, informacion) {
  
  return etiqueta;
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