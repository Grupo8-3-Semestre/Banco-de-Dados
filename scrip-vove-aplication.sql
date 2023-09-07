-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */

CREATE DATABASE vove;
USE vove;
-- DROP DATABASE vove;
CREATE TABLE arquivo(
	id int PRIMARY KEY AUTO_INCREMENT,
	nome_arquivo_original VARCHAR(255),
    nome_arquivo_salvo VARCHAR(255),
    dados VARBINARY(100),
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aceita_email BOOLEAN,
    aparelho_utilizado VARCHAR(255),
    assina_streaming BOOLEAN,
    busca_avaliacao BOOLEAN,
    cep VARCHAR(10),
    data_nasc DATE,
    email VARCHAR(65),
    genero_preferido VARCHAR(255),
    logado BOOLEAN,
    nome VARCHAR(32),
    qtd_frequencia INT,
    senha VARCHAR(255),
    sexo VARCHAR(100)
);



CREATE TABLE comentario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(1000),
    momento_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tmdb_id_filme INT,
    spoiler BOOLEAN,
    avaliacao INT,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);
CREATE TABLE lista(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome_da_lista VARCHAR(100),
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);
CREATE TABLE lista_tabela(
	id INT PRIMARY KEY AUTO_INCREMENT,
	usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    lista_filme_id INT,
    FOREIGN KEY (lista_filme_id) REFERENCES lista (id),
    tmdb_id_filme INT
);
CREATE TABLE votacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    avaliacao INT,
    tmdb_id_filme INT,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
    );

SELECT * FROM arquivo;
SELECT * FROM usuario;
SELECT * FROM comentario;
SELECT * FROM lista;
SELECT * FROM lista_tabela;
SELECT * FROM votacao;


-- Inserção de dados na tabela "usuario"
INSERT INTO usuario (aceita_email, aparelho_utilizado, assina_streaming, busca_avaliacao, cep, data_nasc, email, genero_preferido, logado, nome, qtd_frequencia, senha, sexo)
VALUES
 (TRUE, 'Celular', TRUE, FALSE, '12345', '2000-01-01', 'john.doe@gmail.com', 'Ação', FALSE, 'John Doe', 10, '$2a$10$PU4XokmGPNejARzCnblVD.dWzdX3eCvb5pY6.5qh4YYqSNvirQKsq', 'Masculino'),
 (FALSE, 'Celular', TRUE, FALSE, '12345', '2000-01-01', 'luiz@vove.com', 'rock', FALSE, 'Luize', 10, '$2a$10$PU4XokmGPNejARzCnblVD.dWzdX3eCvb5pY6.5qh4YYqSNvirQKsq', 'Masculino'),
 (TRUE, 'Tablet', FALSE, TRUE, '54321', '1995-07-15', 'ana@gmail.com', 'Comédia', FALSE, 'Ana Silva', 10, '$2a$10$PU4XokmGPNejARzCnblVD.dWzdX3eCvb5pY6.5qh4YYqSNvirQKsq', 'Feminino'),
 (FALSE, 'Computador', FALSE, FALSE, '98765', '1988-03-10', 'carlos@gmail.com', 'Ação', FALSE, 'Carlos Santos', 10, '$2a$10$PU4XokmGPNejARzCnblVD.dWzdX3eCvb5pY6.5qh4YYqSNvirQKsq', 'Masculino');

-- Inserção de dados na tabela "comentario"
INSERT INTO comentario (descricao, momento_comentario, tmdb_id_filme, usuario_id, spoiler, avaliacao)
VALUES
    ('Ótimo filme! Recomendo a todos.', '2023-08-27 15:30:00', 569094, 2, FALSE, 4),
    ('O filme teve alguns momentos interessantes, mas o final me deixou um pouco decepcionado.', '2023-08-27 16:45:00', 667538, 2, FALSE, 3),
    ('Sem palavras, esse filme é simplesmente incrível e ele morre e é uma boneca!', '2023-08-27 18:20:00', 346698, 3, TRUE, 5);


-- Inserção de dados na tabela "lista"
INSERT INTO lista (nome_da_lista, usuario_id)
VALUES
    ('Favoritos', 1),
    ('Assistir Mais Tarde', 1),
    ('Comédias Favoritas', 3),
    ('Ação e Aventura', 4),
    ('Lista A', 2),
    ('Lista B', 2),
    ('Romances Queridos', 3),
    ('Suspense e Mistério', 3);

-- Inserção de dados na tabela "lista_tabela"
INSERT INTO lista_tabela (tmdb_id_filme, lista_filme_id, usuario_id)
VALUES
    (346698, 5, 2),
    (872585, 5, 2);

-- Inserção de dados na tabela "votacao"
INSERT INTO votacao (avaliacao, tmdb_id_filme, usuario_id)
VALUES
    (5, 346698, 2),
    (4, 346698, 3);


SELECT * FROM arquivo;
SELECT * FROM usuario;
SELECT * FROM comentario;
SELECT * FROM lista;
SELECT * FROM lista_tabela;
SELECT * FROM votacao;









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
	usuario_id INT FOREIGN KEY REFERENCES usuario(id)
);
CREATE TABLE lista (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome_da_lista VARCHAR(100)
); 
CREATE TABLE lista_tabela (
	id INT PRIMARY KEY IDENTITY(1,1),
	usuario_id INT FOREIGN KEY REFERENCES usuario(id),
	lista_filme_id INT FOREIGN KEY REFERENCES lista(id),
    tmdb_id_filme INT
);

CREATE TABLE votacao (
	id INT PRIMARY KEY IDENTITY(1,1),
    avaliacao INT,
    usuario_id INT FOREIGN KEY REFERENCES usuario(id),
    tmdb_id_filme INT);



