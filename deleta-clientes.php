<?php
require_once "src/database/Database.php";

if( isset($_GET["id"]) ) {
    $id = $_GET["id"];

    $db = new Database();

    $sql = "DELETE FROM clientes WHERE id_cliente = $id";

    $db->delete($sql);

    header("location: lista-clientes.php");
}