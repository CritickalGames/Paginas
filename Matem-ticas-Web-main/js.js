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
    var lista = "<ol type='A'>", tab="&nbsp;&nbsp;&nbsp;&nbsp;";
    var temas = xmlDoc.getElementsByTagName("tema");
    for (i = 0; i < temas.length; i++) {
      lista += "<li>"+temas[i].getAttribute("titulo")+"</li>"+"<ol type='I'>";

      var capitulos = temas[i].getElementsByTagName("capitulo");
      for (j = 0; j < capitulos.length; j++) {
        lista +="<li>"+capitulos[j].getAttribute("nombre")+"</li>"+"<ol>";

        var subtemas = capitulos[j].getElementsByTagName("subtema");
        for (k = 0; k < subtemas.length; k++) {
          lista += "<li>"+"<a HREF='#'>"+subtemas[k].childNodes[0].nodeValue+"</a>"+"</li>"+ "<br>";
        }
        
        lista += "</ol>";
      }
        lista += "</ol>";
    }
    lista += "</ol>";
    document.getElementById("example").innerHTML = lista;
  }
