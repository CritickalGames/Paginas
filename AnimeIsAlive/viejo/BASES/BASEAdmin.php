///////////////////Borrar
    function borrarAnime(string $inicial, string $id){
        $obj = new Backoffice ();
        return $obj->borrar("ANIME", [$inicial, $id]);
    }
///////////////////Search
    function buscarAnime(string $name){
        $obj = new Backoffice ();
        return $obj->buscar("ANIME", [$name]);
    }
///////////////////Edit
     function editarAnime(string $inicial, string $ID, string $nombre){
        $obj = new Backoffice ();
        return $obj->editar("ANIME",[$inicial, $ID, $nombre]);
    }
///////////////////Get
    function conseguirAnimeById(string $inicial, string $ID){
        $obj = new Backoffice ();
        return $obj->conseguir("ANIME",["Id", $inicial, $ID]);
    }

    function conseguirAnimeByInicial(string $inicial){
        $obj = new Backoffice ();
        return $obj->conseguir("ANIME",["Inicial", $inicial]);
    }
///////////////////Group
    function agruparAnimePorInicial(string $inicial){
        $obj = new Backoffice ();
        return $obj->agruparPor("ANIME", ["Inicial", "IdAnime = '$inicial'"]);
    }   
///////////////////Listar
    function listarAnime(){
        $obj = new Backoffice ();
        return $obj->listar("ANIME", ["All", "ALL"]);
    }
    
    function listarAnimePorInicial(string $inicial){
        $obj = new Backoffice ();
        return $obj->listar("ANIME", ["Inicial", $inicial]);
    }

    function subirAnime(string $inicial, string $id, string $nombre){
        $obj = new Backoffice ();
        
        $obj->subir("ANIME", ["$inicial","$id","$nombre"]);
    }
/////////////////////////
    function contarAnime(){
        $obj = new Backoffice ();
        return $obj->contar("ANIME");
    }
