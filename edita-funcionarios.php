<?php
require_once "src/database/Database.php";

//Testando se foi enviado o parâmetro para exclusão
if( $_SERVER["REQUEST_METHOD"] == "POST" ) {
    $id = $_POST["id"];
    $nome = $_POST["nome"];
    $cpf = $_POST["cpf"];
    $nasc = $_POST["nasc"];
    $salario = $_POST["salario"];

    $db = new Database();
    $sql = "UPDATE funcionarios SET
            nome = '$nome',
            cpf = '$cpf',
            data_nasc = '$nasc',
            salario = $salario WHERE id = $id ";

    $db->update($sql);

    echo "<script>
            alert('✅ Funcionário editado.')
            window.location.href='lista-funcionarios.php'
          </script>";
} else {
    header("location: lista-funcionarios.php");
}