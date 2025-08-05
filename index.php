<?php

//Verificação de envio de dados via POST
if( $_SERVER["REQUEST_METHOD"] == "POST" ) {
    //Importação do arquivo de gerenciamento de uploads
    require_once "up.php";

    //Importação do arquivo de conexão com o Banco de Dados
    require_once "src/database/Database.php";

    //Captura dos dados do formulário
    $nome = $_POST["nome"];
    $cpf = $_POST["cpf"];
    $telefone = $_POST["telefone"];

    //Criação de objeto da classe Database
    $db = new Database();

    //Verificação de dados
    $sql = "SELECT * FROM clientes WHERE cpf = '$cpf'";
    $pesquisa = $db->select($sql);

    if( count($pesquisa) == 0 ) {
        //Instrução que será lançada no banco de dados
        $sql = "INSERT INTO clientes(nome, cpf, telefone, foto)
                VALUES('$nome', '$cpf', '$telefone', '$target_file')";

        //Chamada de função de operação com o Banco de Dados
        $db->insert($sql);

        //Mensagem de sucesso
        echo "<script>
                alert('✅ Cadastro realizado com sucesso!')
                window.location.href='index.php'
              </script>";
    } else {
        echo "❌ Cadastro não realizado: CPF já existente.";
    }
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mamadeira</title>
</head>
<body>
    <h1>Cadastro de clientes:</h1>

    <form action="#" method="post" enctype="multipart/form-data">

        <label for="nome">Nome:</label><br>
        <input type="text" name="nome" id="nome" required><br><br>

        <label for="cpf">CPF:</label><br>
        <input type="text" name="cpf" id="cpf" required><br><br>

        <label for="telefone">Telefone:</label><br>
        <input type="text" name="telefone" id="telefone" required><br><br>

        <label for="fileToUpload">Foto:</label><br>
        <input type="file" name="fileToUpload" id="fileToUpload" accept=".gif, .png, .jpg, .jpeg, .webp"><br><br>
        
        <input type="submit" value="Finalizar cadastro">

    </form>

    <hr>
    <a href="lista-clientes.php">Lista de clientes</a>
</body>
</html>