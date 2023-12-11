export function aldoniAtributon(objHTML, atributo, valor){
    objHTML.setAttribute(atributo, valor);
    return objHTML
}

export function aldoniFilon(filo, patro) {
    patro.appendChild(filo)
    return patro;
}

export function aldoniKlasojn(objHTML, Array) {
    let valor="";
    for (const key in Array) {
      valor+=Array[key]+" ";
    }
    aldoniAtributon(objHTML, "class" ,valor);  
    return objHTML;
}

export function aldoniStilon(objHTML, objJSON) {
    let atr;
    let valor="";
    for (const id in objJSON) {
        atr=id;
        const atrValor = objJSON[id];
        valor+=ripariStilon(atr, atrValor)
    }
    aldoniAtributon(objHTML, "style", valor);  
    return objHTML;
}
export function aldoniStilonAlTablo(objHTML, ARRAY){
    let atr;
    let valor="";
    for (const id in ARRAY) {
        atr=id;
        const atrValor = ARRAY[id];
        switch (atr) {
            case "espandir":
                aldoniAtributon(objHTML, "colspan", atrValor)
                break;
            default:
                valor+=ripariStilon(atr, atrValor);
                break;
        }
    }
    aldoniAtributon(objHTML, "style", valor);  
    return objHTML;
}

export function aldoniTekston(txt, objHTML) {
    aldoniFilon(kreiNodon(txt), objHTML)
    return objHTML;
}

export function krei(etiqueta) {
    return document.createElement(etiqueta)
}

function kreiNodon(txt) {
    return document.createTextNode(txt)
}

function ripariStilon(style, valor) {
    let key=style;
    switch (style) {
        case "bg":
            key="background-color"
            break;
        case "alinear":
            key="text-align"
        default:
            break;
    }
    const atr = key+":"
    valor=valor.toString();
    switch (valor.toLowerCase()) {
        case "rojo":
            return atr+"red;";
        case "verde":
            return atr+"green;";
        case "negro":
            return atr+"black;";
        case "blanco":
            return atr+"white;";
        case "rosa":
            return atr+"#CD8167";
        default:
            return atr+valor+";";    
    }
}

export function troviIdn(etiqueta) {
    return document.getElementById(etiqueta)
}