var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      mostrarIndice(this);
    }
  };
  xhttp.open("GET", "MATERIAS/matematicas-index.xml", true);
  xhttp.send();

  function mostrarIndice(xml) {
    var i;
    var xmlDoc = xml.responseXML;
    var tabla = "<table><tr><th>Título</th><th>Capítulo</th><th>Subtemas</th></tr>";
    var temas = xmlDoc.getElementsByTagName("tema");
    for (i = 0; i < temas.length; i++) {
      tabla += "<tr><td>" +
      temas[i].getAttribute("titulo") +
      "</td><td></td><td></td></tr>";
      var capitulos = temas[i].getElementsByTagName("capitulo");
      for (j = 0; j < capitulos.length; j++) {
        tabla += "<tr><td></td><td>" +
        capitulos[j].getAttribute("nombre") +
        "</td><td>";
        var subtemas = capitulos[j].getElementsByTagName("subtema");
        for (k = 0; k < subtemas.length; k++) {
          tabla += subtemas[k].childNodes[0].nodeValue + "<br>";
        }
        tabla += "</td></tr>";
      }
    }
    tabla += "</table>";
    document.getElementById("example").innerHTML = tabla;
  }
