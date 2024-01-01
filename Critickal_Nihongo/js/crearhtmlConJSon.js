import * as cst from "./variablesConstates.js";
import * as etikedo from "./manipularHTML.js";

export function crearPagina(ARCHIVO, PADRE) {
    console.log(PADRE);
    crearTema(ARCHIVO, PADRE);
}

function crearTema(ARCHIVO, PADRE) {
    const TEMA_TITULO = ARCHIVO.titulo;
    const OBJ_TEMA_TITULO = etikedo.krei(cst.E_H1);
    etikedo.aldoniTekston(TEMA_TITULO, OBJ_TEMA_TITULO);

    crearSubtemas(ARCHIVO.subtemas, PADRE);
}

function crearSubtemas(SUBTEMAS, PADRE) {
    const ARR_TITULOS = obtenerTitulos(SUBTEMAS);
    const OBJ_ARTICLE= etikedo.krei(cst.E_ART)
    ARR_TITULOS.forEach(element => {
        const OBJ_ETIQUETA=(crearParrafo(SUBTEMAS[element], OBJ_ARTICLE));
    });
    console.log(OBJ_ARTICLE);
    etikedo.aldoniFilon(OBJ_ARTICLE, PADRE)
}

function obtenerTitulos(object) {
    let array=Object.keys(object);
    return array;
}

function crearParrafo(ARR_PARRAFO, PADRE) {
    let obj_etiqueta;
    ARR_PARRAFO.forEach(PARRAFO => {
        const OBJ_CONTENEDOR= etikedo.krei(cst.E_DIV);
        if (PARRAFO.titulo) {
            agregarTitulo(PARRAFO, OBJ_CONTENEDOR);
        }
        if (PARRAFO.etiqueta) {
            crearConEtiqueta(PARRAFO, OBJ_CONTENEDOR);
            return;
        }
        crearSinEtiqueta(PARRAFO, obj_etiqueta, OBJ_CONTENEDOR);
        etikedo.aldoniFilon(OBJ_CONTENEDOR, PADRE);
    });
}
function agregarTitulo(PARRAFO, OBJ_CONTENEDOR) {
    const OBJ_H1 = etikedo.krei(cst.E_H1)
    etikedo.aldoniTekston(PARRAFO.titulo, OBJ_H1);
    etikedo.aldoniFilon(OBJ_H1, OBJ_CONTENEDOR);
}
function crearConEtiqueta(PARRAFO, PADRE) {
    const OBJ_ETIQUETA= crearEtiqueta(PARRAFO.etiqueta);
    for (const key in PARRAFO) {
        mirarAtributo(PARRAFO, key, OBJ_ETIQUETA);
    }
    etikedo.aldoniFilon(OBJ_ETIQUETA, PADRE)
}
function crearSinEtiqueta(PARRAFO, obj_etiqueta, OBJ_CONTENEDOR) {
    const OBJECT=PARRAFO.filas;
    for (const key in OBJECT) {
        const FILA = PARRAFO.filas[key];
        obj_etiqueta= etikedo.krei(cst.E_P);

        if (FILA.etiqueta) {
            console.log(FILA);
            crearConEtiqueta(FILA, OBJ_CONTENEDOR);
            continue;
        }

        for (const p in FILA) {
            etikedo.aldoniTekston(FILA[p], obj_etiqueta);
            etikedo.aldoniFilon(etikedo.krei(cst.E_BR), obj_etiqueta);                
        }
        etikedo.aldoniFilon(obj_etiqueta, OBJ_CONTENEDOR);
    }
}
function crearEtiqueta(etiqueta) {
    switch (etiqueta) {
        case "tabla":
            return etikedo.krei(cst.E_TABLA);
            break;
        case "lista ordenada":
            return etikedo.krei(cst.E_LISTA_ORDENADA);
            break;
        case "lista no ordenada":
            return etikedo.krei(cst.E_LISTA_NO_ORDENADA);
            break;
        default:
            return etikedo.krei(cst.E_DIV);
            break;
    }
}
function mirarAtributo(PARRAFO, key, PADRE) {
    const MATRIZ= PARRAFO[key]
    switch (key) {
        case "filas":
            seleccionarFilas(PARRAFO, MATRIZ, PADRE);
            break;
        case "contenido":
            console.log(key);
            break;
        case "info":
            console.log(key);
            break;
        case "atr":
            console.log(key);
            break;
        default:
            break;
    }
}
function seleccionarFilas(PARRAFO, MATRIZ, PADRE) {
    switch (PARRAFO.etiqueta) {
        case "tabla":
            for (const FILA in MATRIZ) {
                const OBJ = etikedo.krei(cst.E_TR);
                const COLUMNAS= MATRIZ[FILA];
                llenarFilas(OBJ, COLUMNAS);
                etikedo.aldoniFilon(OBJ, PADRE);
            }
            break;
        case "div":
            for (const FILA in MATRIZ) {
                const OBJ = etikedo.krei(cst.E_P);
                const COLUMNAS= MATRIZ[FILA];
                llenarFilas(OBJ, COLUMNAS);
                etikedo.aldoniFilon(OBJ, PADRE);
            }
            break;
        default://LISTAS
            for (const FILA in MATRIZ) {
                const OBJ = etikedo.krei(cst.E_LI);
                const COLUMNAS= MATRIZ[FILA];
                llenarFilas(OBJ, COLUMNAS);
                etikedo.aldoniFilon(OBJ, PADRE);
            }
            break;
    }
}
function llenarFilas(OBJ_FILA, COLUMNAS) {
    //RECORRER LAS COLUMNAS
    for (const COL in COLUMNAS) {
        const COLUMNA = COLUMNAS[COL];
        if (COLUMNA.etiqueta) {
            const CONTENEDOR= crearEtiqueta(COLUMNA.etiqueta);
            for (const key in COLUMNA) {
                mirarAtributo(COLUMNA, key, CONTENEDOR);
            }
            etikedo.aldoniFilon(CONTENEDOR, OBJ_FILA);
        }else{
            if (typeof COLUMNA.info != 'string') {
                let key = Object.keys(COLUMNA.info);
                const CONTENEDOR= etikedo.krei(key);
                etikedo.aldoniTekston(COLUMNA.info[key], CONTENEDOR);
                etikedo.aldoniFilon(CONTENEDOR, OBJ_FILA);
            }else{
                etikedo.aldoniTekston(COLUMNA.info, OBJ_FILA);
            }
        }
    }

    /*
    -
    */
}
/*
En el main tengo que:
hacer que sólo abra el json
enviar el json a crearhtmlConJson
    Procesar el json con crearhtmlConJson
incertar el html en el index.
*/

/*
export function exportHtml- recibe el json y devuelve un html
function crearObjHtml- convierte el json en un objeto
function crearHtml- consigue los atributos del OBJ y elige qué tipo de etiqueta crear
function llenarX- crear un llenar por cada etiqueta.
function procesarATR- para procesar los atributos del objt

necesito:
abrir el json
conseguir e insertar el titulo del json como h1
guardar subtemas como un obj
recorrer los titulos de los subtemas como un MAP
cada titulo es un array de obj
cada parrafo de un titulo tiene 3 posibles atr: titulo, contenido, etiqueta, atr, filas
necesito una función para procesar cada ATR de un parrafo:
function titulo/etiqueta/atr/filas/contenido.
*/

/*
Todos los JSon son temas
Un tema es una clase

Los temas tienen- titulo
Los temas tienen- subtemas

Un subtema es un atricle

Los subtemas tienen o no- titulo
Los subtemas tienen- contenedores

Los contenedores son:
[P]-por defecto se crean contenedores P
[otros]-los contenedores "otros" se estructuran en [contenedor][fila][contenido]
Casos esperables de contenedoers:
[table]- {filas:tr}{contenido:td o th}
[div]-{filas:p}{contenido:texto del parrafo}
[listas ordenas o desordenadas]-{filas}


*/