<?php
//Importar arquivo Database.php
require_once "src/database/Database.php";

//Criar objeto da classe Database
$db = new Database();

//Criar query que vai capturar os dados
//da tabela de clientes
$sql = "SELECT * FROM clientes";

//Executar a query e receber seu retorno
$lista = $db->select($sql);

//var_dump($lista);

//php
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes - Mamadeira</title>

    <style>
        #box-edit {
            display: none;
        }

        img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            padding: 0px 5px 0px 5px;
        }
    </style>
</head>
<body>
    <div id="box-edit">
        <h2>Editar cliente:</h2>
        <form 
            action="edita-clientes.php" 
            method="post" 
            onsubmit="return confirmar()"
            enctype="multipart/form-data"
        >
            <input type="hidden" name="id" id="id">
            <input type="text" name="nome" id="nome" placeholder="Nome..." required>
            <br><br>
            <input type="text" name="cpf" id="cpf" placeholder="CPF..." required>
            <br><br>
            <input type="text" name="telefone" id="telefone" placeholder="Telefone..." required>
            <br><br>
            <input type="file" name="fileToUpload" id="fileToUpload" accept=".gif, .png, .jpg, .jpeg, .webp">
            <hr>
            <input type="submit" value="Editar cliente">
            <input type="reset" value="Cancelar" onclick="cancelar()">
        </form>
    </div>

    <h1>Clientes:</h1>

    <table>
        <thead>
            <th>ID</th>
            <th>FOTO</th>
            <th>NOME</th>
            <th>CPF</th>
            <th>TELEFONE</th>
            <th></th>
            <th></th>
        </thead>
        <tbody>
            <?php foreach( $lista as $cliente  ) : ?>
                <tr>
                    <td> <?= $cliente->id_cliente ?> </td>
                    <td>
                        <a href="<?= $cliente->foto ?>" target="_blank">
                            <img src="<?= $cliente->foto ?>" alt="Foto">
                        </a>
                    </td>
                    <td> <?= $cliente->nome ?> </td>
                    <td> <?= $cliente->cpf ?> </td>
                    <td> <?= $cliente->telefone ?> </td>
                    <td onclick="editar(
                                    <?= $cliente->id_cliente ?>,
                                    '<?= $cliente->nome ?>',
                                    '<?= $cliente->cpf ?>',
                                    '<?= $cliente->telefone ?>'
                                )"
                                title="Editar <?= $cliente->nome ?>"> ✏️ </td>
                    <td onclick="excluir(<?= $cliente->id_cliente ?>, '<?= $cliente->nome ?>')" title="Excluir <?= $cliente->nome ?>"> 🗑️ </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <hr>
    <a href="index.php">Cadastro de clientes</a>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function excluir(id, nome) {
            if( confirm("Excluir "+ nome +"?") ) {
                window.location.href="deleta-clientes.php?id=" + id
            }
        }

        function editar(id, nome, cpf, telefone) {
            document.getElementById("box-edit").style.display = "block"
            document.getElementById("id").value = id
            document.getElementById("nome").value = nome
            document.getElementById("cpf").value = cpf
            document.getElementById("telefone").value = telefone
        }

        function cancelar() {
            document.getElementById("box-edit").style.display = "none"
        }

        function confirmar() {
            Swal.fire({
                title: "Editar dados?",
                text: "Esta operação é irreversível!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#38be2cff",
                cancelButtonColor: "#a19c9cff",
                confirmButtonText: "Sim!"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                    title: "Editado!",
                    text: "O cliente foi editado.",
                    icon: "success"
                   });
                }
                return result
            });
        }
    </script>
</body>
</html>