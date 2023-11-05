function wnode(texto){
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
  let hijo=melement(CrearEtiquetaHTML);
  hijo.appendChild(wnode(getAttribute(BuscarTagXML, AgregarAtributo, index)));
  return hijo;
}