export function almetiAtributon(etiqueta, atributo, valor){
    return etiqueta.setAttribute(atributo, valor);
}

export function almetiFilon(patro, filo) {
    return patro.appendChild(filo)
}

export function almetiTekston(etiqueta, txt) {
    return almetiFilon(etiqueta, kreiNodon(txt))
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