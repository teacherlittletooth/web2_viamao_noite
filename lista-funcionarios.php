<?php
require_once "src/database/Database.php";

$db = new Database();
$sql = "SELECT * FROM funcionarios";
$lista = $db->select($sql);

//var_dump( $lista );
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de funcionários</title>

    <style>
        #box-edit {
           display: none;
        }

        img {
           height: 50px;
           width: 50px;
           border-radius: 50%;
           object-fit: cover;
           padding: 0px 10px 0px 10px;
        }
    </style>
</head>
<body>
    <div id="box-edit">
        <h2>Editar funcionário:</h2>
        <form action="edita-funcionarios.php" method="post" onsubmit="return confirm('⚠️Editar dados?')">
            <input type="hidden" name="id" id="id">
            <input type="text" name="nome" id="nome" placeholder="Nome" required><br><br>
            <input type="text" name="cpf" id="cpf" placeholder="cpf" required><br><br>
            <input type="date" name="nasc" id="nasc" required><br><br>
            <input type="number" name="salario" id="salario" step="0.01" placeholder="Salário" required>
            <hr>

            <input type="submit" value="Editar funcionário">
            <input type="reset" value="Cancelar" onclick="cancelar()">
        </form>
    </div>

    <h1>Funcionários:</h1>

    <table>
        <thead>
            <th>ID</th>
            <th>FOTO</th>
            <th>NOME</th>
            <th>CPF</th>
            <th>NASCIMENTO</th>
            <th>SALÁRIO</th>
            <th></th>
            <th></th>
        </thead>
        <tbody>
            <?php foreach( $lista as $func ) : ?>
                <tr>
                    <td> <?= $func->id ?> </td>
                    <td>
                        <a href="<?= $func->foto ?>" target="_blank">
                            <img src="<?= $func->foto ?>" alt="<?= $func->foto ?>">     
                        </a>    
                    </td>
                    <td> <?= $func->nome ?> </td>
                    <td> <?= $func->cpf ?> </td>
                    <td> <?= date("d/m/Y", strtotime($func->data_nasc) ) ?> </td>
                    <td> <?= $func->salario ?> </td>
                    <td onclick="editar(
                                    <?= $func->id ?>,
                                    '<?= $func->nome ?>',
                                    '<?= $func->cpf ?>',
                                    '<?= $func->data_nasc ?>',
                                    <?= $func->salario ?>
                                )"
                                title="Editar <?= $func->nome ?>"> 📝 </td>
                    <td onclick="excluir(<?= $func->id ?>, '<?= $func->nome ?>')" title="Excluir <?= $func->nome ?>"> 🗑️ </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <hr>
    <a href="index.php"> Voltar </a>

    <script>
        function excluir(id, nome) {
            if( confirm("Excluir o funcionário "+nome+"?") ) {
                window.location.href="deleta-funcionarios.php?id="+id
            }
        }

        function editar(id, nome, cpf, nasc, salario) {
            document.getElementById("box-edit").style.display = "block"
            document.getElementById("id").value = id
            document.getElementById("nome").value = nome
            document.getElementById("cpf").value = cpf
            document.getElementById("nasc").value = nasc
            document.getElementById("salario").value = salario
        }

        function cancelar() {
            document.getElementById("box-edit").style.display = "none"
        }
    </script>
</body>
</html>