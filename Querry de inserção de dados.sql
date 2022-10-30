-- Inserção de dados
SHOW DATABASES;
USE ecommerce;

-- Inserindo valores na tabela cliente
DESC Cliente;
INSERT INTO Cliente(f_nome, m_nome, l_nome, cpf, data_nascimento, endereco) 
	VALUES 	('Pessoa 1', 'ABC', 'Silva', '12345678910', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
			('Pessoa 2', 'DEF', 'Silva', '12345678911', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
			('Pessoa 3', 'GHI', 'Silva', '12345678912', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
            ('Pessoa 4', 'IJK', 'Silva', '12345678913', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
            ('Pessoa 5', 'LMN', 'Silva', '12345678914', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP');
SELECT * FROM Cliente;

INSERT INTO Cliente (f_nome, m_nome, l_nome, cpf, data_nascimento, endereco) 
		VALUES 	('Pessoa 6', 'XYZ', 'Silva', '12345678999', '2022-10-28', 'Rua: Principal, Cidade: São Paulo, UF: SP');

-- Inserindo valores na tabela Produto
DESC Produto;
INSERT INTO Produto (nome_produto, categoria, classificacao_kids, avaliacao)
	VALUES 	('Fone de ouvido', 'Eletronico', false, '9'),
			('Carrinho de controle remoto', 'Brinquedo', true, '7'),
            ('Batedeira', 'Eletrodomesticos', false, '4'),
            ('Mesa de centro', 'Moveis', false, '9'),
            ('Camiseta de marca', 'Vestimentas', true, '9'),
            ('Aparelho celular', 'Eletronico', false, '2'),
            ('Smart Watch', 'Eletronico', false, '10');
SELECT * FROM Produto;
    
-- Inserindo valores na tabela Pedido
DESC Pedido;
INSERT INTO Pedido (cod_cliente, cod_pagamento, status_pedido, frete, valor_enviado, pagamento_dinheiro)
	VALUES 	('1', 1258,'Enviado', 30.0, 170, 0),
			('1', 1259,'Enviado', 20.0, 50, 0),
			('2', 1260,'Enviado', 0, 1568, 1),
			('3', 1261,'Enviado', 40, 10000, 0),
			('4', 1262,'Enviado', 5.0, 1568, 0),
            ('4', 1263,'Enviado', 5.0, 7985, 0),
            ('4', 1264,'Enviado', 5.0, 153, 0),
            ('4', 1265,'Enviado', 5.0, 2568, 0),
			('5', 1266,'Enviado', 30.0, 125, 1);
SELECT * FROM Pedido;

-- Inserindo valores na tabela Itens_pedido
DESC Itens_pedido;
INSERT INTO Itens_pedido (cod_produto, cod_pedido, quantidade, status_produto)
	VALUES	(1, 1 , 15, DEFAULT),
			(6, 1, 1, DEFAULT),
            (5, 2, 6, DEFAULT),
            (7, 3, 10, DEFAULT),
            (3, 4, 3, DEFAULT),
            (4, 4, 2, DEFAULT),
            (2, 4, 4, DEFAULT),
            (6, 4, 3, DEFAULT),
			(2, 5, 1, DEFAULT);
SELECT * FROM Itens_pedido;

-- Inserindo valores na tabela Estoque
DESC Estoque;
INSERT INTO Estoque (cod_estoque, local_estoque)
	VALUES	(1, 'Rio de Janeiro'),
			(2, 'Rio de Janeiro'),
            (3, 'São Paulo');
SELECT * FROM Estoque;

-- Inserindo valores na tabela Itens_estoque
DESC Itens_estoque;
INSERT INTO Itens_estoque (cod_produto, cod_estoque, quantidade)
	VALUES	(1, 1, 999),
			(2, 1, 999),
            (3, 1, 999),
            (4, 1, 999),
            (5, 2, 999),
            (6, 2, 999),
            (7, 3, 999);
SELECT * FROM Itens_estoque;

-- Inserindo valores na tabela Fornecedor
DESC Fornecedor;
INSERT INTO Fornecedor (cnpj, razao_social, nome_fantasia, contato, endereco)
	VALUES 	('000.000.000-01', 'Fornecedor A', 'teste', '00000000000', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
			('000.000.000-02', 'Fornecedor B', 'teste', '00000000000', 'Rua: Principal, Cidade: São Paulo, UF: SP'),
			('000.000.000-03', 'Fornecedor C', 'teste', '00000000000', 'Rua: Principal, Cidade: São Paulo, UF: SP');
SELECT * FROM Fornecedor;

-- Inserindo valores na tabela Disponibiliza
DESC Disponibiliza;
INSERT INTO Disponibiliza (cod_produto, cod_fornecedor)
	VALUES 	(1, 1),
			(2, 1),
            (3, 1),
            (4, 2),
            (5, 2),
            (6, 3),
			(7, 3);
SELECT * FROM Disponibiliza;

-- Inserindo valores na tabela Vendedor
DESC Vendedor;
INSERT INTO Vendedor (cnpj, razao_social, contato, local_vendedor)
	VALUES 	('000.000.000-04', 'Vendedor A', '99999999991', 'SP'),
			('000.000.000-05', 'Vendedor B', '99999999991', 'RJ'),
			('000.000.000-06', 'Vendedor C', '99999999991', 'SP');
            
INSERT INTO Vendedor (cpf, razao_social, contato, local_vendedor)
	VALUES 	('000000111', 'Vendedor D', '99999999991', 'RJ'),
			('000000112', 'Vendedor E', '99999999991', 'RJ'),
			('000000113', 'Vendedor F', '99999999991', 'RJ');
SELECT * FROM Vendedor;

-- Inserindo valores na tabela Produtos_vendedor
DESC Produtos_vendedor;
INSERT INTO Produtos_vendedor (cod_vendedor, cod_produto)
	VALUES	(1, 6),
			(2, 5),
            (3, 2),
            (4, 1),
            (5, 3),
            (6, 4);
SELECT * FROM Produtos_vendedor;

DESC Pagamentos;
INSERT INTO Pagamentos()
	VALUES	(1, 001, 'Boleto', '10000'),
			(2, 002, 'Cartão', '10000'),
            (3, 003, 'Pix', '10000'),
            (4, 004, 'Dois Cartões', '10000'),
            (5, 005, 'PicPay', '10000'),
			(5, 006, 'Pix', '10000');
SELECT * FROM  Pagamentos;



