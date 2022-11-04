

/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/

EXPLAIN SELECT data_venda, valor_total, produtos_vendidos, quantidade, valor_unitario, nome_cliente, cpf, telefone 
FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

SELECT data_venda, valor_total, produtos_vendidos, quantidade, valor_unitario, nome_cliente, cpf, telefone 
FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';
/*Criando uma view*/
CREATE VIEW relatorio_vendas AS
SELECT data_venda, valor_total, produtos_vendidos, quantidade, valor_unitario, nome_cliente, cpf, telefone 
FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

SELECT * FROM relatorio_vendas;



CREATE INDEX idx_produto ON produto(produtos_vendidos);
CREATE INDEX idx_NomeCliente on Cliente(nome_cliente);
CREATE INDEX idx_dataVenda ON venda(data_venda);
CREATE INDEX idx_cpf ON cliente(cpf);
CREATE INDEX idx_ValorUnitario ON item_venda(valor_unitario);
/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
EXPLAIN SELECT dados_produto, quantidade_vendida, data_venda 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

SELECT dados_produto, quantidade_vendida, data_venda 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
/*Criando uma view*/
CREATE VIEW vendas_produto_fabricante AS
SELECT dados_produto, quantidade_vendida, data_venda 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

SELECT * FROM vendas_produto_fabricante;

CREATE INDEX idx_DataVenda ON venda(data_venda);
CREATE INDEX idx_dadosProduto ON produto(dados_produto);
CREATE INDEX idx_QuantidadeVendida ON item_venda(quantidade_vendida);
 
/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade), nome_cliente, cpf, dados_produto
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

SELECT SUM(iv.subtotal), SUM(iv.quantidade), nome_cliente, cpf, dados_produto
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

/*Criando uma view*/
CREATE VIEW relatorio_vendas_cliente AS
SELECT SUM(iv.subtotal), SUM(iv.quantidade), nome_cliente, cpf, dados_produto
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

SELECT * FROM relatorio_vendas_cliente;


SHOW PROCESSLIST;


SHOW GLOBAL VARIABLES LIKE 'long%time';
SET GLOBAL slow_query_log = 'OFF';




