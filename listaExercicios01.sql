CREATE DATABASE aula_db_exemplos;
USE aula_db_exemplos;

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(255) NOT NULL,
    receita DECIMAL(10, 2) NOT NULL
);

CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nascimento DATE
);

CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    curso VARCHAR(255) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);
USE aula_db_exemplos;

INSERT INTO autores (nome, nascimento) VALUES 
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('J.R.R. Tolkien', '1892-01-03'),
('Jane Austen', '1775-12-16'),
('Agatha Christie', '1890-09-15'),
('F. Scott Fitzgerald', '1896-09-24');


INSERT INTO livros (titulo, autor_id) VALUES
('Harry Potter e a Pedra Filosofal', 1),
('Harry Potter e a Câmara Secreta', 1),
('1984', 2),
('O Senhor dos Anéis', 3),
('Orgulho e Preconceito', 4),
('Morte no Nilo', 5),
('O Grande Gatsby', 6),
('O Misterioso Caso de Styles', 5),
('Razão e Sensibilidade', 4);


INSERT INTO alunos (nome) VALUES 
('João'),
('Maria'),
('Pedro'),
('Ana'),
('Beatriz'),
('Lucas'),
('Fernanda'),
('Eduardo'),
('Luisa'),
('Roberto');

INSERT INTO matriculas (aluno_id, curso) VALUES
(1, 'Engenharia de Software'),
(2, 'Medicina'),
(3, 'Engenharia de Software'),
(3, 'Arquitetura'),
(5, 'Física'),
(6, 'História'),
(7, 'Psicologia'),
(8, 'Engenharia Civil'),
(9, 'Artes'),
(10, 'Engenharia de Software'),
(10, 'Economia');

INSERT INTO vendas (produto, receita) VALUES 
('Produto A', 5000.00),
('Produto B', 15000.00),
('Produto C', 8000.00),
('Produto A', 6000.00),
('Produto B', 17000.00),
('Produto C', 3000.00),
('Produto D', 10000.00),
('Produto E', 6500.00),
('Produto F', 8500.00),
('Produto A', 7000.00),
('Produto B', 12000.00),
('Produto E', 4000.00),
('Produto C', 11000.00),
('Produto D', 5000.00);

-- exercício 1
select titulo from livros;

-- exercício 2
select NOME from autores
WHERE nascimento < '1900-01-01';

-- exercício 3
SELECT titulo 
from livros 
inner join autores on autor_id=autores.id
where NOME = 'J.K. Rowling';

-- exercício 4
select alunos.nome
from alunos 
join matriculas on alunos.id = matriculas.aluno_id
where matriculas.curso = 'Engenharia de Software';

-- exercício 5
SELECT produto, SUM(receita) as  receita_total
FROM vendas
GROUP BY produto;

-- exercício 6
select autores.nome, count(livros.id) as numero_de_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.id;

-- exercício 7
select curso, count(aluno_id) as numero_de_alunos
from matriculas
group by curso;

-- exercício 8
SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

-- exercício 9
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000;

-- exercício 10
SELECT autores.nome, COUNT(livros.id) AS numero_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id
HAVING COUNT(livros.id) > 2;

-- exercício 11
SELECT livros.titulo, autores.nome AS autor
FROM livros
JOIN autores ON livros.autor_id = autores.id;


-- exercício 12
SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- exercício 13
SELECT autores.nome, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;

-- exercício 14
SELECT matriculas.curso, alunos.nome
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;

-- exercício 15 
SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- exercício 16
SELECT autores.nome, COUNT(livros.id) AS numero_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id
ORDER BY numero_de_livros DESC
LIMIT 1;

-- exercício 17
SELECT produto, MIN(receita) AS menor_receita
FROM vendas
GROUP BY produto;

-- exercício 18 CANCELADO

-- exercício 19
SELECT alunos.nome, COUNT(matriculas.id) AS numero_de_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.id;

-- exercício 20
SELECT produto, COUNT() AS quantidade_de_vendas
FROM vendas
GROUP BY produto
ORDER BY quantidade_de_vendas DESC
LIMIT 1;

--commit DOZE esta escrito errado (cochilar)