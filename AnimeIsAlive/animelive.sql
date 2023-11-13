-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2023 a las 21:40:04
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `animelive`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `setURL` (IN `nombre` VARCHAR(100))   BEGIN
	INSERT INTO portadas VALUES
    (
    	nombre,
    	"https://raw.githubusercontent.com/CritickalGames/img/main/",
        nombre,
        ".jpg"
    );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animes`
--

CREATE TABLE `animes` (
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `animes`
--

INSERT INTO `animes` (`nombre`) VALUES
('3D Kanojo: Real Girl'),
('Aharen san'),
('Akame ga kill'),
('Akudama Drive'),
('Akuyaku Reijou nanode Last Boss wo Kattemimashita'),
('Amagi Brilliant Park Special'),
('Amphibian'),
('Another'),
('Ao No Exorcist'),
('Arte'),
('Bagel girl'),
('Beastar'),
('Big Hero Six'),
('Blends S'),
('Blood Lad'),
('Boku Dake Ga Inai Machi'),
('Boku No Hero Academia '),
('Boku no Kanojo ga Majimesugiru Sho-bitch na Ken'),
('Bokutachi no Remake'),
('Bokutachi wa Benkyou ga Dekinai'),
('Busou Shoujo Machiavellianism'),
('Chainsaw Man'),
('Charlotte'),
('Chuunibyou demo Koi ga Shitai!'),
('Classroom Of The Elite'),
('Code Geass'),
('Como entrenar a tu dragon'),
('Cortar por la línea de puntos'),
('Danmachi'),
('Danny Phantom'),
('Date A Live'),
('Death March kara Hajimaru Isekai Kyousoukyoku'),
('Death Parade'),
('Deatte 5-byou de Battle'),
('Demi chan wa kataritai'),
('Detective Conan'),
('Devils Line'),
('DNAngel'),
('Domesitc na Kanojo'),
('Dr stone'),
('Eighty Six-86'),
('El Mundo de Narue'),
('El Zorro: Serie Animada'),
('Encanto'),
('Eromanga sensei'),
('Eyeshield 21'),
('Fantasy Bishoujo Juniku Ojisan To'),
('Final Approach'),
('Fire Force'),
('Full metal Archemis brother Hood'),
('Fuuto Tantei'),
('Gaikotsu Kishi-sama, Tadaima Isekai e Odekakechuu'),
('Gamers!'),
('Gate: Jieitai Kanochi nite, Kaku Tatakaeri'),
('Gekkan shoujo nozaki kun'),
('Generador Rex'),
('Genjitsu Shugi Yuusha no Oukoku Saikenki'),
('Girl Bravo'),
('Gleipnir'),
('Glitch Techs'),
('Goblin Slayer'),
('Godzilla Punto Singular'),
('Gotoubun no hanayame'),
('Gundam 79'),
('Hai to Gensou no Grimgar'),
('Hajimete no Gal'),
('Hataraku Maou-sama!'),
('Hayikyuu'),
('Hentai Ouji to Warawanai Neko'),
('Hige wo Soru. Soshite Joshikousei wo Hirou'),
('Hitoribocchi no Seikatsu'),
('Honzuki no gekokujou'),
('Hora de aventura'),
('Horimiya'),
('I\'m standing on 100.000.000 lifes'),
('Ijiranaide, Nagatoro-san'),
('Ijou Seibutsu jenbunroku'),
('Initial D'),
('Invincible'),
('Iron Man Aventuras de Hierro'),
('Isekai Maou to Shoukan Shoujo no Dorei Majutsu'),
('Isekai wa smartphone'),
('Jaku-Chara Tomozaki-kun'),
('Jibaku Shounen Hanako-kun'),
('Jitsu Wa Watashi Wa'),
('Jujutsu Kaisen'),
('Kaguya-sama Love is war'),
('Kaifuku Jutsushi no Yarinaoshi'),
('Kamen Rider Agito'),
('Kamen Rider Kuuga'),
('Kanojo mo Kanojo'),
('Kanojo, Okarishimasu'),
('Kawaikereba hentai demo suki ni natte kuremasu ka?'),
('Kenishi el disipulo más fuerte'),
('Kenja no Mago'),
('Kobayashi-san Chi no Maid Dragon'),
('Komi-san wa, Komyushō Desu'),
('kono subarashii sekai ni shukufuku wo'),
('Kono Yo no Hate de Koi wo Utau Shoujo YU-NO'),
('Kotoura-San'),
('Koutetsujou no Kabaneri'),
('Kumo Desu ga, Nani ka?'),
('Kyuukyoku Shinka shita Full Dive RPG ga Genjitsu yori mo Kusoge Dattara'),
('Las Aventuras de Saint Tail'),
('Let\'s Play Phoenix Wright Justis For All'),
('Link Click'),
('Los últimos frikis del mundo'),
('Magic kaito 1412'),
('Magikano'),
('Mahoutsukai Reimeiki'),
('Maken-Ki! Two'),
('Masamue kun\'s revege'),
('Masamune-Kun No Revenge'),
('Masamune-Kun No Revenge OVA'),
('Mashita iruma kun'),
('Meteoro: La Nueva Generación'),
('Mieru ko-chan'),
('Mob psycho 100'),
('Moyashimon'),
('Muremasen Seton Gakuen'),
('Mushoku Tensei: Isekai Ittara Honki Dasu'),
('Nande koko ni Sensei ga!?'),
('Nisekoi'),
('Noragami'),
('Okusama ga Seitokaichou!'),
('One Piece'),
('Onyx Equinox'),
('Ore No Imouto Ga Konnani Kawaii Wake Ga Nai'),
('Ore No Kanojo To Osananajimi Ga Shuraba Sugiru'),
('Osananajimi ga Zettai ni Makenai Love Comedy'),
('Oshiete galko-chan'),
('Otome Game no Hametsu Flag shika Nai Akuyaku Reijou ni'),
('Otome Game Sekai wa Mob ni Kibishii Sekai desu'),
('Overlord'),
('Owari no seraph'),
('Power Rangers SPD'),
('Punch Line'),
('Randy Cunningham: Ninja Total'),
('Re:Zero kara Hajimeru Isekai Seikatsu'),
('ReLife'),
('ReLIFE: Kanketsu-Hen'),
('Renai Boukun'),
('Rokka no Yuusha'),
('Rokudenashi majutsu koushi to akashic records'),
('RPG Fudousan'),
('Ryuuou no oshigoto!'),
('Saenai Heroine No Sodatekata'),
('Sakurasou no Pet na Kanojo'),
('Scissor Seven'),
('Seirei Gensouki'),
('Seishun Buta Yarou wa Bunny Girl Senpai no Yume wo Minai'),
('Seishun Buta Yarou wa Yumemiru Shoujo no Yume wo Minai'),
('Sekai Saikou no Ansatsusha, Isekai Kizoku ni Tensei sur'),
('Sentouin, Hakenshimasu!'),
('She-ra y las princesas del poder'),
('Shijou Saikyou no Daimaou, Murabito A ni Tensei suru'),
('Shimoneta'),
('Shinchou Yuusha: Kono Yuusha ga Ore Tueee Kuse ni Shinchou Sugiru'),
('Shinka no Mi: Shiranai Uchi ni Kachigumi Jinsei'),
('Shuumatsu No Harem'),
('Shuumatsu no Izetta'),
('Sono bisque doll wa koi suru'),
('Sounan Desu ka?'),
('Strike the Blood'),
('Taimadou Gakuen 35 Shiken Shoutai'),
('Takt Op Destiny'),
('Tantei wa Mou, Shindeiru'),
('Tate no yuusha'),
('Tears to Tiara'),
('Tensei shitara Ken deshita'),
('Tensei shitara Slime Datta Ken'),
('The owl house'),
('Thundercats 2011'),
('Tokyo Revengers'),
('Tondemo Skill de Isekai Hourou Meshi Episodio'),
('Tonikaku kawaii'),
('Tsugumomo'),
('Tsuki ga Michibiku Isekai Douchuu'),
('Umineko No Naku Koro Ni'),
('Uzaki san Asobitai'),
('Uzaki-Chan Wa Asobitai'),
('Watashi Ga Motete Dousunda'),
('Watashi, Nouryoku wa Heikinchi de tte Itta yo ne!'),
('Witch Craft Works'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Kan'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Zoku'),
('Yamada-kun y las siete brujas'),
('Yatogame-chan Kansatsu Nikki'),
('Yofukashi no uta'),
('Youjo senki'),
('Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e'),
('Yozakura Family'),
('Yozakura Quartet: Hoshi No Umi');

--
-- Disparadores `animes`
--
DELIMITER $$
CREATE TRIGGER `setURL` AFTER INSERT ON `animes` FOR EACH ROW BEGIN
	CALL setURL(new.nombre);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cantidadanimestoportadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cantidadanimestoportadas` (
`COUNT(animes.nombre)` bigint(21)
,`COUNT(portadas.nombre)` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `telefono` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `fechanach` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `nombre` varchar(100) NOT NULL,
  `temporada` int(11) NOT NULL,
  `capitulo` int(11) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`nombre`, `temporada`, `capitulo`, `estado`) VALUES
('3D Kanojo: Real Girl', 1, 24, 'visto'),
('Aharen san', 1, 12, 'visto'),
('Akame ga kill', 1, 24, 'visto'),
('Akudama Drive', 1, 12, 'visto'),
('Akuyaku Reijou nanode Last Boss wo Kattemimashita', 1, 12, 'visto'),
('Amagi Brilliant Park Special', 1, 0, 'ver'),
('Amphibian', 1, 20, 'visto'),
('Amphibian', 2, 20, 'visto'),
('Amphibian', 3, 18, 'visto'),
('Another', 1, 12, 'visto'),
('Ao No Exorcist', 1, 27, 'visto'),
('Arte', 1, 1, 'viendo'),
('Bagel girl', 1, 15, 'visto'),
('Blood Lad', 1, 11, 'visto'),
('Boku No Hero Academia ', 6, 25, 'visto'),
('Boku no Kanojo ga Majimesugiru Sho-bitch na Ken', 1, 10, 'visto'),
('Chainsaw Man', 1, 12, 'visto'),
('Classroom Of The Elite', 1, 12, 'visto'),
('Classroom Of The Elite', 2, 13, 'visto'),
('Code Geass', 1, 25, 'visto'),
('Cortar por la línea de puntos', 1, 6, 'visto'),
('Death Parade', 1, 12, 'visto'),
('El Mundo de Narue', 1, 0, 'ver'),
('El Zorro: Serie Animada', 1, 13, 'visto'),
('El Zorro: Serie Animada', 2, 13, 'visto'),
('Eyeshield 21', 1, 0, 'ver'),
('Final Approach', 1, 0, 'ver'),
('Full metal Archemis brother Hood', 1, 1, 'viendo'),
('Fuuto Tantei', 1, 9, 'viendo'),
('Girl Bravo', 1, 0, 'ver'),
('Glitch Techs', 1, 0, 'ver'),
('Goblin Slayer', 1, 12, 'visto'),
('Horimiya', 1, 13, 'viendo'),
('Ijou Seibutsu jenbunroku', 1, 0, 'ver'),
('Iron Man Aventuras de Hierro', 1, 26, 'visto'),
('Iron Man Aventuras de Hierro', 2, 26, 'visto'),
('Jibaku Shounen Hanako-kun', 1, 1, 'viendo'),
('Jitsu Wa Watashi Wa', 1, 13, 'visto'),
('Jujutsu Kaisen', 1, 24, 'visto'),
('Kaifuku Jutsushi no Yarinaoshi', 1, 1, 'viendo'),
('Kamen Rider Agito', 1, 3, 'viendo'),
('Kamen Rider Kuuga', 1, 32, 'viendo'),
('Kenja no Mago', 1, 1, 'viendo'),
('Kotoura-San', 1, 0, 'ver'),
('Koutetsujou no Kabaneri', 1, 0, 'ver'),
('Kyuukyoku Shinka shita Full Dive RPG ga Genjitsu yori mo Kusoge Dattara', 1, 12, 'visto'),
('Link Click', 1, 2, 'viendo'),
('Magikano', 1, 0, 'ver'),
('Masamue kun\'s revege', 1, 0, 'ver'),
('Masamune-Kun No Revenge', 1, 13, 'ver'),
('Masamune-Kun No Revenge OVA', 1, 1, 'visto'),
('Meteoro: La Nueva Generación', 1, 26, 'visto'),
('Meteoro: La Nueva Generación', 2, 26, 'visto'),
('Nande koko ni Sensei ga!?', 1, 0, 'ver'),
('Nisekoi', 1, 0, 'ver'),
('Noragami', 1, 0, 'ver'),
('One Piece', 1, 244, 'viendo'),
('Ore No Imouto Ga Konnani Kawaii Wake Ga Nai', 1, 0, 'ver'),
('Ore No Kanojo To Osananajimi Ga Shuraba Sugiru', 1, 13, 'visto'),
('Otome Game Sekai wa Mob ni Kibishii Sekai desu', 1, 5, 'viendo'),
('Overlord', 4, 13, 'visto'),
('Power Rangers SPD', 1, 38, 'visto'),
('ReLife', 1, 13, 'visto'),
('ReLIFE: Kanketsu-Hen', 1, 4, 'visto'),
('Renai Boukun', 1, 0, 'ver'),
('Shuumatsu No Harem', 1, 1, 'viendo'),
('Takt Op Destiny', 1, 12, 'visto'),
('Tate no yuusha', 2, 13, 'visto'),
('Tensei shitara Slime Datta Ken', 1, 14, 'viendo'),
('Tondemo Skill de Isekai Hourou Meshi Episodio', 1, 12, 'visto'),
('Tonikaku kawaii', 1, 0, 'ver'),
('Tsugumomo', 1, 12, 'visto'),
('Uzaki san Asobitai', 2, 13, 'viendo'),
('Uzaki-Chan Wa Asobitai', 1, 12, 'visto'),
('Uzaki-Chan Wa Asobitai', 2, 13, 'visto'),
('Watashi, Nouryoku wa Heikinchi de tte Itta yo ne!', 1, 0, 'ver'),
('Witch Craft Works', 1, 12, 'visto'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru', 1, 13, 'visto'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Kan', 1, 12, 'visto'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Zoku', 1, 13, 'visto'),
('Yatogame-chan Kansatsu Nikki', 1, 0, 'ver');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `nombressinurl`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `nombressinurl` (
`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portadas`
--

CREATE TABLE `portadas` (
  `nombre` varchar(100) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `formato` set('','.jpg','.jpeg','.png') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `portadas`
--

INSERT INTO `portadas` (`nombre`, `url`, `archivo`, `formato`) VALUES
('3D Kanojo: Real Girl', 'https://raw.githubusercontent.com/CritickalGames/img/main/', '3D Kanojo: Real Girl', '.jpg'),
('Aharen san', 'https://somoskudasai.com/wp-content/uploads/2022/01/', 'aharensan_KV2', '.jpg'),
('Akame ga kill', 'https://picfiles.alphacoders.com/228/', 'thumb-228833', '.jpg'),
('Akudama Drive', 'https://upload.wikimedia.org/wikipedia/en/3/36/', 'Akudama_Drive', '.jpg'),
('Akuyaku Reijou nanode Last Boss wo Kattemimashita', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Akuyaku Reijou nanode Last Boss wo Kattemimashita', '.jpg'),
('Amagi Brilliant Park Special', 'https://i.pinimg.com/564x/a1/23/37/', 'a12337174216cf310ec04bee99338534', '.jpg'),
('Amphibian', 'https://upload.wikimedia.org/wikipedia/en/1/17/', 'Amphibia_Season_1_Poster', '.jpg'),
('Another', 'https://cdn.myanimelist.net/images/anime/4/', '75509l', '.jpg'),
('Ao No Exorcist', 'https://cdn.myanimelist.net/images/anime/10/', '75195l', '.jpg'),
('Arte', 'https://cdn.myanimelist.net/images/anime/1284/', '106945l', '.jpg'),
('Bagel girl', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Bagel girl', '.jpg'),
('Beastar', 'https://cdn.myanimelist.net/images/anime/1234/', '102008l', '.jpg'),
('Big Hero Six', 'https://www.ecartelera.com/carteles/1800/1834/', '004', '.jpg'),
('Blends S', 'https://cdn.myanimelist.net/images/anime/6/', '88286l', '.jpg'),
('Blood Lad', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Blood Lad', '.jpg'),
('Boku Dake Ga Inai Machi', 'https://cdn.myanimelist.net/images/anime/10/', '77957l', '.jpg'),
('Boku No Hero Academia ', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Boku No Hero Academia ', '.jpg'),
('Boku no Kanojo ga Majimesugiru Sho-bitch na Ken', 'https://cdn.myanimelist.net/images/anime/12/', '87623l', '.jpg'),
('Bokutachi no Remake', 'https://cdn.myanimelist.net/images/anime/1871/', '118309l', '.jpg'),
('Bokutachi wa Benkyou ga Dekinai', 'https://cdn.myanimelist.net/images/anime/1602/', '100510l', '.jpg'),
('Busou Shoujo Machiavellianism', 'https://cdn.myanimelist.net/images/anime/3/', '83995l', '.jpg'),
('Chainsaw Man', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Chainsaw Man', '.jpg'),
('Charlotte', 'https://cdn.myanimelist.net/images/anime/12/', '74683l', '.jpg'),
('Chuunibyou demo Koi ga Shitai!', 'https://cdn.myanimelist.net/images/anime/12/', '46931l', '.jpg'),
('Classroom Of The Elite', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Classroom Of The Elite', '.jpg'),
('Code Geass', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Code Geass', '.jpg'),
('Como entrenar a tu dragon', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/', 'n12wESAYZNqa88h4EzdD25bJRYR', '.jpg'),
('Cortar por la línea de puntos', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Cortar por la línea de puntos', '.jpg'),
('Danmachi', 'https://cdn.myanimelist.net/images/anime/2/', '70187l', '.jpg'),
('Danny Phantom', 'https://resizing.flixster.com/hM9OkWSZk6fLt9UjNraSbIsnakI=/206x305/v2/https://flxt.tmsimg.com/assets/', 'p186112_b_v8_aa', '.jpg'),
('Date A Live', 'https://cdn.myanimelist.net/images/anime/13/', '44844l', '.jpg'),
('Death March kara Hajimaru Isekai Kyousoukyoku', 'https://cdn.myanimelist.net/images/anime/4/', '88911l', '.jpg'),
('Death Parade', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Death Parade', '.jpg'),
('Deatte 5-byou de Battle', 'https://cdn.myanimelist.net/images/anime/1145/', '115565l', '.jpg'),
('Demi chan wa kataritai', 'https://cdn.myanimelist.net/images/anime/2/', '81919l', '.jpg'),
('Detective Conan', 'https://cdn.myanimelist.net/images/anime/6/', '14092l', '.jpg'),
('Devils Line', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Devils Line', '.jpg'),
('DNAngel', 'https://cdn.myanimelist.net/images/anime/1126/', '98904l', '.jpg'),
('Domesitc na Kanojo', 'https://cdn.myanimelist.net/images/anime/1021/', '95670l', '.jpg'),
('Dr stone', 'https://cdn.myanimelist.net/images/anime/1758/', '97736l', '.jpg'),
('Eighty Six-86', 'https://cdn.myanimelist.net/images/anime/1987/', '117507l', '.jpg'),
('El Mundo de Narue', 'https://www.lavanguardia.com/peliculas-series/images/serie/poster/2003/4/w780/', '3FG1pj4dg8SkC99EtpnUUPVtJV2', '.jpg'),
('El Zorro: Serie Animada', 'https://www.lavanguardia.com/peliculas-series/images/serie/poster/1997/9/w780/', 'dlvNNxM6T72YIjig4Hrm6kosS65', '.jpg'),
('Encanto', 'https://lumiere-a.akamaihd.net/v1/images/', 'encanto_ka_las_pay1_92ad7410', '.jpeg'),
('Eromanga sensei', 'https://cdn.myanimelist.net/images/anime/2/', '86468l', '.jpg'),
('Eyeshield 21', 'https://cdn.myanimelist.net/images/anime/2/', '24791l', '.jpg'),
('Fantasy Bishoujo Juniku Ojisan To', 'https://cdn.myanimelist.net/images/anime/1430/', '120065l', '.jpg'),
('Final Approach', 'https://cdn.myanimelist.net/images/anime/11/', '14607l', '.jpg'),
('Fire Force', 'https://cdn.myanimelist.net/images/anime/1578/', '96239l', '.jpg'),
('Full metal Archemis brother Hood', 'https://cdn.myanimelist.net/images/anime/1208/', '94745l', '.jpg'),
('Fuuto Tantei', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Fuuto Tantei', '.jpg'),
('Gaikotsu Kishi-sama, Tadaima Isekai e Odekakechuu', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Gaikotsu Kishi-sama, Tadaima Isekai e Odekakechuu', '.jpg'),
('Gamers!', 'https://cdn.myanimelist.net/images/anime/4/', '86828l', '.jpg'),
('Gate: Jieitai Kanochi nite, Kaku Tatakaeri', 'https://cdn.myanimelist.net/images/anime/2/', '81321l', '.jpg'),
('Gekkan shoujo nozaki kun', 'https://cdn.myanimelist.net/images/anime/5/', '66083l', '.jpg'),
('Generador Rex', 'https://m.media-amazon.com/images/M/', 'MV5BYWJmZTExZWItOWFkZS00ZjY4LWFhOGItNTBjMjQ2MDdkNTkyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_', '.jpg'),
('Genjitsu Shugi Yuusha no Oukoku Saikenki', 'https://cdn.myanimelist.net/images/anime/1297/', '118764l', '.jpg'),
('Girl Bravo', 'https://cdn.myanimelist.net/images/anime/12/', '48027l', '.jpg'),
('Gleipnir', 'https://cdn.myanimelist.net/images/anime/1808/', '111697l', '.jpg'),
('Glitch Techs', 'https://upload.wikimedia.org/wikipedia/en/4/47/', 'Glitch_Techs', '.png'),
('Goblin Slayer', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Goblin Slayer', '.jpg'),
('Godzilla Punto Singular', 'https://cdn.myanimelist.net/images/anime/1017/', '109966l', '.jpg'),
('Gotoubun no hanayame', 'https://cdn.myanimelist.net/images/anime/1075/', '122031l', '.jpg'),
('Gundam 79', 'https://cdn.myanimelist.net/images/anime/1915/', '128896l', '.jpg'),
('Hai to Gensou no Grimgar', 'https://cdn.myanimelist.net/images/anime/13/', '77976l', '.jpg'),
('Hajimete no Gal', 'https://cdn.myanimelist.net/images/anime/9/', '86826l', '.jpg'),
('Hataraku Maou-sama!', 'https://cdn.myanimelist.net/images/anime/4/', '42855l', '.jpg'),
('Hayikyuu', 'https://cdn.myanimelist.net/images/anime/7/', '76014l', '.jpg'),
('Hentai Ouji to Warawanai Neko', 'https://cdn.myanimelist.net/images/anime/3/', '75788l', '.jpg'),
('Hige wo Soru. Soshite Joshikousei wo Hirou', 'https://cdn.myanimelist.net/images/anime/1353/', '111794l', '.jpg'),
('Hitoribocchi no Seikatsu', 'https://cdn.myanimelist.net/images/manga/3/', '173131l', '.jpg'),
('Honzuki no gekokujou', 'https://cdn.myanimelist.net/images/anime/1582/', '101697l', '.jpg'),
('Hora de aventura', 'https://www.jotdown.es/wp-content/uploads/2013/06/', 'adventuretime', '.jpg'),
('Horimiya', 'https://cdn.myanimelist.net/images/anime/1268/', '109252l', '.jpg'),
('I\'m standing on 100.000.000 lifes', 'https://cdn.myanimelist.net/images/anime/1506/', '117717l', '.jpg'),
('Ijiranaide, Nagatoro-san', 'https://cdn.myanimelist.net/images/anime/1900/', '110097l', '.jpg'),
('Ijou Seibutsu jenbunroku', 'https://cdn.myanimelist.net/images/anime/1511/', '99506l', '.jpg'),
('Initial D', 'https://cdn.myanimelist.net/images/anime/13/', '6801l', '.jpg'),
('Invincible', 'https://www.moviementarios.com/wp-content/uploads/2021/03/', 'Invincible-1', '.jpg'),
('Iron Man Aventuras de Hierro', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Iron Man Aventuras de Hierro', '.jpg'),
('Isekai Maou to Shoukan Shoujo no Dorei Majutsu', 'https://cdn.myanimelist.net/images/anime/1207/', '111793l', '.jpg'),
('Isekai wa smartphone', 'https://cdn.myanimelist.net/images/anime/7/', '86794l', '.jpg'),
('Jaku-Chara Tomozaki-kun', 'https://cdn.myanimelist.net/images/anime/1120/', '109232l', '.jpg'),
('Jibaku Shounen Hanako-kun', 'https://cdn.myanimelist.net/images/anime/1700/', '104788l', '.jpg'),
('Jitsu Wa Watashi Wa', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Jitsu Wa Watashi Wa', '.jpg'),
('Jujutsu Kaisen', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Jujutsu Kaisen', '.jpg'),
('Kaguya-sama Love is war', 'https://cdn.myanimelist.net/images/anime/1436/', '109969l', '.jpg'),
('Kaifuku Jutsushi no Yarinaoshi', 'https://cdn.myanimelist.net/images/anime/1301/', '110018l', '.jpg'),
('Kamen Rider Agito', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Kamen Rider Agito', '.jpg'),
('Kamen Rider Kuuga', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Kamen Rider Kuuga', '.jpg'),
('Kanojo mo Kanojo', 'https://cdn.myanimelist.net/images/anime/1113/', '116964l', '.jpg'),
('Kanojo, Okarishimasu', 'https://cdn.myanimelist.net/images/anime/1902/', '128382l', '.jpg'),
('Kawaikereba hentai demo suki ni natte kuremasu ka?', 'https://cdn.myanimelist.net/images/anime/1430/', '102439l', '.jpg'),
('Kenishi el disipulo más fuerte', 'https://cdn.myanimelist.net/images/anime/9/', '75515l', '.jpg'),
('Kenja no Mago', 'https://cdn.myanimelist.net/images/manga/3/', '186273l', '.jpg'),
('Kobayashi-san Chi no Maid Dragon', 'https://cdn.myanimelist.net/images/anime/5/', '85434l', '.jpg'),
('Komi-san wa, Komyushō Desu', 'https://cdn.myanimelist.net/images/manga/4/', '259875l', '.jpg'),
('kono subarashii sekai ni shukufuku wo', 'https://cdn.myanimelist.net/images/anime/8/', '77831l', '.jpg'),
('Kono Yo no Hate de Koi wo Utau Shoujo YU-NO', 'https://cdn.myanimelist.net/images/anime/1009/', '100450l', '.jpg'),
('Kotoura-San', 'https://cdn.myanimelist.net/images/anime/10/', '75585l', '.jpg'),
('Koutetsujou no Kabaneri', 'https://cdn.myanimelist.net/images/anime/4/', '77657l', '.jpg'),
('Kumo Desu ga, Nani ka?', 'https://cdn.myanimelist.net/images/manga/3/', '180081l', '.jpg'),
('Kyuukyoku Shinka shita Full Dive RPG ga Genjitsu yori mo Kusoge Dattara', 'https://cdn.myanimelist.net/images/anime/1357/', '113277l', '.jpg'),
('Las Aventuras de Saint Tail', 'https://cdn.myanimelist.net/images/anime/1/', '2191l', '.jpg'),
('Let\'s Play Phoenix Wright Justis For All', 'https://wowroms-photos.com/emulators-roms-logo/36/19213/420-420/', 'Phoenix+Wright+-+Ace+Attorney+-+Justice+for+All+(USA)-image', '.jpg'),
('Link Click', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Link Click', '.jpg'),
('Los últimos frikis del mundo', 'https://m.media-amazon.com/images/I/', '51Zf0US26+L._SX328_BO1,204,203,200_', '.jpg'),
('Magic kaito 1412', 'https://cdn.myanimelist.net/images/anime/10/', '66841l', '.jpg'),
('Magikano', 'https://cdn.myanimelist.net/images/anime/11/', '15880l', '.jpg'),
('Mahoutsukai Reimeiki', 'https://cdn.myanimelist.net/images/anime/1093/', '121114l', '.jpg'),
('Maken-Ki! Two', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Maken-Ki! Two', '.jpg'),
('Masamue kun\'s revege', 'https://cdn.myanimelist.net/images/anime/12/', '83709l', '.jpg'),
('Masamune-Kun No Revenge', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Masamune-Kun No Revenge', '.jpg'),
('Masamune-Kun No Revenge OVA', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Masamune-Kun No Revenge OVA', '.jpg'),
('Mashita iruma kun', 'https://cdn.myanimelist.net/images/anime/1636/', '99012l', '.jpg'),
('Meteoro: La Nueva Generación', 'https://serieslan.com/tb/', 'mng', '.jpg'),
('Mieru ko-chan', 'https://cdn.myanimelist.net/images/anime/1045/', '117154l', '.jpg'),
('Mob psycho 100', 'https://cdn.myanimelist.net/images/anime/5/', '79183l', '.jpg'),
('Moyashimon', 'https://cdn.myanimelist.net/images/anime/5/', '37533l', '.jpg'),
('Muremasen Seton Gakuen', 'https://cdn.myanimelist.net/images/anime/1558/', '104666l', '.jpg'),
('Mushoku Tensei: Isekai Ittara Honki Dasu', 'https://cdn.myanimelist.net/images/anime/1530/', '117776l', '.jpg'),
('Nande koko ni Sensei ga!?', 'https://cdn.myanimelist.net/images/anime/1752/', '111394l', '.jpg'),
('Nisekoi', 'https://cdn.myanimelist.net/images/anime/13/', '72626l', '.jpg'),
('Noragami', 'https://cdn.myanimelist.net/images/anime/1009/', '98400l', '.jpg'),
('Okusama ga Seitokaichou!', 'https://cdn.myanimelist.net/images/anime/9/', '76157l', '.jpg'),
('One Piece', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'One Piece', '.jpg'),
('Onyx Equinox', 'https://img1.ak.crunchyroll.com/i/spire3/', '5e935c95e5f406ad34d017c0297b57681593068307_full', '.png'),
('Ore No Imouto Ga Konnani Kawaii Wake Ga Nai', 'https://cdn.myanimelist.net/images/anime/10/', '27730l', '.jpg'),
('Ore No Kanojo To Osananajimi Ga Shuraba Sugiru', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Ore No Kanojo To Osananajimi Ga Shuraba Sugiru', '.jpg'),
('Osananajimi ga Zettai ni Makenai Love Comedy', 'https://cdn.myanimelist.net/images/anime/1773/', '112198l', '.jpg'),
('Oshiete galko-chan', 'https://cdn.myanimelist.net/images/anime/1018/', '112552l', '.jpg'),
('Otome Game no Hametsu Flag shika Nai Akuyaku Reijou ni', 'https://cdn.myanimelist.net/images/anime/1483/', '107061l', '.jpg'),
('Otome Game Sekai wa Mob ni Kibishii Sekai desu', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Otome Game Sekai wa Mob ni Kibishii Sekai desu', '.jpg'),
('Overlord', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Overlord', '.jpg'),
('Owari no seraph', 'https://cdn.myanimelist.net/images/anime/13/', '72506l', '.jpg'),
('Power Rangers SPD', 'https://i.pinimg.com/564x/d2/4d/7b/', 'd24d7bc14fcc776ceb9f7a4fd452d7b3', '.jpg'),
('Punch Line', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Punch Line', '.jpg'),
('Randy Cunningham: Ninja Total', 'https://i.pinimg.com/564x/b5/b9/82/', 'b5b982667d87762c5ea06a25008a3420', '.jpg'),
('Re:Zero kara Hajimeru Isekai Seikatsu', 'https://cdn.myanimelist.net/images/anime/1522/', '128039l', '.jpg'),
('ReLife', 'https://cdn.myanimelist.net/images/anime/3/', '82149l', '.jpg'),
('ReLIFE: Kanketsu-Hen', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'ReLIFE: Kanketsu-Hen', '.jpg'),
('Renai Boukun', 'https://cdn.myanimelist.net/images/anime/3/', '83243l', '.jpg'),
('Rokka no Yuusha', 'https://cdn.myanimelist.net/images/anime/9/', '74374l', '.jpg'),
('Rokudenashi majutsu koushi to akashic records', 'https://cdn.myanimelist.net/images/anime/8/', '85593l', '.jpg'),
('RPG Fudousan', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'RPG Fudousan', '.jpg'),
('Ryuuou no oshigoto!', 'https://cdn.myanimelist.net/images/anime/12/', '89979l', '.jpg'),
('Saenai Heroine No Sodatekata', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Saenai Heroine No Sodatekata', '.jpg'),
('Sakurasou no Pet na Kanojo', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Sakurasou no Pet na Kanojo', '.jpg'),
('Scissor Seven', 'https://cdn.myanimelist.net/images/anime/1062/', '106410l', '.jpg'),
('Seirei Gensouki', 'https://cdn.myanimelist.net/images/anime/1094/', '110385l', '.jpg'),
('Seishun Buta Yarou wa Bunny Girl Senpai no Yume wo Minai', 'https://cdn.myanimelist.net/images/anime/1301/', '93586l', '.jpg'),
('Seishun Buta Yarou wa Yumemiru Shoujo no Yume wo Minai', 'https://cdn.myanimelist.net/images/anime/1833/', '99985l', '.jpg'),
('Sekai Saikou no Ansatsusha, Isekai Kizoku ni Tensei sur', 'https://cdn.myanimelist.net/images/anime/1928/', '117620l', '.jpg'),
('Sentouin, Hakenshimasu!', 'https://cdn.myanimelist.net/images/anime/1444/', '115118l', '.jpg'),
('She-ra y las princesas del poder', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'shera', '.jpg'),
('Shijou Saikyou no Daimaou, Murabito A ni Tensei suru', 'https://cdn.myanimelist.net/images/anime/1904/', '120095l', '.jpg'),
('Shimoneta', 'https://cdn.myanimelist.net/images/anime/3/', '74944l', '.jpg'),
('Shinchou Yuusha: Kono Yuusha ga Ore Tueee Kuse ni Shinchou Sugiru', 'https://cdn.myanimelist.net/images/anime/1462/', '100941l', '.jpg'),
('Shinka no Mi: Shiranai Uchi ni Kachigumi Jinsei', 'https://cdn.myanimelist.net/images/anime/1537/', '117590l', '.jpg'),
('Shuumatsu No Harem', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Shuumatsu No Harem', '.jpg'),
('Shuumatsu no Izetta', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Shuumatsu no Izetta', '.jpg'),
('Sono bisque doll wa koi suru', 'https://cdn.myanimelist.net/images/anime/1481/', '118845l', '.jpg'),
('Sounan Desu ka?', 'https://cdn.myanimelist.net/images/anime/1741/', '102237l', '.jpg'),
('Strike the Blood', 'https://cdn.myanimelist.net/images/anime/6/', '55495l', '.jpg'),
('Taimadou Gakuen 35 Shiken Shoutai', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Taimadou Gakuen 35 Shiken Shoutai', '.jpg'),
('Takt Op Destiny', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Takt Op Destiny', '.jpg'),
('Tantei wa Mou, Shindeiru', 'https://cdn.myanimelist.net/images/anime/1843/', '115815l', '.jpg'),
('Tate no yuusha', 'https://cdn.myanimelist.net/images/anime/1490/', '101365l', '.jpg'),
('Tears to Tiara', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Tears to Tiara', '.jpg'),
('Tensei shitara Ken deshita', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Tensei shitara Ken deshita', '.jpg'),
('Tensei shitara Slime Datta Ken', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Tensei shitara Slime Datta Ken', '.jpg'),
('The owl house', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'sailorluz', '.jpg'),
('Thundercats 2011', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'thundercats', '.jpg'),
('Tokyo Revengers', 'https://cdn.myanimelist.net/images/anime/1839/', '122012l', '.jpg'),
('Tondemo Skill de Isekai Hourou Meshi Episodio', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Tondemo Skill de Isekai Hourou Meshi Episodio', '.jpg'),
('Tonikaku kawaii', 'https://cdn.myanimelist.net/images/anime/1279/', '106298l', '.jpg'),
('Tsugumomo', 'https://cdn.myanimelist.net/images/anime/1997/', '106184l', '.jpg'),
('Tsuki ga Michibiku Isekai Douchuu', 'https://cdn.myanimelist.net/images/anime/1950/', '116474l', '.jpg'),
('Umineko No Naku Koro Ni', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Umineko No Naku Koro Ni', '.jpg'),
('Uzaki san Asobitai', 'https://cdn.myanimelist.net/images/anime/1077/', '105831l', '.jpg'),
('Uzaki-Chan Wa Asobitai', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Uzaki-Chan Wa Asobitai', '.jpg'),
('Watashi Ga Motete Dousunda', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Watashi Ga Motete Dousunda', '.jpg'),
('Watashi, Nouryoku wa Heikinchi de tte Itta yo ne!', 'https://cdn.myanimelist.net/images/anime/1677/', '90846l', '.jpg'),
('Witch Craft Works', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Witch Craft Works', '.jpg'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Yahari Ore No Seishun Love Comedy Wa Machigatteiru', '.jpg'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Kan', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Kan', '.jpg'),
('Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Zoku', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Yahari Ore No Seishun Love Comedy Wa Machigatteiru. Zoku', '.jpg'),
('Yamada-kun y las siete brujas', 'https://cdn.myanimelist.net/images/anime/2/', '73700l', '.jpg'),
('Yatogame-chan Kansatsu Nikki', 'https://cdn.myanimelist.net/images/anime/1878/', '111514l', '.jpg'),
('Yofukashi no uta', 'https://cdn.myanimelist.net/images/anime/1529/', '119342l', '.jpg'),
('Youjo senki', 'https://cdn.myanimelist.net/images/anime/5/', '82890l', '.jpg'),
('Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e', 'https://cdn.myanimelist.net/images/anime/5/', '86830l', '.jpg'),
('Yozakura Family', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Yozakura Family', '.jpg'),
('Yozakura Quartet: Hoshi No Umi', 'https://raw.githubusercontent.com/CritickalGames/img/main/', 'Yozakura Quartet: Hoshi No Umi', '.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre` varchar(25) NOT NULL,
  `correo` varchar(90) NOT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombre`, `correo`, `contraseña`, `foto`) VALUES
('zg', 'zg@zg.com', '123', 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_sigue_anime`
--

CREATE TABLE `usuario_sigue_anime` (
  `usuario` varchar(25) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura para la vista `cantidadanimestoportadas`
--
DROP TABLE IF EXISTS `cantidadanimestoportadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidadanimestoportadas`  AS SELECT count(`animes`.`nombre`) AS `COUNT(animes.nombre)`, count(`portadas`.`nombre`) AS `COUNT(portadas.nombre)` FROM (`animes` left join `portadas` on(`animes`.`nombre` = `portadas`.`nombre`)) ORDER BY `animes`.`nombre` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `nombressinurl`
--
DROP TABLE IF EXISTS `nombressinurl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nombressinurl`  AS SELECT `animes`.`nombre` AS `nombre` FROM `animes` WHERE !(`animes`.`nombre` in (select `portadas`.`nombre` from `portadas`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`telefono`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`nombre`,`temporada`);

--
-- Indices de la tabla `portadas`
--
ALTER TABLE `portadas`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `usuario_sigue_anime`
--
ALTER TABLE `usuario_sigue_anime`
  ADD PRIMARY KEY (`usuario`,`nombre`),
  ADD KEY `fk_Nombre_USA` (`nombre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `fk_Nombre_Estados` FOREIGN KEY (`nombre`) REFERENCES `animes` (`nombre`);

--
-- Filtros para la tabla `portadas`
--
ALTER TABLE `portadas`
  ADD CONSTRAINT `fk_nombre_Anime_Portada` FOREIGN KEY (`nombre`) REFERENCES `animes` (`nombre`);

--
-- Filtros para la tabla `usuario_sigue_anime`
--
ALTER TABLE `usuario_sigue_anime`
  ADD CONSTRAINT `fk_Nombre_USA` FOREIGN KEY (`nombre`) REFERENCES `animes` (`nombre`),
  ADD CONSTRAINT `fk_Usuario_USA` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
