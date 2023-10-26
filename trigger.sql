CREATE DATABASE exercicios_trigger;
USE exercicios_trigger;

-- Criação das tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);
 -- exercicio 1
CREATE TRIGGER date_hour AFTER INSERT ON Clientes FOR EACH ROW
INSERT INTO Auditoria (mensagem)
VALUES ('data e hora de cadastro');

insert into Clientes (nome)
VALUE("Osvaldo");

insert into Clientes (nome)
VALUE("Lucas");

insert into Clientes (nome)
VALUE("ROBERTO");

select * from Clientes;
select * from Auditoria;

-- exercicio 2

DROP TRIGGER aviso_exclusao;

CREATE TRIGGER aviso_exclusao BEFORE DELETE ON Clientes FOR EACH ROW
INSERT INTO Auditoria (mensagem)
VALUES ('cliente excluido');


DELETE FROM Clientes WHERE id = 3;

CREATE TRIGGER nome_antigo BEFORE UPDATE ON Clientes FOR EACH ROW
INSERT INTO Auditoria (mensagem)
VALUES ("nome antigo:", OLD.nome,"nome antigo:", NEW.nome );

UPDATE Clientes SET nome = "Wesley" WHERE nome = "ROBERTO";