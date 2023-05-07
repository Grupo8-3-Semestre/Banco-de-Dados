-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */

CREATE DATABASE vove;
USE vove;
DROP DATABASE vove;
CREATE TABLE arquivo(
	id int PRIMARY KEY AUTO_INCREMENT,
	nome_arquivo_original VARCHAR(255),
    nome_arquivo_salvo VARCHAR(255),
    dados VARBINARY(100),
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE usuario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(32),
    email VARCHAR(65),
    senha VARCHAR(255),
    data_nasc DATE,
    aceita_email BOOLEAN
);
CREATE TABLE comentario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(1000),
    momento_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_usuario INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario (id)
);
CREATE TABLE lista(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome_da_lista VARCHAR(100)
);
CREATE TABLE lista_tabela(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fk_usuario INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario (id),
    fk_lista INT,
    FOREIGN KEY (fk_lista) REFERENCES lista (id),
    tmdb_id_filme INT
);

SELECT * FROM arquivo;
SELECT * FROM usuario;
SELECT * FROM comentario;
SELECT * FROM lista;
SELECT * FROM lista_tabela;



/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(32),
    email VARCHAR(65),
    senha VARCHAR(255),
    data_nasc DATE,
    aceita_email BIT
);

CREATE TABLE arquivo (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome_arquivo_original VARCHAR(255),
    nome_arquivo_salvo VARCHAR(255),
    dados VARBINARY(100),
    data_upload DATETIME DEFAULT GETDATE()
); 

CREATE TABLE comentario (
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(1000),
    momento_comentario DATETIME DEFAULT GETDATE(),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);
CREATE TABLE lista (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome_da_lista VARCHAR(100)
); 
CREATE TABLE lista_tabela (
	id INT PRIMARY KEY IDENTITY(1,1),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id),
	fk_lista INT FOREIGN KEY REFERENCES lista(id),
    tmdb_id_filme INT
);



