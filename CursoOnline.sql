--criando um banco -
CREATE DATABASE CursoOnline;
GO

--utilizando o banco 
USE CursoOnline;

--criando tabela "curso" 
CREATE TABLE Curso(
CursoID INT PRIMARY KEY IDENTITY, 
Nome VARCHAR(70) NOT NULL,
CargaHoraria INT NOT NULL
);
GO

--criando tabela "instrutor"
CREATE TABLE Instrutor(
InstrutorID INT PRIMARY KEY IDENTITY, 
Nome VARCHAR(60) NOT NULL, 
Especializacao VARCHAR(70) NOT NULL
);
GO

--criando tabela "aluno"
CREATE TABLE Aluno(
AlunoID INT PRIMARY KEY IDENTITY, 
Nome VARCHAR(60),
Email VARCHAR(150)
);
GO

--criando tabela "matricula"
CREATE TABLE Matricula(
CursoID INT NOT NULL, 
AlunoID INT NOT NUll, 

CONSTRAINT PK_MatriculaID PRIMARY KEY(CursoID, AlunoID),

CONSTRAINT FK_MatriculaID_Curso FOREIGN KEY(CursoID)
REFERENCES Curso(CursoID) ON DELETE CASCADE,
CONSTRAINT FK_MatriculaID_Aluno FOREIGN KEY(AlunoID)
REFERENCES Aluno(AlunoID) ON DELETE CASCADE
);
GO 

--inserindo valores na tabela curso  
INSERT INTO Curso(Nome,CargaHoraria)
VALUES
('Introdução à Informática', 20),
('Pacote Office (Word, Excel, PowerPoint', 40),
('Desenvolvimento Web (HTML, CSS, JS)', 80),
('Lógica de Programação', 40),
('Banco de Dados SQL', 50),
('Excel Avançado', 30)
GO

--inserindo valores na tabela instrutor
INSERT INTO Instrutor(Nome,Especializacao)
VALUES 
('Carlos Silva','Introdução à Informática'),
('Mariana Costa', 'Pacote Office'),
('Bruno Nascimento', 'UX/UI, Front-End e Back-End'),
('Fernanda Souza', 'Lógica de Programação'),
('Eduardo Rodrigues', 'Banco de Dados SQL')
GO

--inserindo valores na tabela aluno
INSERT INTO Aluno(Nome,Email)
VALUES 
('Renata Azevedo', 'renata.azevedo@email.com'),
('Beatriz Ribeiro', 'beatriz.ribeiro@email.com'),
('Rafael Lima', 'rafael.lima@email.com'),
('Pedro Santos', 'pedro.santos@email.com'),
('Larissa Martins', 'larissa.martins@email.com'),
('Diego Barbosa', 'diego.barbosa@email.com'),
('Felipe Rodrigues', 'felipe.rodrigues@email.com'),
('Camila Ferreira', 'camila.ferreira@email.com')
GO

INSERT INTO Matricula(AlunoID, CursoID)
VALUES

--conferindo as tabelas 
SELECT * FROM Curso;
SELECT * FROM Instrutor
SELECT * FROM Aluno; 