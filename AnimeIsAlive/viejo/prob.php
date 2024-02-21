<?php
//require("PHP/USER/Admin.php");

//$objAdmin               = new UserAdmin();
//$objControladorAnime    = new ControladorAnime();
//$objModeloAnime         = new ModeloAnime();
//$objModeloConexion      = new ModeloConexion();
function atrToString(array $valoresATR){
    $clave= "";
    $valor="";
    foreach ($valoresATR as $key) {
      $valor= $key;
      if ($key!=count($valoresATR)-1 && count($valoresATR)!=1) {
        $clave = $clave."'$valor', ";
      }else {
        $clave = $clave."'$valor'";
      }
    }

    return $clave;
  }
  function atrToStringNombres($valoresATR){
    $clave= "";
    foreach ($valoresATR as $key) {
      $valor= $key;
      if ($key!=count($valoresATR)-1 && count($valoresATR)!=1) {
        $clave = $clave."`$valor`, ";
      }else {
        $clave = $clave."`$valor`";
      }
    }

    return $clave;
  }

  function sqlSet(array $columna, ... $valorAtributos){
        $valores= atrToString($valorAtributos);
        $columna= atrToStringNombres($columna);
        $sql = "INSERT INTO tabla ($columna) 
            VALUES ($valores)";
    return ($sql);
  }
  echo "<br><br>";
  $array=[
    "nombre"=>"nombre"
    ];
    var_dump($array);
  echo "<br><br>".(sqlSet(["nombre", "temporada", "capitulo", "estado"], "a", "1", "2", "visto"))

?>
<br>///////////////////////////////////////////////////////

<form action="PHP/PROB/ANIME/Listar.php" method="post">
    
    <button type="submit">Listar</button>
</form>

<form action="PHP/PROB/ANIMES/BuscarNombre.php" method="post">
    <input type="text" name="nombre">
    <button type="submit">Buscar</button>
</form>

<form action="PHP/PROB/ESTADOS/Subir.php" method="post">
    <input type="text" name="nombre">
    <input type="text" name="temporada">
    <input type="text" name="capitulo">
    <input type="text" name="estado">
    <button type="submit">Buscar</button>
</form>
