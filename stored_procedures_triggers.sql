/* Crie um stored procedure que receba id de cliente, data inicial e data final e que mostre a lista de compras realizadas pelo referido cliente entre as datas informadas (incluindo essas datas), mostrando nome do cliente, id da compra, total, 
nome e quantidade de cada produto comprado. No script, inclua o código de criação e uma chamada ao procedure. */
DELIMITER //

SET @data_inicial = null;
set @data_final = null;

CREATE PROCEDURE cliente_info(id INT, @data_inicial DATE, @data_final DATE)
BEGIN
 
   
   Select nome_produto, nome, id_compra, total, nome_produto, quantidade_produto from cliente, produto, venda Where 
   between @data_inicial And @data_final order by venda;
   
END
//
DELIMITER ;
call cliente_info(1, '2019-02-20', '2019-02-25');

/*Crie uma stored function que receba id de funcionário, data inicial e data final e retorne a comissão total 
desse funcionário no período indicado. No script, inclua o código de criação e uma chamada à function.*/
DELIMITER //
SET @data_admissao = null;
SET @data_demissao = null;
CREATE FUNCTION funcionario_info(id int, @data_admissao DATE, @data_demissao DATE) returns INT, DATE DETERMINISTIC
BEGIN

   Select comissao from cargo Where  
   between @data_inicial And @data_final order by comissao;
   
   RETURN comissao;
END
//
DELIMITER ;
SELECT funcionario_info(1, '2019-02-20', '2020-12-22');

/*Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”. Um cliente é “PREMIUM” se já 
realizou mais de R$ 10 mil em compras nos últimos dois anos. Um cliente é “REGULAR” se ao contrário. 
No script, inclua o código de criação e uma chamada à function.*/
DELIMITER //
CREATE FUNCTION cliente_status (id_cliente int) RETURNS INT DETERMINISTIC
BEGIN
	SELECT id FROM cliente WHERE id = id_cliente;
    SELECT * FROM venda WHERE data  BETWEEN '13-09-2020' AND CURRENT_DATE:
    
    IF valor_total FROM venda >= 10000 THEN
		SELECT 'Cliente Premium';
	else
		SELECT 'Cliente Regular';
	end if;
    
END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER novo_usuario AFTER INSERT
ON usuarios
FOR EACH ROW
BEGIN
    UPDATE usuario
    SET senha = 'MD5()'
    WHERE id = NEW.id_usuario;
END//
DELIMITER ;
            