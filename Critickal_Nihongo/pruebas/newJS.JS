var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      mostrarIndice(this);
    }
  };
  xhttp.open("GET", "MATERIAS/matematicas-index.xml", true);
  xhttp.send();

  function mostrarIndice(xml) {
    
    var xmlDoc = xml.responseXML;
    var temas = xmlDoc.getElementsByTagName("tema");
    temas[i].getAttribute("titulo");
    temas[i].getElementsByTagName("capitulo");
    parrafo[k].childNodes[0].nodeValue;

    const newElement = document.createElement("div");
    newElement.classList.add("div");
    newElement.textContent = "soy un div creado con javascript";
    const node = document.createTextNode("This is new.");

    parafo.appendChild(node);
    document.querySelector(".container").appendChild(newElement);
    parent.removeChild(child);
    parent.replaceChild(para, child);
    
    //Recorrer
    for (let index = 0; index < listaDeTags.length; index++) {
      //Código      
    }
    
    document.getElementById("example").innerHTML = "texto";
    document.getElementById("contenido").appendChild(newElement);

  }