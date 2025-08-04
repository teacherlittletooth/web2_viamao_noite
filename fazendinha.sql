-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Ago-2025 às 00:24
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fazendinha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `data_nasc`, `salario`, `foto`) VALUES
(8, 'Jucilene Ramos', '445566', '2005-05-05', 5555.00, NULL),
(10, 'Jones Mascarenhas', '555555', '2006-11-27', 4000.00, NULL),
(12, 'Babayaga', '1122334455', '2006-11-27', 100000.00, 'uploads/john.jpg'),
(13, 'Florindo Amaro', '332211665544', '2006-10-10', 5555.00, 'uploads/arma.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `maquinas`
--

CREATE TABLE `maquinas` (
  `id` int(11) NOT NULL,
  `chassi` varchar(18) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `data_compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `maq_func`
--

CREATE TABLE `maq_func` (
  `id` int(11) NOT NULL,
  `data_uso` date DEFAULT NULL,
  `id_maq` int(11) DEFAULT NULL,
  `id_func` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `producoes`
--

CREATE TABLE `producoes` (
  `id` int(11) NOT NULL,
  `data_plantio` date DEFAULT NULL,
  `hortalica` varchar(20) NOT NULL,
  `area` float DEFAULT NULL,
  `prev_colheita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_func`
--

CREATE TABLE `prod_func` (
  `id` int(11) NOT NULL,
  `horas` time DEFAULT NULL,
  `id_func` int(11) DEFAULT NULL,
  `id_prod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `maquinas`
--
ALTER TABLE `maquinas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chassi` (`chassi`);

--
-- Índices para tabela `maq_func`
--
ALTER TABLE `maq_func`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_maq` (`id_maq`),
  ADD KEY `id_func` (`id_func`);

--
-- Índices para tabela `producoes`
--
ALTER TABLE `producoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `prod_func`
--
ALTER TABLE `prod_func`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_func` (`id_func`),
  ADD KEY `id_prod` (`id_prod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `maquinas`
--
ALTER TABLE `maquinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `maq_func`
--
ALTER TABLE `maq_func`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `producoes`
--
ALTER TABLE `producoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `prod_func`
--
ALTER TABLE `prod_func`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `maq_func`
--
ALTER TABLE `maq_func`
  ADD CONSTRAINT `maq_func_ibfk_1` FOREIGN KEY (`id_maq`) REFERENCES `maquinas` (`id`),
  ADD CONSTRAINT `maq_func_ibfk_2` FOREIGN KEY (`id_func`) REFERENCES `funcionarios` (`id`);

--
-- Limitadores para a tabela `prod_func`
--
ALTER TABLE `prod_func`
  ADD CONSTRAINT `prod_func_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `prod_func_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `producoes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
