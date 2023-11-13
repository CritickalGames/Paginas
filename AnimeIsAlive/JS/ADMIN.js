window.addEventListener("load", main);


function main() {
    select();
    
    document.getElementById("nombre")
        .addEventListener("keyup", actualizarLista);
    document.getElementById("selector")
        .addEventListener("change", select);
    document.getElementById("boton")
        .addEventListener("click", boton);
}
function actualizarLista() {
    let select = $("#selector").val();
    let nombre = document.getElementById("nombre").value;
    
    switch (select) {
        case "Buscar":
            BuscarAnimesAll([nombre]);
        break;
        default:
            //alert("Ejecutado el Enlistar");
            BuscarAnimesNombre([nombre]);
            break;
    }
}
function select() {
    let select = $("#selector").val();
    let btn = $("#boton");
    btn.text(select);

    $("#boton").prop('disabled', false);
    $("#nombre").prop('disabled', false).attr("placeholder", "Nombre");
    $("#temporada").prop('disabled', false).attr("placeholder", "Temporada");
    $("#capitulo").prop('disabled', false).attr("placeholder", "Capitulo");
    $("#estado").prop('disabled', false);
    $("#opinon").prop('disabled', false).attr("placeholder", "Opinión");

    switch (select) {
        case "Subir":
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Borrar":
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Buscar":
            $("#boton").prop('disabled', true);
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Editar":
            $("#boton").prop('disabled', true);
            $("#nombre").prop('disabled', true);
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Listar":
            ListarAnimes(["Animes"]);
            $("#boton").prop('disabled', true);
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Inicial":
            actualizarLista();

            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Contar":
            ContarAnimes(["Animes"]);
            $("#boton").prop('disabled', true);
            $("#nombre").prop('disabled', true);
            $("#temporada").prop('disabled', true);
            $("#capitulo").prop('disabled', true);
            $("#estado").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Editar ":
            $("#capitulo").prop('disabled', true);
            $("#opinon").prop('disabled', true);
        break;
        case "Nuevo Capitulo":
            $("#opinon").prop('disabled', true);
        break;
    
        default:
            break;
    }
    actualizarLista();
}
function boton() {
    let btn = $("#boton");
    let nombre = document.getElementById("nombre").value;
    let temporada = document.getElementById("temporada").value;
    let capitulo = document.getElementById("capitulo").value;
    let estado = document.getElementById("estado").value;
    switch (btn.text()) {
        case "Subir":
            SubirAnimes([nombre]);
        break;
        case "Nuevo Capitulo":
            SubirEstados([nombre, temporada, capitulo, estado]);
        break;
        case "Editar Estado":
            EditarEstados([nombre, temporada, estado]);
        break;
        case "Borrar":
            BorrarAnimes([nombre]);
        break;
        case "Listar":
            Listar([]);
        break;
        default:
            break;
    }
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
function tablaANIMEs(elemento, fila) {
    //alert("entra");
    let nombre = fila.insertCell();
    if (elemento.nombre) {
        let Pnombre = document.createElement("p");
        let nodeN= document.createTextNode(elemento.nombre);
        Pnombre.appendChild(nodeN);
        
        nombre.appendChild(Pnombre);
        
        //nombre.innerHTML=elemento.nombre;
        
        fila.setAttribute("style", "cursor:pointer");
        Pnombre.setAttribute("class", "d-flex justify-content-center align-items-center");

        fila.addEventListener("click", (e)=>{
            $("#nombre").val(nombre.innerText);
            $("#temporada").val(elemento.temporada);
            actualizarLista();
        });

        fila.addEventListener("mouseover", (e)=>{
            fila.setAttribute("class", "table-warning");
            
        });
        fila.addEventListener("mouseout", (e)=>{
            fila.setAttribute("class", "");
        });
        
    }else{
        nombre.innerHTML="";
    }
}
function tablaESTADOS(elemento, fila) {
    //alert("entra");
    let temporada = fila.insertCell();
    let capitulo = fila.insertCell();
    let estado = fila.insertCell();
    if (elemento.temporada) {
        let Ptemporada = document.createElement("p");
        let nodeT= document.createTextNode(elemento.temporada);
        Ptemporada.appendChild(nodeT);
        let Pcapitulo = document.createElement("p");
        let nodeC= document.createTextNode(elemento.capitulo);
        Pcapitulo.appendChild(nodeC);
        let Pestado = document.createElement("p");
        let nodeE= document.createTextNode(elemento.estado);
        Pestado.appendChild(nodeE);
        
        temporada.appendChild(Ptemporada);
        capitulo.appendChild(Pcapitulo);
        estado.appendChild(Pestado);
        
        Ptemporada.setAttribute("class", "d-flex justify-content-center align-items-center");
        Pcapitulo.setAttribute("class", "d-flex justify-content-center align-items-center");
        Pestado.setAttribute("class", "d-flex justify-content-center align-items-center");
    }else{
        temporada.innerHTML="";
        capitulo.innerHTML="";
        estado.innerHTML="";
    }
}
function tablaOPINION(elemento, fila) {
    //alert("entra");
    let opinion = fila.insertCell();
    if (elemento.opinion) {
        opinion.innerHTML=elemento.opinion;
    }else{
        opinion.innerHTML="SIN CONFIGURAR";
    }
}
function celdaIMG(elemento, fila) {
    let vacio = fila.insertCell();
    let img = document.createElement("img");
    if (elemento.url!="") {
        let url= elemento.url
            url=url+elemento.archivo+elemento.formato;
            img.setAttribute("src", url);
            img.setAttribute("class", "portada rounded mx-auto d-block");
            vacio.setAttribute("class", "table-dark");
            vacio.appendChild(img);
    }else{
        //alert(elemento.url);
    }
}

function tablaGeneral(elemento, fila){
    celdaIMG(elemento, fila);
    tablaANIMEs(elemento, fila);
    tablaESTADOS(elemento, fila);
    tablaOPINION(elemento, fila);
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
function BorrarAnimes(valores) {
    $.ajax({
        type:"POST",
        url:"PHP/PROB/ANIMES/Borrar.php",
        data:{nombre:valores[0]},
        success:function(res){
            alert(res);
            $("#nombre").val($("#nombre").val().charAt(0));
                actualizarLista();
            $("#nombre").val("");
        },
        error: function(res){
            alert(res);
        }
    });
}

function BuscarAnimesNombre(valores) {
    $("#noBorrar").nextAll("tr").remove();
    $.ajax({
        type:"POST",
        url:"PHP/PROB/ANIMES/BuscarNombre.php",
        data:{nombre:valores[0]},
        dataType: "json",
        success:function(res){
            let data = JSON.stringify(res);
            data = JSON.parse(data);
            let tabla = document.getElementById("table");
            for (elemento of data) {
                let fila = tabla.insertRow();
                tablaGeneral(elemento, fila);
            }  
        },
        error: function(res){
            //alert(res);
        }
    });
}

function EditarEstados(valores) {
    $.ajax({
        type:"POST",
        url:"PHP/PROB/ESTADOS/Editar.php",
        data:{nombre:valores[0], temporada:valores[1], estado:valores[2]},
        success:function(res){
            //alert(res);
            actualizarLista();
        },
        error: function(res){
            //alert(res);
        }
    });
}

function Listar() {
    $("#noBorrar").nextAll("tr").remove();

    $.ajax({
        type:"POST",
        url:"PHP/PROB/ANIMES/Listar.php",
        dataType: "json",
        success:function(res){

            let data = JSON.stringify(res);
            data = JSON.parse(data);
            let tabla = document.getElementById("table");
            for (elemento of data) {
                let fila = tabla.insertRow();
                
                tablaGeneral(elemento, fila)
            }  
        }
    });
}

function SubirAnimes(valores) {
    $.ajax({
        type:"POST",
        url:"PHP/PROB/ANIMES/Subir.php",
        data:{nombre:valores[0]},
        success:function(res){
            //alert(res);
            actualizarLista();
        },
        error: function(res){
            //alert(res);
        }
    });
}

function SubirEstados(valores) {
    $.ajax({
        type:"POST",
        url:"PHP/PROB/ESTADOS/Subir.php",
        data:{nombre:valores[0], temporada:valores[1], capitulo:valores[2], estado:valores[3]},
        success:function(res){
            //alert(res);
            actualizarLista();
        },
        error: function(res){
            //alert(res);
        }
    });
}