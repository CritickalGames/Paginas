var xhttp;
xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myFunction(this);
    }
};
xhttp.open("GET", "MATERIAS/matematicas-index.xml", true);
xhttp.send();

function myFunction(xml) {
    var x,xTema =[], xCapitulo =[],xSubtema=[], txt, xmlDoc, yTema,yCapitulo,ySubtema;
    xmlDoc = xml.responseXML;
    txt = [];
    //txt += xSubtema[indx].childNodes[0].nodeValue + "<br>";
    yTema    = xmlDoc.getElementsByTagName("tema");
    for (i = 0; i < yTema.length; i++) { 
        if (yTema[i].nodeType == 1) {
            xTema.push(yTema[i]);
        }
    }

    
    var indx=0, indx1=0, i=0;
    for (indx; indx < yTema.length; indx++) {
        yCapitulo = yTema[indx].childNodes;
    
        var i = 0;
        for (indx1 = 0; indx1 < yCapitulo.length; indx1++) {
            if (yCapitulo[indx1].nodeType == 1) {
                xCapitulo[indx] = [];
                xCapitulo[indx][i] = yCapitulo[indx1];
                i++;
            }
        }
    }
    
    /*xCapitulo[0][0]=1;
    
    if (yCapitulo[index1].nodeType == 1) {
                xCapitulo[x][index1]=1;
            }


            xCapitulo.join('\n')
    */
    
    for (i = 0; i < xTema.length; i++) { 
        if (xTema[i].nodeType == 1) {
            txt+=xTema[i].nodeName+"<br>";
        }
    }
 txt="";
    var indx=0, indx1=0;
    for (indx; indx < yTema.length; indx++) {

        for (indx1 = 0; indx1 < xCapitulo[indx].length; indx1++) { // inicialización de indx1 en cada iteración
            txt += "-"+xCapitulo[indx][indx1];
        }
        txt+="<br>";
    }
    document.getElementById("example").innerHTML = txt;
    
}