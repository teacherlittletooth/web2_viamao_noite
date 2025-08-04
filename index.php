<?php

//Importando arquivo
require_once "src/database/Database.php";

if( $_SERVER["REQUEST_METHOD"] == "POST" ) {

    require_once "up.php";

    //Recebendo valores do formulário
    $nome = $_POST["nome"];
    $cpf = $_POST["cpf"];
    $nasc = $_POST["data-nasc"];
    $salario = $_POST["salario"];
    
    //Instanciando a classe Database
    $db = new Database();

    $sql = "SELECT * FROM funcionarios WHERE cpf = '$cpf' ";
    $test = $db->select($sql);

    if( count($test) == 0 ) {
        //Criando a instrução sql
        $sql = "INSERT INTO funcionarios(nome, cpf, data_nasc, salario, foto)
                VALUES('$nome', '$cpf', '$nasc', $salario, '$target_file')";

        //Chamando função da classe Database
        $db->insert($sql);
        echo "<script>
                alert('Registro realizado com sucesso!')
                window.location.href='index.php'
              </script>";
    } else {
        echo "Registro não concluído: CPF já registrado.";
    }

}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fazendinha</title>
</head>
<body>
    <h1>Cadastro de funcionários</h1>

    <form action="#" method="post" enctype="multipart/form-data">

        <label for="nome">Nome:</label><br>
        <input type="text" name="nome" id="nome" required><br><br>

        <label for="cpf">CPF:</label><br>
        <input type="text" name="cpf" id="cpf" required><br><br>

        <label for="data-nasc">Data de Nascimento:</label><br>
        <input type="date" name="data-nasc" id="data-nasc" max="2006-12-01" required><br><br>

        <label for="salario">Salário:</label><br>
        <input type="number" name="salario" id="salario" step="0.01" required><br><br>

        <label for="fileToUpload">Foto:</label><br>
        <input type="file" name="fileToUpload" id="fileToUpload" accept=".png, .jpg, .jpeg, .webp, .gif"><br><br>

        <input type="submit" value="Finalizar cadastro">

    </form>

    <hr>
    <a href="lista-funcionarios.php">Lista de funcionários</a>
</body>
</html>