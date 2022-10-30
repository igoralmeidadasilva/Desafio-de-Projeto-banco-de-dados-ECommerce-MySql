-- 1. Exemplos da aula.
-- 1.1 Recuperando dados persistidos
USE ecommerce;
DESC Cliente;
DESC Pedido;
SELECT COUNT(*) FROM Cliente;
SELECT * FROM Pedido;
SELECT COUNT(*) FROM Pedido;
SELECT COUNT(*) FROM Fornecedor;
SELECT * FROM Cliente c, Pedido p WHERE c.cod_cliente = p.cod_cliente;

SELECT concat(f_nome, ' ',l_nome) as 'Nome do Cliente', cod_pedido, status_pedido as 'Status do Pedido'
	FROM Cliente c, Pedido p 
		WHERE c.cod_cliente = p.cod_cliente;

SELECT * FROM Cliente c, Pedido o
	WHERE c.cod_cliente = p.cod_cliente;

-- 1.2 Listando quais Clientes fizeram pedidos
DESC Itens_pedido;
SELECT c.cod_cliente, f_nome, count(*) as 'Número de pedidos' FROM Cliente c 
		INNER JOIN Pedido p ON c.cod_cliente = p.cod_cliente
		INNER JOIN Itens_pedido ip ON ip.cod_pedido = p.cod_pedido
    GROUP BY cod_cliente;
    
SHOW TABLES;
-- 1.3 Recuperações simples com SELECT Statement
-- 1.4 Selecionando somente os itens no estoque de São Paulo
	SELECT * FROM estoque;
	SELECT * FROM itens_estoque;
	SELECT * FROM itens_estoque WHERE cod_estoque = 3;
	-- Contando o total de itens no estoque
	SELECT COUNT(*) AS 'Total de itens no estoque' FROM itens_estoque;
    
-- 2. DESAFIO DE PROJETO
-- 2.1 Recuperações simples com SELECT Statement
	-- 2.1.1 SELECTS de algumas tabelas que seram usadas nos teste abaixo
	SELECT * FROM pedido;
    SELECT * FROM produto;
    SELECT * FROM cliente;
    SELECT * FROM itens_pedido;
    
-- 2.2 Filtros com WHERE Statement
	-- 2.2.1 Selecionamento os pedidos pagos no dinheiro
	SELECT * FROM pedido WHERE pagamento_dinheiro  = 1;
    
-- 2.3 Crie expressões para gerar atributos derivados
	-- 2.3.1 Somando os valores recebidos por dinheiro
	SELECT SUM(valor_enviado) as 'Total recebido em dinheiro' FROM pedido WHERE pagamento_dinheiro = 1;
    
-- 2.4 Defina ordenações dos dados com ORDER BY
   -- 2.4.1 Usando Order by para ordenar a coluna valor_enviado
   SELECT * FROM pedido Order BY valor_enviado;
   -- 2.4.2 Ordenando os pagamentos que não foram realizado em dinherio por ordem crescente
    SELECT * FROM pedido WHERE pagamento_dinheiro = 0 
		Order BY valor_enviado ; -- Ordem crescente
	-- 2.4.3 Ordenando os pagamentos que não foram realizado em dinherio por ordem decrescente
    SELECT * FROM pedido WHERE pagamento_dinheiro = 0 
		Order BY valor_enviado DESC; -- Ordem decrescente
    
-- 2.5 Condições de filtros aos grupos – HAVING Statement
	-- 2.5.1 Agrupando por categoria
    SELECT nome_produto, categoria, COUNT(*) AS 'Total por categoria', classificacao_kids FROM produto 
		GROUP BY categoria;
	-- 2.5.2 Filtrando apartir da cláusula having a coluna classificacao_kids
    SELECT nome_produto, categoria, COUNT(*) AS 'Total por categoria', classificacao_kids FROM produto 
		GROUP BY categoria HAVING classificacao_kids = 1;
    SELECT nome_produto, categoria, COUNT(*) AS 'Total por categoria', classificacao_kids FROM produto 
		GROUP BY categoria HAVING classificacao_kids = 0;
        
-- 2.6 Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
    -- 2.6.1 Recuperando a informação dos clientes que pagaram em dinheiro
    SELECT c.cod_cliente, f_nome, valor_enviado FROM cliente c, pedido pe
		WHERE	c.cod_cliente = pe.cod_cliente
        AND		pagamento_dinheiro = 1;	
	-- 2.6.2 Recuperando a informação de quantos itens foram comprados no pedido
    SELECT * FROM pedido pe, itens_pedido ip
		WHERE pe.cod_pedido = ip.cod_pedido;
    SELECT pe.cod_pedido, cod_cliente, valor_enviado, cod_produto FROM pedido pe, itens_pedido ip
		WHERE pe.cod_pedido = ip.cod_pedido;
	-- 2.6.3 Melhorando a QUERRY anterior
	SELECT pe.cod_pedido, concat(f_nome, ' ',l_nome) AS 'Nome do Cliente', valor_enviado AS 'Valor total da nota', pr.nome_produto AS 'Produtos da nota' 
		FROM pedido pe, itens_pedido ip, cliente c, produto pr
			WHERE	pe.cod_pedido = ip.cod_pedido
			AND		pe.cod_cliente = c.cod_cliente
			AND		ip.cod_produto = pr.cod_produto
			ORDER BY cod_pedido;
        
    
    








