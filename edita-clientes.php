<?php

require_once "src/database/Database.php";

if( $_SERVER["REQUEST_METHOD"] == "POST" ) {

    require_once "up.php";

    $id = $_POST["id"];
    $nome = $_POST["nome"];
    $cpf = $_POST["cpf"];
    $telefone = $_POST["telefone"];

    $db = new Database();

        $sql = "UPDATE clientes SET
                nome = '$nome',
                cpf = '$cpf',
                telefone = '$telefone',
                foto = '$target_file' WHERE
                id_cliente = $id ";

        $db->update($sql);

        echo "<script>
                alert('✅Dados editados!')
                window.location.href='lista-clientes.php'
            </script>";
    } else {
        header("location: lista-clientes.php");
}