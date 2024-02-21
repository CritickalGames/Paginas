<?php
require_once "../../USER/Admin.php";
    $objUserAdmin = new UserAdmin();
    echo json_encode($objUserAdmin->listarAnime());
    
?>