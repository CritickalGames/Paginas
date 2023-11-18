export function almetiAtributon(objHTML, atributo, valor){
    objHTML.setAttribute(atributo, valor);
    return objHTML
}

export function almetiFilon(filo, patro) {
    patro.appendChild(filo)
    return patro;
}

export function almetiTekston(objHTML, txt) {
    almetiFilon(kreiNodon(txt), objHTML)
    return objHTML;
}

export function krei(etiqueta) {
    return document.createElement(etiqueta)
}

function kreiNodon(txt) {
    return document.createTextNode(txt)
}

export function troviIdn(etiqueta) {
    return document.getElementById(etiqueta)
}