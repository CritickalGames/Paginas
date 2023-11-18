let resultadoJsonGlobal;

export function abrirJson(JS) {
  let promesa=new Promise((resolve, reject) => {
    getJson(JS, resolve, reject);
  });
  return promesa
}

function getJson(JS, resolve, reject) {
  var archivo = "./JSonArchivos/" + JS + ".json";
  const xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4) {
      if (this.status == 200) {
        resultadoJsonGlobal = JSON.parse(this.responseText);
        resolve(resultadoJsonGlobal);
      } else {
        reject(new Error("Error al cargar el archivo JSON"));
      }
    }
  };
  xhttp.open("GET", archivo, true);
  xhttp.send();
}