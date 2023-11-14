
export function fari(etiqueta) {
    return document.createElement(etiqueta)
}

export function troviIdn(etiqueta) {
    return document.getElementById(etiqueta)
}

export function almetiTekston(etiqueta, txt) {
    return almetiFilon(etiqueta, fariNodon(txt))
}

export function almetiFilon(patro, filo) {
    return patro.appendChild(filo)
}

export function almetiAtributon(etiqueta, atributo, valor){
    return etiqueta.setAttribute(atributo, valor);
}

function fariNodon(txt) {
    return document.createTextNode(txt)
}