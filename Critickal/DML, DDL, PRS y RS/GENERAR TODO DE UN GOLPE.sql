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
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("futbol","balon","LOGOS/futbol.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("futbol americano","balon","LOGOS/futbolamericano.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("basketball","balon","LOGOS/basketball.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("tenis individual","balon","LOGOS/tenisindividual.png","in");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("tenis en equipo","balon","LOGOS/tenisenequipo.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("formula 1","motor autos","LOGOS/formula1.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("motogp","motor motos","LOGOS/motogp.png","gr");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("wrc","motor autos rally","LOGOS/wrc.png","in");
INSERT INTO DEPORTES (Nombre, Categoria, Logo, Gori)
    VALUE("voleibol","balon","LOGOS/voleibol.png","gr");
/*--------------------------------------------------------------------------------------*/
INSERT INTO REGIONES (PaísNombre)
    VALUE("GLOBAL");
    
INSERT INTO REGIONES (PaísNombre)
    VALUE("Baréin");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Arabia Saudita");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Uruguay");

INSERT INTO REGIONES (PaísNombre)
    VALUE("Estados Unidos");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Alemania");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Italia");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Inglatera");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Austria");
INSERT INTO REGIONES (PaísNombre)
    VALUE("Serbia");
INSERT INTO REGIONES (PaísNombre)
    VALUE("España");
/*--------------------------------------------------------------------------------------*/
INSERT INTO SUSCRIPCIONES (Precio, Plazo, Descripcion)
    VALUE(0, 0, "Comun");
INSERT INTO SUSCRIPCIONES (Precio, Plazo, Descripcion)
    VALUE(0, 0, "ADMIN");
INSERT INTO SUSCRIPCIONES (Precio, Plazo, Descripcion)
    VALUE(10, 30, "Vip Cobre");
INSERT INTO SUSCRIPCIONES (Precio, Plazo, Descripcion)
    VALUE(100, 365, "Vip Plata");
INSERT INTO SUSCRIPCIONES (Precio, Plazo, Descripcion)
    VALUE(1000, 730, "Vip Oro");
/*--------------------------------------------------------------------------------------*/
INSERT INTO USUARIOS (Correo, Contraseña, Nombre, FTPerfil)
    VALUE("zg@zg.zg", "0", "Zgtale", "FT/zg@zg.zg");
INSERT INTO USUARIOS (Correo, Contraseña, Nombre, FTPerfil)
    VALUE("gmail@gmail.gmail", "0", "GMAIL", "FT/gmail@gmail.gmail");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE("Formula 1");
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE("Futbol");
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE("Basketball");
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE("Tenis");
INSERT INTO ETIQUETAS (Etiqueta)
    VALUE("CryptoBro");
/*--------------------------------------------------------------------------------------*/
INSERT INTO PUBLICIDADES (Directorio)
    VALUE("SPAM/1.png");
INSERT INTO PUBLICIDADES (Directorio)
    VALUE("SPAM/2.png");
INSERT INTO PUBLICIDADES (Directorio)
    VALUE("SPAM/3.png");
INSERT INTO PUBLICIDADES (Directorio)
    VALUE("SPAM/4.png");
INSERT INTO PUBLICIDADES (Directorio)
    VALUE("SPAM/5.png");
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Manama",2);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Riad",3);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Montevideo",4);

INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Washington DC",5);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Berlín",6);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Roma",7);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Londres",8);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Viena",9);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Belgrado",10);
INSERT INTO CIUDADES (Nombre, IDR_Regiones)
    VALUE("Madrid",11);


INSERT INTO CIUDADES (IDC,Nombre, IDR_Regiones)
    VALUE(1000,"GLOBAL",1);
INSERT INTO CIUDADES (IDC,Nombre, IDR_Regiones)
    VALUE(2000,"PAÍS",2);
INSERT INTO CIUDADES (IDC,Nombre, IDR_Regiones)
    VALUE(3000, "PAÍS",3);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(4000, "PAÍS",4);

INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(5000,"PAÍS",5);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(6000, "PAÍS",6);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(7000, "PAÍS",7);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(8000,"PAÍS",8);
INSERT INTO CIUDADES (IDC,Nombre, IDR_Regiones)
    VALUE(9000, "PAÍS",9);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(10000, "PAÍS",10);
INSERT INTO CIUDADES (IDC, Nombre, IDR_Regiones)
    VALUE(11000, "PAÍS",11);
/*--------------------------------------------------------------------------------------*/
INSERT INTO SUSCRITO_USER(IDU_Usuarios, Tipo_Suscripciones, suscrito) 
    VALUE(1, 3, "2022-11-9");
INSERT INTO SUSCRITO_USER(IDU_Usuarios, Tipo_Suscripciones, suscrito) 
    VALUE(2, 1, "2022-11-9");
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_SIGUE_USER (IDU_Seguidor_Usuarios, IDU_Seguido_Usuarios)
    VALUE(1, 2);
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE(1,"Formula 1");
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE(2,"Futbol");
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE(2,"Basketball");
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE(1,"Tenis");
INSERT INTO USER_SIGUE_ETIQUETA (IDU_Usuarios, Etiqueta_Etiquetas)
    VALUE(1,"CryptoBro");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE("Formula 1","SPAM/1.png");
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE("Futbol","SPAM/2.png");
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE("Basketball","SPAM/3.png");
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE("Tenis","SPAM/4.png");
INSERT INTO ETIQUETA_DE_PUBLICIDAD (Etiqueta_Etiquetas, Directorio_Publicidades)
    VALUE("CryptoBro","SPAM/5.png");
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Red Bull","LOGO/RedBull.png",9000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Mercedes","LOGO/Mercedes.png",7000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Ferrari","LOGO/Ferrari.png",6000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("McLaren","LOGO/McLaren.png",8000);

INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Los Angeles Lakers","LOGO/LosAngelesLakers.png",4000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Sacramento Kings","LOGO/SacramentoKings.png",4000);

INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Peñarol","LOGO/Peñarol.png",4000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("Nacional","LOGO/Nacional.png",4000);

INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("NovakDjokovic","LOGO/NovakDjokovic.png",10000);
INSERT INTO EQUIPOS (Nombre, Logo, IDC_Ciudades)
    VALUE("RafaelNadal","LOGO/RafaelNadal.png",11000);
/*--------------------------------------------------------------------------------------*/
INSERT INTO ESTADIOS (Nombre, IDC_Ciudades)
    VALUE("Bahrain International Circuit", 5);

INSERT INTO ESTADIOS (Nombre, IDC_Ciudades)
    VALUE("Crypto.com Arena", 4);

INSERT INTO ESTADIOS (Nombre, IDC_Ciudades)
    VALUE("Estadio Campeón del Siglo", 3);

INSERT INTO ESTADIOS (Nombre, IDC_Ciudades)
    VALUE("Estadio Cívitas Metropolitano", 10);
/*--------------------------------------------------------------------------------------*/
INSERT INTO TORENOS (Nombre, Año, IDC_Ciudades)
    VALUE("formula 1",2022, 1000);

INSERT INTO TORENOS (Nombre, Año, IDC_Ciudades)
    VALUE("NBA",2022, 5000);

INSERT INTO TORENOS (Nombre, Año, IDC_Ciudades)
    VALUE("Primera división de Uruguay",2022, 4000);

INSERT INTO TORENOS (Nombre, Año, IDC_Ciudades)
    VALUE("Grand Slam",2022, 1000);
/*--------------------------------------------------------------------------------------*/
/*LAKERS*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(1,"LeBron","James","1984-12-30",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(2,"Russell","Westbrook","1988-11-12",NULL);
/*3*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(3,"Anthony","Davis","1993-3-11",NULL);
/*4*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(4,"Lonnie","Walker IV","1998-12-14",NULL);
/*5*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(5,"Patrick","Beverley","1988-7-12",NULL);

/*SACRAMANTO KINGS*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(6,"Keegan","Murray","2000-6-19",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(7,"De'Aaron","Fox","1997-12-20",NULL);
/*3*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(8,"Domantas","Sabonis","1996-5-3",NULL);
/*4*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(9,"Kevin","Huerter","1998-6-27",NULL);
/*5*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(10,"Davion","Mitchell","1998-9-5",NULL);
/*--------------------------------------------------------------------------------------*/
/*Red Bull*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(11,"Max","Verstappen","1997-9-30",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(12,"Sergio","Pérez","1990-1-26",NULL);
/*Mercedes*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(13,"Lewis","Hamilton","1985-1-7",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(14,"George","Russell","1998-2-15",NULL);
/*Ferrari*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(15,"Charles","Leclerc","1997-10-16",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(16,"Carlos","Sainz Jr","1994-9-1",NULL);
/*McLaren*/
/*1*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(17,"Daniel","Ricciardo","1989-7-30",NULL);
/*2*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(18,"Lando","Norris","1999-11-13",NULL);
/*--------------------------------------------------------------------------------------*/
/*Nacional*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(19,"Luis","Suárez","1987-1-24",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(20,"Sergio","Rochet","1993-3-23",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(21,"Emmanuel","Gigliotti","1987-5-20",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(22,"Felipe","Carballo","1996-10-4",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(23,"Jonathan","Rodríguez","1993-7-6",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(24,"Diego","Zabala","1991-9-19",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(25,"Leandro","Lozano","1998-12-19",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(26,"Francisco","Ginella","1999-1-21",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(27,"Alex","Castro","1994-3-8",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(28,"Juan","Ramírez","1997-2-1",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(29,"Diego","Rodríguez","1989-9-4",NULL);
/*--------------------------------------------------------------------------------------*/
/*Peñarol*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(30,"Brian","Lozano","1994-2-23",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(31,"Billy","Arce","1998-7-12",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(32,"Brian","Mansilla","1997-4-16",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(33,"Rubén","Bentancourt","1993-3-2",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(34,"Kevin","Méndez","1996-1-10",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(35,"Walter","Gargano","1984-7-23",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(36,"Kevin","Dawson","1992-2-8",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(37,"Pedro","Milans","2002-3-24",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(38,"Thiago","Cardozo","1996-7-31",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(39,"Hernán","Rivero","1992-9-22",NULL);
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento, Fallecimiento)
    VALUE(40,"Nicolás","Milesi","1992-11-10",NULL);
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento)
    VALUE(41,"Novak","Djokovic","1987-5-22");

INSERT INTO JUGADORES (IDJ, FirstNombre, FirstApellido, Nacimiento)
    VALUE(42,"Rafael","Nadal","1986-6-3");
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(6,"Sacramento Kings", 13, true, true, "Ala-pívot", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(7,"Sacramento Kings", 10, true, true, "Pivot", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(8,"Sacramento Kings", 5, true, true, "Base", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(9,"Sacramento Kings", 9, true, true, "Escolta", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(10,"Sacramento Kings", 15, true, true, "Escolta", "basketball");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(1,"Los Angeles Lakers", 6, true, true, "Ala-pívot", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(2,"Los Angeles Lakers", 0, true, true, "Base", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(3,"Los Angeles Lakers", 3, true, true, "Pívot", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(4,"Los Angeles Lakers", 4, true, true, "Escolta", "basketball");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(5,"Los Angeles Lakers", 21, true, true, "Escolta", "basketball");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(15,"Ferrari", 16, true, true, "Piloto", "formula 1");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(16,"Ferrari", 55, true, true, "Piloto", "formula 1");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(17,"McLaren", 3, true, true, "Piloto", "formula 1");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(18,"McLaren", 4, true, true, "Piloto", "formula 1");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(13,"Mercedes", 44, true, true, "Piloto", "formula 1");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(14,"Mercedes", 63, true, true, "Piloto", "formula 1");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(11,"Red Bull", 1, true, true, "Piloto", "formula 1");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(12,"Red Bull", 11, true, true, "Piloto", "formula 1");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(19,"Nacional", 9, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(20,"Nacional", 1, true, true, "Arquero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(21,"Nacional", 8, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(22,"Nacional", 20, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(23,"Nacional", 5, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(24,"Nacional", 22, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(25,"Nacional", 16, true, true, "Defensa", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(26,"Nacional", 17, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(27,"Nacional", 23, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(28,"Nacional", 11, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(29,"Nacional", 15, true, true, "Centrocampista", "futbol");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(30,"Peñarol", 7, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(31,"Peñarol", 19, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(32,"Peñarol", 9, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(33,"Peñarol", 11, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(34,"Peñarol", 10, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(35,"Peñarol", 23, true, true, "Centrocampista", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(36,"Peñarol", 12, true, true, "Arquero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(37,"Peñarol", 27, true, true, "Defensa", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(38,"Peñarol", 1, true, true, "Arquero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(39,"Peñarol", 32, true, true, "Delantero", "futbol");
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(40,"Peñarol", 16, true, true, "Centrocampista", "futbol");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(41,"NovakDjokovic", NULL, true, true, "Jugador", "tenis individual");
/*--------------------------------------------------------------------------------------*/
INSERT INTO JUGADOR_EN_EQUIPO (IDJ_Jugadores, Nombre_Equipos, Numero, Activo, Titular, Rol, Nombre_Deportes)
    VALUE(42,"RafaelNadal", NULL, true, true, "Jugadors", "formula 1");
/*--------------------------------------------------------------------------------------*/
INSERT INTO PARTIDOS (Day, IDE_Estadios, IDT_Torenos)
    VALUE("2022-3-20", 1, 1);
    
INSERT INTO PARTIDOS (Day, IDE_Estadios, IDT_Torenos)
    VALUE("2022-11-12", 2, 2);

INSERT INTO PARTIDOS (Day, IDE_Estadios, IDT_Torenos)
    VALUE("2022-11-24", 3, 3);

INSERT INTO PARTIDOS (Day, IDE_Estadios, IDT_Torenos)
    VALUE("2022-11-30", 4, 4);
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(2,"Mercedes");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(1,"Mclaren");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(2,"Red Bull");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(1,"Los Angeles Lakers");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(1,"Peñarol");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(2,"RafaelNadal");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(1,"Ferrari");
INSERT INTO USER_SIGUE_EQUIPO (IDU_Usuarios, Nombre_Equipos)
    VALUE(2,"Sacramento Kings");
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(1,1);
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(1,2);
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(1,3);

INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(2,40);
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(2,35);
INSERT INTO USER_SIGUE_JUGADOR (IDU_Usuarios, IDJ_Jugadores)
    VALUE(2,26);
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(6,"Sacramento Kings", 2,"2022-11-12", "A-11");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(7,"Sacramento Kings", 2,"2022-11-12", "A-1");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(8,"Sacramento Kings", 2,"2022-11-12", "B-11");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(9,"Sacramento Kings", 2,"2022-11-12", "A-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(10,"Sacramento Kings", 2,"2022-11-12", "C-5");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(1,"Los Angeles Lakers", 2,"2022-11-12", "C-4");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(2,"Los Angeles Lakers", 2,"2022-11-12", "F-1");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(3,"Los Angeles Lakers", 2,"2022-11-12", "G-9");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(4,"Los Angeles Lakers", 2,"2022-11-12", "A-9");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(5,"Los Angeles Lakers", 2,"2022-11-12", "C-5");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(15,"Ferrari", 1,"2022-3-20", "1");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(16,"Ferrari", 1,"2022-3-20", "2");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(17,"McLaren", 1,"2022-3-20", "3");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(18,"McLaren", 1,"2022-3-20", "4");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(13,"Mercedes", 1,"2022-3-20", "5");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(14,"Mercedes", 1,"2022-3-20", "6");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(11,"Red Bull", 1,"2022-3-20", "7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(12,"Red Bull", 1,"2022-3-20", "8");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(19,"Nacional", 3,"2022-11-24", "A-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(20,"Nacional", 3,"2022-11-24", "B-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(21,"Nacional", 3,"2022-11-24", "D-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(22,"Nacional", 3,"2022-11-24", "F-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(23,"Nacional", 3,"2022-11-24", "A-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(24,"Nacional", 3,"2022-11-24", "G-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(25,"Nacional", 3,"2022-11-24", "E-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(26,"Nacional", 3,"2022-11-24", "C-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(27,"Nacional", 3,"2022-11-24", "A-11");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(28,"Nacional", 3,"2022-11-24", "A-10");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(29,"Nacional", 3,"2022-11-24", "A-7");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(30,"Peñarol", 3, "2022-11-24", "A-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(31,"Peñarol", 3, "2022-11-24", "B-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(32,"Peñarol", 3, "2022-11-24", "D-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(33,"Peñarol", 3, "2022-11-24", "F-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(34,"Peñarol", 3, "2022-11-24", "A-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(35,"Peñarol", 3, "2022-11-24", "G-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(36,"Peñarol", 3, "2022-11-24", "E-7");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(37,"Peñarol", 3, "2022-11-24", "C-8");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(38,"Peñarol", 3, "2022-11-24", "A-11");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(39,"Peñarol", 3, "2022-11-24", "A-10");
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(40,"Peñarol", 3, "2022-11-24", "A-7");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(41,"NovakDjokovic", 4, "2022-11-30", "NO");
/*--------------------------------------------------------------------------------------*/
INSERT INTO ALINEADOS_PARA (IDJ_JugadorEnEquipo, Nombre_JugadorEnEquipo, IDP_Partidos, Day_Partidos, Alineacion)
    VALUE(42,"RafaelNadal", 4, "2022-11-30", "NO");
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_SIGUE_PARTIDO (IDU_Usuarios, IDP_Partidos)
    VALUE(1, 1);
INSERT INTO USER_SIGUE_PARTIDO (IDU_Usuarios, IDP_Partidos)
    VALUE(1, 3);

INSERT INTO USER_SIGUE_PARTIDO (IDU_Usuarios, IDP_Partidos)
    VALUE(2, 2);
INSERT INTO USER_SIGUE_PARTIDO (IDU_Usuarios, IDP_Partidos)
    VALUE(2, 4);
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*Kings*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",6,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",7,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",8,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",9,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",10,"Sacramento Kings", 2);
/*Lakers*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",1,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",2,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",3,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",4,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","tiempo 1","2022-03-20 10:00:12",5,"Los Angeles Lakers", 2);
/*--------------------------------------------------------------------------------------*/
/*Kings*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",6,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",7,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",8,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Lesionado","tiempo 2","2022-03-20 11:41:12",9,"Sacramento Kings", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",10,"Sacramento Kings", 2);
/*Lakers*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",1,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Expulsado","tiempo 2","2022-03-20 11:50:12",2,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",3,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:40:12",4,"Los Angeles Lakers", 2);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","tiempo 4","2022-03-20 11:50:12",5,"Los Angeles Lakers", 2);
/*--------------------------------------------------------------------------------------*/
/*FERRARI*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",15,"Ferrari", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",16,"Ferrari", 1);
/*McLaren*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",17,"McLaren", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",18,"McLaren", 1);
/*Mercedes*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",13,"Mercedes", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",14,"Mercedes", 1);
/*Red Bull*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",11,"Red Bull", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Vuelta 0","2022-03-20 10:00:12",12,"Red Bull", 1);
/*--------------------------------------------------------------------------------------*/
/*FERRARI*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","Vuelta 74","2022-03-20 11:50:12",15,"Ferrari", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","Vuelta 74","2022-03-20 11:40:12",16,"Ferrari", 1);
/*McLaren*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","Vuelta 74","2022-03-20 11:30:12",17,"McLaren", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Final","Vuelta 74","2022-03-20 11:00:12",18,"McLaren", 1);
/*Mercedes*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Accidentado","Vuelta 4","2022-03-20 10:30:12",13,"Mercedes", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Accidentado","Vuelta 5","2022-03-20 10:30:12",14,"Mercedes", 1);
/*Red Bull*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Descalificado","Vuelta 70","2022-03-20 10:50:12",11,"Red Bull", 1);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Retirada","Vuelta 72","2022-03-20 10:55:12",12,"Red Bull", 1);
/*--------------------------------------------------------------------------------------*/
/*FERRARI*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",19,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",20,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",21,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",22,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",23,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",24,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",25,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",26,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",27,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",28,"Nacional", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",29,"Nacional", 3);
/*McLaren*/
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",30,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",31,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",32,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",33,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",34,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",35,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",36,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",37,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",38,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",39,"Peñarol", 3);
INSERT INTO SUCESOS (Nombre, Momento, Hora, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE("Inicio","Tiempo 0","2022-03-20 10:00:12",40,"Peñarol", 3);
/*--------------------------------------------------------------------------------------*/
INSERT INTO USER_ESPECULA_PARTIDO (IDU_Usuarios, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE(1,15,"Ferrari", 1);
INSERT INTO USER_ESPECULA_PARTIDO (IDU_Usuarios, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE(2,16,"Ferrari", 1);

INSERT INTO USER_ESPECULA_PARTIDO (IDU_Usuarios, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE(1,18,"McLaren", 1);
INSERT INTO USER_ESPECULA_PARTIDO (IDU_Usuarios, IDJ_AlineadosPara, Nombre_AlineadosPara, IDP_AlineadosPara)
    VALUE(2,18,"McLaren", 1);
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
INSERT INTO GOLPEADO_POR(IDS_Golpeado_Sucesos, IDS_Golpeador_Sucesos)
    VALUE(30,33);
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------*/