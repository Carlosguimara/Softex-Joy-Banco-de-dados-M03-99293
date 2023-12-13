/*** Se o Banco existir será deletado antes de iniciar os testes ***/
DROP DATABASE Biblioteca;

/*** Criar e habilitar para uso o Banco Biblioteca ***/
CREATE DATABASE Biblioteca;
USE Biblioteca;

/*** Criar a Tabela Autores ***/
CREATE TABLE Autores (
	autorID int primary key auto_increment,
    nome varchar(60),
    nacionalidade varchar(10)
    );

/*** Inserir dados na tabela Autores ***/
INSERT INTO Autores (nome, nacionalidade) VALUES 
('Autor 1', 'Brasil    '),
('Autor 2', 'Argentina '),
('Autor 3', 'França    '),
('Autor 4', 'Itália    ');


/*** Criar a Tabela Livros ***/
CREATE TABLE Livros (
	livroID int primary key auto_increment,
    titulo varchar(60),
    anoPubl INT(4) not null,
    autorid int,
    foreign key(autorID) references Autores(autorID)
    );

/*** Inserir dados na tabela Livros ***/
INSERT INTO Livros (titulo, anoPubl, autorID) VALUES 
('Livro 11', 1911, 1 ),
('Livro 12', 1912, 1 ),
('Livro 13', 1913, 1 ),
('Livro 14', 1914, 1 ),
('Livro 15', 1915, 1 ),
('Livro 31', 1931, 3 ),
('Livro 32', 1932, 3 ),
('Livro 33', 1933, 3 ),
('Livro 34', 1934, 3 ),
('Livro 35', 1935, 3 ),
('Livro 41', 1941, 4 ),
('Livro 42', 1942, 4 ),
('Livro 43', 1943, 4 ),
('Livro 44', 1944, 4 ),
('Livro 45', 1945, 4 );

/*** Consulta Simples de Autores e Livros Associados ***/
/*** Resultado - Visão de uma tabela com os Autores e seus respectivos livros
				 caso tenha escrito ***/
SELECT Autores.nome as 'Autor', Livros.titulo as 'Livro' from Autores join Livros 
	on Autores.autorID = Livros.autorID;

/*** Consulta com INNER JOIN para listar Autores e Livros Associados (se existirem) ***/
/*** Resultado - Visão de uma tabela com os registros referenciados entre as tabelas  
                 Livros e Autores (interseção) ***/
SELECT Autores.nome as 'Autor', Autores.nacionalidade as 'País', Livros.titulo as 'Livro', 
	Livros.anoPubl as 'Ano' from Autores inner join Livros on Autores.autorID = Livros.autorID;

/*** Consulta com LEFT JOIN para listar Autores e Livros (com e sem associação) ***/
/*** Resultado: Todos os Autores serão listados com seus respectivos livros, caso não tenha, 
				será listado com null no campo titulo ***/
SELECT Autores.nome as 'Autor' , Livros.titulo as 'Livro' , Livros.anoPubl as 'Ano' 
	from Autores left join Livros on Autores.autorID = Livros.autorID;

/*** Consulta por filtro de Nacionalidade ***/
/*** Resultado: Irá listar uma tabela com apenas os livros de autores e seus respectivos livros,
				de determinada nacionalidade selecionada ***/
SELECT Autores.nome as 'Autor', Autores.nacionalidade as 'País', Livros.titulo as 'Livro',
 Livros.anoPubl as 'Ano' from Autores join Livros on Autores.autorID = Livros.autorID 
 where Autores.nacionalidade='Brasil    '; 

/*** Consultar quantos livros cada autor escreveu ***/
/*** Resultado: Visão de uma tabela com o nome dos autores e a quantidade de livros a ele 
                associados na tabela Livros ***/
SELECT Autores.nome as 'Autor', COUNT(Livros.livroID) as 'Obras' from Autores 
	left join Livros on Autores.autorID = Livros.autorID GROUP BY Autores.nome;