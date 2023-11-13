/*DML
-INSERT
-UPDATE
-DELETE
-SELECT
*/

/*BIEN
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE();
*/
/*
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE();
*/
/*
INSERT INTO REGIONES (IDR, PaísNombre)
    VALUE();
*/
/*
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE();
*/
/*
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE();
*/
/*
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE();
*/
/*
INSERT INTO TORENOS (IDT, Nombre, Año, IDC_Ciudades)
    VALUE();
*/
/*
INSERT INTO ESTADIOS (IDE, Nombre, IDC_Ciudades)
    VALUE();
*/
/*
INSERT INTO PARTIDOS (IDP, Dia, IDE_Estadios, IDT_Torenos)
    VALUE();
*/
/*
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Alineación)
    VALUE();
*/
/*
INSERT INTO SUCESOS (IDS, Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE();
*/
INSERT INTO EVENTOS (IDS_Sucesos, Evento)
    VALUE();
INSERT INTO PUNTOS (IDS_Sucesos, Puntos)
    VALUE();

/*
INSERT INTO SUSCRIPCIONES (Tipo, Precio, Plazo, Descripcion)
    VALUE();
*/
/*
INSERT INTO USUARIOS (IDU, Correo, Contraseña, Nombre, FTPerfil, Tipo_Suscripciones)
    VALUE();
*/
/*
INSERT INTO USER_SIGUE_USER (IDU_Seguidor_Usuarios, IDU_Seguido_Usuarios)
    VALUE();
*/
/*
INSERT INTO USER_SIGUE_PARTIDO (IDU_Usuarios, IDP_Partidos)
    VALUE();
*/
/*
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE();
*/
/*
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadoreses)
    VALUE();
*/
/*
INSERT INTO USER_ESPECULA_PARTIDO (IDU_Usuarios, IDJ_JugadoresesEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos)
    VALUE();
*/
/*
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE();
*/
/*
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE();
*/
/*
INSERT INTO PUBLICIDADES (Directorio)
    VALUE();
*/
/*
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE();
*/