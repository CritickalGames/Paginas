import * as Xson from "./json.js";
import * as etikedo from "./manipular_html.js";

function abrirJson(carpeta, json) {
    return Xson.abrirJson(carpeta, json)
        .catch((error) => {
            console.error(error);
            throw error; // Rechaza la promesa con el error original
        });
}


const insertar_botones = {
    async insertar(dir, archivo, id_del_destino, dataset, clases) {
        try {
            const OBJ_DESTINO = etikedo.troviIdn(id_del_destino);
            const ARCH = await abrirJson(dir,archivo);
            const BOTONES = ARCH.filas;
        
            for (let index = 0; index < BOTONES.length; index++) {
                const OBJ_HIJO = etikedo.krei("button");
                etikedo.aldoniTekston(BOTONES[index][0], OBJ_HIJO);
                etikedo.aldoniAtributon(OBJ_HIJO, dataset, BOTONES[index][1]);
                etikedo.aldoniAtributon(OBJ_HIJO, "class", clases)
                etikedo.aldoniFilon(OBJ_HIJO, OBJ_DESTINO);
            }
        } catch (error) {
            consola(error);
        }
    },
    cxioj_datumaroj(dataset) {
        return document.querySelectorAll(`[${dataset}]`)
    }
}

export default insertar_botones