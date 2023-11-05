var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      mostrarIndice(this);
    }
  };
  xhttp.open("GET", "TEMAS/quimica.xml", true);
  xhttp.send();

  function mostrarIndice(xml) {
    var i1, i2, i3, i4, i5;//Indices para el for; uno por for
    var xmlDoc = xml.responseXML;
    var ulA = "<ul>",ulC = "</ul>", liA= "<li>", liC= "</li>";
    var tab="&nbsp;&nbsp;&nbsp;&nbsp;";
    var lista = "Materias";//El tipo de lista; una lista de la Materia

    var xmateria, xtema;
    var subtema, punto, subpunto;

    xmateria = xmlDoc.getElementsByTagName("materia");//Def Materia como el elemento Materia
    lista += "-"+xmateria[0].getAttribute("id");
    lista += ulA;
    xtema = xmlDoc.getElementsByTagName("tema");
    for (i1 = 0; i1 < xtema.length; i1++) {
      lista += liA+xtema[i1].getAttribute("id");
      lista += ulA;
      subtema = xtema[i1].getElementsByTagName("subtema");
      for (i2 = 0; i2 < subtema.length; i2++) {
        lista +=liA+subtema[i2].getAttribute("id");
        lista += ulA;
        punto = subtema[i2].getElementsByTagName("punto");
        for (i3 = 0; i3 < punto.length; i3++) {
          lista +=liA+punto[i3].getAttribute("id");
          lista += ulA;
          subpunto = punto[i3].getElementsByTagName("subpunto");
          for (i4 = 0; i4 < subpunto.length; i4++) {
            lista += liA+subpunto[i4].getAttribute("id");
            lista += ulA;
            lista += liA+subpunto[i4].childNodes[0].nodeValue;
            lista += liC;
            lista += ulC;
            lista += liC;
          }
          lista += ulC;
          lista += liC;
        }
        lista += ulC;
        lista += liC;
      }
      lista += ulC;
      lista += liC;
    }
    document.getElementById("lista").innerHTML = lista;
  }
/*
function mostrarIndice(xml) {
    var i1, i2, i3, i4, i5;//Indices para el for; uno por for
    var xmlDoc = xml.responseXML;
    var ulA = "<ul>",ulC = "</ul>", liA= "<li>", liC= "</li>";
    var tab="&nbsp;&nbsp;&nbsp;&nbsp;";
    var lista = ulA+"Materia";//El tipo de lista; una lista de la Materia

    var materia, tema, subtema, punto, subpunto;

    materia = xmlDoc.getElementsByTagName("materia");//Def Materia como el elemento Materia
    for (i1 = 0; i1 < materia.length; i1++) {
      lista += liA+materia[i1].getAttribute("id");//Primer (y único elemento) de la lista materia; que tiene sub lista
      tema = materia[i1].getElementsByTagName("tema");//Def Tema como el elemento Tema
      
      for (i2 = 0; i2 < tema.length; i2++) {
        lista += liA+tema[i2].getAttribute("id");//Elemento de la lista tema; que tiene sub lista
        lista += ulA+"subtemas";//El tipo de sub lista; una lista de subTemas
        subtema = tema[i2].getElementsByTagName("subtema");//Def subTema como el elemento subTema  
        
      }
      lista += ulC;      
      lista += liC;
    }
    lista += ulC;
    lista += liC;
    document.getElementById("lista").innerHTML = lista;


        */