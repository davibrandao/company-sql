

CREATE ROLE 'mydb_relatorio', 'mydb_funcionario';

GRANT SELECT ON mydb.* TO 'mydb_relatorio';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.vendas TO 'mydb_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.produto TO 'mydb_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.cliente TO 'mydb_funcionario';
CREATE USER 'relatorio'@'localhost';
CREATE USER 'funcionario'@'localhost';

GRANT 'mydb_relatorio' TO 'relatorio'@'localhost';
GRANT 'mydb_funcionario' TO 'funcionario'@'localhost';

INSERT INTO usuarios (usuario, senha) VALUES ('Usuário SHA-1', sha1('SenacEAD_permissoes'));





FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

SHOW GRANTS FOR 'relatorio'@'localhost';

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'qwerty';

GRANT SELECT ON mydb.* TO 'relatorio'@'localhost';

