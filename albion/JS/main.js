function mostrarTitulo(btn) {
    var titulo = btn.innerHTML;
    document.getElementById("mensaje").innerHTML = titulo;
}
// Hacer una petición AJAX al archivo PHP
$.ajax({
    url: 'PHP/main.php',
    type: 'GET',
    dataType: 'json',
    success: function(data) {
        // Manipular los datos recibidos
        console.log("data");
        console.log(data);
    },
    error: function(XMLHttpRequest, status, error) {
        // Manejar errores
        console.error(error);
    }
});
