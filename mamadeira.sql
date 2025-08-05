-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Ago-2025 às 00:17
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mamadeira`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `telefone`, `cpf`, `nome`, `foto`) VALUES
(7, '99999', '99999', 'Wilson Mattos', 'uploads/IMG_5656.jpeg'),
(9, '(51)986586674', '88999', 'Solange Frasão', 'uploads/IMG_8251 (1).jpeg'),
(10, '12313', '99888', 'Gustavo', 'uploads/Turma.jpg'),
(11, '4444444', '4444444', 'Vilmar', 'uploads/Turma.jpg'),
(12, '890714234', '789014234', 'jkahsdfhj', 'uploads/matriz_gut-1.jpg'),
(13, '9999888777', '99998888777', 'Agenor Dutra', 'uploads/Captura de tela 2025-02-22 110557.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `data_compra` date NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `id_encomenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomendas`
--

CREATE TABLE `encomendas` (
  `id_encomenda` int(11) NOT NULL,
  `data_encom` date NOT NULL,
  `descr` text NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `cnpj` varchar(15) NOT NULL,
  `razao_social` varchar(30) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornec_compras`
--

CREATE TABLE `fornec_compras` (
  `id_fornec_compra` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `quant` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `telefone` (`telefone`,`cpf`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_encomenda` (`id_encomenda`);

--
-- Índices para tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`id_encomenda`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices para tabela `fornec_compras`
--
ALTER TABLE `fornec_compras`
  ADD PRIMARY KEY (`id_fornec_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encomendas`
--
ALTER TABLE `encomendas`
  MODIFY `id_encomenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornec_compras`
--
ALTER TABLE `fornec_compras`
  MODIFY `id_fornec_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_encomenda`) REFERENCES `encomendas` (`id_encomenda`);

--
-- Limitadores para a tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD CONSTRAINT `encomendas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Limitadores para a tabela `fornec_compras`
--
ALTER TABLE `fornec_compras`
  ADD CONSTRAINT `fornec_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `fornec_compras_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
