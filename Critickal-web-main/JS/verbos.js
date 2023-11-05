$('#registrar').click( function() {
    let correo= $("#Correo_Registrar").val();
    let contra= $("#Contraseña_Registrar").val();
    let nombre= $("#Nombre_Registrar").val();
    let date  = $("#Nacimiento_Registrar").val();
    $.ajax(
            {
                url: 'CONTROLADOR/VERBO/Registrar.php?'+
                                            'correo='+correo+
                                            '&pass='+contra+
                                            '&name='+nombre+
                                            '&date='+date
            }
        )
    }
);


$('#buscar').click( function() {
    let correo= $("#Correo_Buscar").val();
    let contra= $("#Contraseña_Buscar").val();
    $.ajax(
            {
                url: 'CONTROLADOR/VERBO/Buscar.php?'+
                                            'correo='+correo+
                                            '&pass='+contra,
                success: function( data ) {
                    alert( 'OBTENGO "' + data + '"' );
                }
            }
        )
    }
);

/*
success: function( data ) {
                    alert( 'El servidor devolvio "' + data + '"' );
                }
*/