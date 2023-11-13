CREATE DATABASE CritickalSport;
use CritickalSport;

CREATE TABLE DEPORTES (
    Nombre varchar(18) NOT NULL PRIMARY KEY,
    Categoria varchar(40) NOT NULL,
    Logo varchar(30),
    Gori char(2) NOT NULL
);
CREATE TABLE JUGADORES (
    IDJ int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstNombre varchar(30) NOT NULL,
    FirstApellido varchar(45) NOT NULL,
    Nacimiento date NOT NULL,
    Fallecimiento date
);
CREATE TABLE REGIONES (
    IDR int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PaísNombre varchar(20) NOT NULL
);
CREATE TABLE CIUDADES (
    IDC int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(30) NOT NULL,
    IDR_Regiones int NOT NULL
);
CREATE TABLE EQUIPOS (
    Nombre varchar(40) NOT NULL PRIMARY KEY,
    Logo varchar(30) NOT NULL,
    IDC_Ciudades int NOT NULL
);
CREATE TABLE JUGADOR_EN_EQUIPO (
    IDJ_Jugadores int NOT NULL,
    Nombre_Equipos varchar(40) NOT NULL,
    Numero int,
    Activo boolean NOT NULL,
    Titular boolean NOT NULL,
    Rol varchar(15) NOT NULL,
    Nombre_Deportes varchar(18) NOT NULL
);
CREATE TABLE TORENOS (
    IDT int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(25) NOT NULL,
    Año year NOT NULL,
    IDC_Ciudades int NOT NULL
);
CREATE TABLE ESTADIOS (
    IDE int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(50) NOT NULL,
    IDC_Ciudades int NOT NULL
);
CREATE TABLE PARTIDOS (
    IDP int NOT NULL AUTO_INCREMENT,
    Day date NOT NULL,
    IDE_Estadios int NOT NULL,
    IDT_Torenos int NOT NULL,
    PRIMARY KEY (IDP, Day)
);
CREATE TABLE ALINEADOS_PARA (
    IDJ_JugadorEnEquipo int NOT NULL,
    Nombre_JugadorEnEquipo varchar(40) NOT NULL,
    IDP_Partidos int NOT NULL,
    Day_Partidos date NOT NULL,
    Alineacion varchar(35) NOT NULL
);
CREATE TABLE SUCESOS (
    IDS int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(60) NOT NULL,
    Momento varchar(20) NOT NULL,
    Hora dateTime NOT NULL,
    IDJ_AlineadosPara int NOT NULL,
    Nombre_AlineadosPara varchar(40) NOT NULL,
    IDP_AlineadosPara int NOT NULL
);
CREATE TABLE EVENTOS (
    IDS_Sucesos int NOT NULL PRIMARY KEY,
    Evento varchar(150) NOT NULL
);
CREATE TABLE PUNTOS (
    IDS_Sucesos int NOT NULL PRIMARY KEY,
    Puntos int NOT NULL
);
CREATE TABLE GOLPEADO_POR (
    IDS_Golpeado_Sucesos int NOT NULL,
    IDS_Golpeador_Sucesos int NOT NULL
);
CREATE TABLE SUSCRIPCIONES (
    Tipo int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Precio int NOT NULL,
    Plazo int NOT NULL,
    Descripcion varchar(250) NOT NULL
);
CREATE TABLE USUARIOS (
    IDU int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Correo varchar(50) NOT NULL,
    Contraseña char(32) NOT NULL,
    Nombre varchar(30) NOT NULL,
    FTPerfil varchar(30) NOT NULL
);
CREATE TABLE SUSCRITO_USER (
    IDU_Usuarios int NOT NULL PRIMARY KEY,
    Tipo_Suscripciones int NOT NULL,
    suscrito dateTime NOT NULL
);
CREATE TABLE USER_SIGUE_USER (
    IDU_Seguidor_Usuarios int NOT NULL,
    IDU_Seguido_Usuarios int NOT NULL
);
CREATE TABLE USER_SIGUE_PARTIDO (
    IDU_Usuarios int NOT NULL,
    IDP_Partidos int NOT NULL
);
CREATE TABLE USER_SIGUE_EQUIPO (
    IDU_Usuarios int NOT NULL,
    Nombre_Equipos varchar(40) NOT NULL
);
CREATE TABLE USER_SIGUE_JUGADOR (
    IDU_Usuarios int NOT NULL,
    IDJ_Jugadores int NOT NULL
);
CREATE TABLE USER_ESPECULA_PARTIDO (
    IDU_Usuarios int NOT NULL,
    IDJ_AlineadosPara int NOT NULL,
    Nombre_AlineadosPara varchar(40) NOT NULL,
    IDP_AlineadosPara int NOT NULL
);
CREATE TABLE ETIQUETAS (
    Etiqueta varchar(12) NOT NULL PRIMARY KEY
);
CREATE TABLE USER_SIGUE_ETIQUETA (
    IDU_Usuarios int NOT NULL,
    Etiqueta_Etiquetas varchar(12) NOT NULL
);
CREATE TABLE PUBLICIDADES (
    Directorio varchar(40) NOT NULL PRIMARY KEY
);

CREATE TABLE ETIQUETA_DE_PUBLICIDAD (
    Etiqueta_Etiquetas varchar(12) NOT NULL,
    Directorio_Publicidades varchar(40) NOT NULL
);


ALTER TABLE JUGADOR_EN_EQUIPO
    ADD PRIMARY KEY(IDJ_Jugadores, Nombre_Equipos);
ALTER TABLE ALINEADOS_PARA
    ADD PRIMARY KEY(IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos);
ALTER TABLE GOLPEADO_POR
    ADD PRIMARY KEY(IDS_Golpeado_Sucesos,IDS_Golpeador_Sucesos);
ALTER TABLE USER_SIGUE_USER
    ADD PRIMARY KEY(IDU_Seguidor_Usuarios, IDU_Seguido_Usuarios);
ALTER TABLE USER_SIGUE_PARTIDO
    ADD PRIMARY KEY(IDU_Usuarios, IDP_Partidos);
ALTER TABLE USER_SIGUE_EQUIPO
    ADD PRIMARY KEY(IDU_Usuarios, Nombre_Equipos);
ALTER TABLE USER_SIGUE_JUGADOR
    ADD PRIMARY KEY(IDU_Usuarios, IDJ_Jugadores);
ALTER TABLE USER_ESPECULA_PARTIDO
    ADD PRIMARY KEY(IDU_Usuarios, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara);
ALTER TABLE USER_SIGUE_ETIQUETA
    ADD PRIMARY KEY(IDU_Usuarios, Etiqueta_Etiquetas);
ALTER TABLE ETIQUETA_DE_PUBLICIDAD
    ADD PRIMARY KEY(Etiqueta_Etiquetas, Directorio_Publicidades);

ALTER TABLE CIUDADES
    ADD CONSTRAINT FK_IDR_Regiones_Ciudades
        FOREIGN KEY (IDR_Regiones) REFERENCES Regiones (IDR); 
ALTER TABLE EQUIPOS
    ADD CONSTRAINT FK_IDC_Ciudades_Equipos
        FOREIGN KEY (IDC_Ciudades) REFERENCES Ciudades (IDC); 
ALTER TABLE JUGADOR_EN_EQUIPO
    ADD CONSTRAINT FK_IDJ_Jugadores_Equipos
        FOREIGN KEY (IDJ_Jugadores) REFERENCES Jugadores (IDJ),
    ADD CONSTRAINT FK_Nombre_Equipos_Equipos
        FOREIGN KEY (Nombre_Equipos) REFERENCES Equipos (Nombre),
    ADD CONSTRAINT FK_Nombre_Deportes_Equipos
        FOREIGN KEY (Nombre_Deportes) REFERENCES Deportes (Nombre);  
ALTER TABLE TORENOS
    ADD CONSTRAINT FK_IDC_Ciudades_Torenos
        FOREIGN KEY (IDC_Ciudades) REFERENCES Ciudades (IDC); 
ALTER TABLE ESTADIOS
    ADD CONSTRAINT FK_IDC_Ciudades_Estadios
        FOREIGN KEY (IDC_Ciudades) REFERENCES Ciudades (IDC);
ALTER TABLE PARTIDOS
    ADD CONSTRAINT FK_IDE_Estadios_Partidos
        FOREIGN KEY (IDE_Estadios) REFERENCES Estadios (IDE), 
    ADD CONSTRAINT FK_IDT_Torenos_Partidos
        FOREIGN KEY (IDT_Torenos) REFERENCES Torenos (IDT),
    ADD INDEX(Day);

ALTER TABLE ALINEADOS_PARA 
    ADD CONSTRAINT FK_IDJ_JugadorEnEquipo_AlineadosPara
        FOREIGN KEY (IDJ_JugadorEnEquipo) REFERENCES Jugador_En_Equipo (IDJ_Jugadores),
    ADD CONSTRAINT FK_Nombre_JugadorEnEquipo_AlineadosPara
        FOREIGN KEY (Nombre_JugadorEnEquipo) REFERENCES Jugador_En_Equipo (Nombre_Equipos),
    ADD CONSTRAINT FK_IDP_Partidos_AlineadosPara
        FOREIGN KEY (IDP_Partidos) REFERENCES Partidos (IDP),
    ADD CONSTRAINT FK_Day_Partidos_AlineadosPara
        FOREIGN KEY (Day_Partidos) REFERENCES Partidos (Day);


ALTER TABLE SUCESOS
    ADD CONSTRAINT FK_IDJ_AlineadosPara_Sucesos
        FOREIGN KEY (IDJ_AlineadosPara) REFERENCES Alineados_Para (IDJ_JugadorEnEquipo),
    ADD CONSTRAINT FK_Nombre_AlineadosPara_Sucesos
        FOREIGN KEY (Nombre_AlineadosPara) REFERENCES Alineados_Para (Nombre_JugadorEnEquipo),
    ADD CONSTRAINT FK_IDP_AlineadosPara_Sucesos
        FOREIGN KEY (IDP_AlineadosPara) REFERENCES Alineados_Para (IDP_Partidos); 
ALTER TABLE EVENTOS
    ADD CONSTRAINT FK_IDS_Sucesos_Eventos
        FOREIGN KEY (IDS_Sucesos) REFERENCES Sucesos (IDS); 
ALTER TABLE PUNTOS
    ADD CONSTRAINT FK_IDS_Sucesos_Puntos
        FOREIGN KEY (IDS_Sucesos) REFERENCES Sucesos (IDS);
ALTER TABLE GOLPEADO_POR
    ADD CONSTRAINT FK_IDS_Golpeado_Sucesos_Puntos
        FOREIGN KEY (IDS_Golpeado_Sucesos) REFERENCES Sucesos (IDS),
    ADD CONSTRAINT FK_IDS_Golpeador_Sucesos_Puntos
        FOREIGN KEY (IDS_Golpeador_Sucesos) REFERENCES Sucesos (IDS);
 
ALTER TABLE SUSCRITO_USER
    ADD CONSTRAINT FK_IDU_Usuarios_SuscritoUser
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_Tipo_Suscripciones_SuscritoUser
        FOREIGN KEY (Tipo_Suscripciones) REFERENCES Suscripciones (Tipo); 
ALTER TABLE USER_SIGUE_USER
    ADD CONSTRAINT FK_IDU_SeguidorUsuarios_UserSeguirUser
        FOREIGN KEY (IDU_Seguidor_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_IDU_SeguidoUsuarios_UserSeguirUser
        FOREIGN KEY (IDU_Seguido_Usuarios) REFERENCES Usuarios (IDU); 
ALTER TABLE USER_SIGUE_PARTIDO
    ADD CONSTRAINT FK_IDU_Usuarios_UserSiguePartido
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_IDP_Partidos_UserSiguePartido
        FOREIGN KEY (IDP_Partidos) REFERENCES Partidos (IDP); 
ALTER TABLE USER_SIGUE_EQUIPO
    ADD CONSTRAINT FK_IDU_Usuarios_UserSigueEquipo
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_Nombre_Equipos_UserSigueEquipo
        FOREIGN KEY (Nombre_Equipos) REFERENCES Equipos (Nombre); 
ALTER TABLE USER_SIGUE_JUGADOR
    ADD CONSTRAINT FK_IDU_Usuarios_UserSeguirJugador
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU); 
ALTER TABLE USER_ESPECULA_PARTIDO
    ADD CONSTRAINT FK_IDU_Usuarios_UserEspeculaPartido
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_IDJ_AlineadosPara_UserEspeculaPartido
        FOREIGN KEY (IDJ_AlineadosPara) REFERENCES Alineados_Para (IDJ_JugadorEnEquipo),
    ADD CONSTRAINT FK_Nombre_AlineadosPara_UserEspeculaPartido
        FOREIGN KEY (Nombre_AlineadosPara) REFERENCES Alineados_Para (Nombre_JugadorEnEquipo),
    ADD CONSTRAINT FK_IDP_AlineadosPara_UserEspeculaPartido
        FOREIGN KEY (IDP_AlineadosPara) REFERENCES Alineados_Para (IDP_Partidos); 
ALTER TABLE USER_SIGUE_ETIQUETA
    ADD CONSTRAINT FK_IDU_Usuarios_UserSigueEtiqueta
        FOREIGN KEY (IDU_Usuarios) REFERENCES Usuarios (IDU),
    ADD CONSTRAINT FK_Etiqueta_Etiquetas_UserSigueEtiqueta
        FOREIGN KEY (Etiqueta_Etiquetas) REFERENCES Etiquetas (Etiqueta); 
ALTER TABLE ETIQUETA_DE_PUBLICIDAD
    ADD CONSTRAINT FK_Etiqueta_Etiquetas_EtiquetaDePublicidad
        FOREIGN KEY (Etiqueta_Etiquetas) REFERENCES Etiquetas (Etiqueta), 
    ADD CONSTRAINT FK_Directorio_Publicidades_EtiquetaDePublicidad
        FOREIGN KEY (Directorio_Publicidades) REFERENCES Publicidades (Directorio);