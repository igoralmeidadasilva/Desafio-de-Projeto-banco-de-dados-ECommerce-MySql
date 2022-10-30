-- CRIAÇÃO DO BANCO DE DADOS PARA O CÉNARIO DE E-COMMERCE

CREATE DATABASE IF NOT EXISTS Ecommerce;
USE Ecommerce;
-- DROP DATABASE Ecommerce;

-- Criar tabela de Clientes
CREATE TABLE Cliente(
	cod_cliente		INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    f_nome 			VARCHAR(10) NOT NULL,
    m_nome 			CHAR(3),
    l_nome 			VARCHAR(15),
    cpf				CHAR(11) NOT NULL,
    data_nascimento	DATE NOT NULL,
    endereco		VARCHAR(50),
    CONSTRAINT pk_cliente
		PRIMARY KEY (cod_cliente),
    CONSTRAINT un_cliente_cpf 
		UNIQUE (cpf)
);
ALTER TABLE Cliente auto_increment=1;

-- Crinado tabela de produtos
CREATE TABLE Produto(
	cod_produto			INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	nome_produto 		VARCHAR(30) NOT NULL,
    categoria			ENUM('Eletronico', 'Brinquedo', 'Vestimentas', 'Eletrodomesticos', 'Moveis'),
    descricao 			VARCHAR(30),
    classificacao_kids	BOOL DEFAULT FALSE,
    avaliacao			FLOAT DEFAULT 0,
    size				VARCHAR(10),
	CONSTRAINT	pk_produto PRIMARY KEY (cod_produto)
);
ALTER TABLE Produto auto_increment=1;

-- Criando a tabela de pagamentos
CREATE TABLE Pagamentos(
	cod_cliente			INT UNSIGNED NOT NULL,
	cod_pagamento		INT UNSIGNED NOT NULL,
    tipo_pagamento		ENUM('Boleto', 'Cartão', 'Dois Cartões', 'Pix', 'PicPay') NOT NULL,
    limite_disponivel	FLOAT,
    CONSTRAINT fk_pagamentos_cliente
		FOREIGN KEY (cod_cliente)
        REFERENCES Cliente(cod_cliente),
    CONSTRAINT pk_pagamentos 
		PRIMARY KEY(cod_cliente, cod_pagamento)
);

-- Criando tabela de pedidos
CREATE TABLE Pedido(
	cod_pedido 			INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cod_cliente			INT UNSIGNED NOT NULL, 
    cod_pagamento		INT UNSIGNED NOT NULL,
    status_pedido 		ENUM('Em andamento', 'Processando', 'Enviado', 'Entergue', 'Cancelado') DEFAULT 'Em andamento',
    descricao			VARCHAR(30),
    frete				FLOAT DEFAULT 0,
    valor_enviado 		FLOAT DEFAULT 10,
    pagamento_dinheiro	BOOL DEFAULT FALSE,
	CONSTRAINT pk_pedido
		PRIMARY KEY(cod_pedido),
	CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (cod_cliente)
        REFERENCES Cliente(cod_cliente)
);
ALTER TABLE Produto auto_increment=1;

-- Criando tabela do estoque
CREATE TABLE Estoque(
	cod_estoque 	INT UNSIGNED NOT NULL,
    local_estoque	VARCHAR(50),
    CONSTRAINT pk_estoque
		PRIMARY KEY (cod_estoque)
); 

-- Criando a tabela Fornecedor
CREATE TABLE Fornecedor (
	cod_fornecedor	INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cnpj			CHAR(15) NOT NULL,
    razao_social	VARCHAR(50) NOT NULL,
    nome_fantasia	VARCHAR(50),
    contato			CHAR(11) NOT NULL,
    endereco		VARCHAR(50),
	CONSTRAINT pk_fornecedor PRIMARY KEY (cod_fornecedor),
    CONSTRAINT un_fornecedor_cnpj UNIQUE (cnpj)
);
ALTER TABLE Fornecedor auto_increment=1;

-- Criando tabela vendedor-terceiro
CREATE TABLE Vendedor (
	cod_vendedor	INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cnpj			CHAR(15),
    cpf				CHAR(9),
    razao_social	VARCHAR(50) NOT NULL,
    nome_fantasia	VARCHAR(50),
    contato			CHAR(11) NOT NULL,
    local_vendedor	VARCHAR(50),
	CONSTRAINT pk_vendedor PRIMARY KEY (cod_vendedor),
	CONSTRAINT un_cnpj_vendedor UNIQUE (CNPJ),
    CONSTRAINT un_cpf_vendedor UNIQUE (CPF)
); 
ALTER TABLE Vendedor auto_increment=1;

-- Criando a tabela produtos_vendedor
CREATE TABLE Produtos_vendedor(
	cod_vendedor	INT UNSIGNED NOT NULL,
	cod_produto		INT UNSIGNED NOT NULL,
    CONSTRAINT pk_produtos_vendedor 
		PRIMARY KEY (cod_vendedor, cod_produto),
	CONSTRAINT fk_produtosVendedor_vendedor 
		FOREIGN KEY (cod_vendedor)
        REFERENCES Vendedor(cod_vendedor),
	CONSTRAINT fk_produtosVendedor_produtos 
		FOREIGN KEY (cod_produto)
        REFERENCES Produto(cod_produto)
);


-- Criando a tabela Disponibiliza
CREATE TABLE Disponibiliza(
	cod_produto		INT UNSIGNED NOT NULL,
    cod_fornecedor	INT UNSIGNED NOT NULL,
	CONSTRAINT pk_disponibiliza 
		PRIMARY KEY(cod_produto, cod_fornecedor),
	CONSTRAINT fk_disponibiliza_produtos 
		FOREIGN KEY (cod_produto)
        REFERENCES Produto(cod_produto),
	CONSTRAINT fk_disponibiliza_fornecedor
		FOREIGN KEY (cod_fornecedor)
        REFERENCES Fornecedor(cod_fornecedor)
);

-- Criando a tabela Itens_pedido
CREATE TABLE Itens_pedido(
	cod_produto		INT UNSIGNED NOT NULL,
	cod_pedido 		INT UNSIGNED NOT NULL,
    quantidade		INT NOT NULL,
    status_produto	ENUM('Disponivel', 'Sem estoque') NOT NULL,
    CONSTRAINT pk_itens_pedido PRIMARY KEY(cod_produto, cod_pedido),
    CONSTRAINT fk_itensPedido_produto
		FOREIGN KEY (cod_produto)
        REFERENCES Produto(cod_produto),
	CONSTRAINT fk_itensPedido_pedido
		FOREIGN KEY (cod_pedido)
        REFERENCES Pedido(cod_pedido)
);

-- Criando a tabela Itens_estoque
CREATE TABLE Itens_estoque(
	cod_produto INT UNSIGNED NOT NULL,
    cod_estoque	INT UNSIGNED NOT NULL,
	quantidade	INT NOT NULL,
    CONSTRAINT pk_itens_estoque PRIMARY KEY(cod_produto, cod_estoque),
    CONSTRAINT fk_itensEstoque_produto
		FOREIGN KEY (cod_produto)
        REFERENCES Produto(cod_produto),
	CONSTRAINT fk_itensEstoque_estoque
		FOREIGN KEY (cod_estoque)
        REFERENCES Estoque(cod_estoque)
);

SHOW TABLES;
USE information_schema;
DESC referential_constraints;
SELECT * FROM referential_constraints WHERE constraint_schema = 'Ecommerce';

