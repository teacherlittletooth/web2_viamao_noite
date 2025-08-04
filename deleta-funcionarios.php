<?php
require_once "src/database/Database.php";

//Testando se foi enviado o parâmetro para exclusão
if( isset($_GET["id"]) ) {
    $id = $_GET["id"];

    $db = new Database();
    $sql = "DELETE FROM funcionarios WHERE id = $id";

    $db->delete($sql);

    echo "<script>
            alert('❌ Funcionário excluído.')
            window.location.href='lista-funcionarios.php'
          </script>";
} else {
    header("location: lista-funcionarios.php");
}