var xhttp;
xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myFunction(this);
    }
};
xhttp.open("GET", "MATERIAS/matemáticas-index.xml", true);
xhttp.send();

function myFunction(xml) {
    var x, i, txt, xmlDoc; 
    xmlDoc = xml.responseXML;
    txt = "";
    x = xmlDoc.getElementsByTagName("subtema");
    for (i = 0; i < x.length; i++) { 
        txt += x[i].childNodes[0].nodeValue + "<br>";
    }
    document.getElementById("example").innerHTML = txt;
}