CREATE DATABASE senac;
use senac;

-- Tabela principal
CREATE TABLE midia (
    idMidia INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    classIndicativa VARCHAR(50) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    qtdEstoque INT NOT NULL,
	capa VARCHAR(255) NOT NULL,
    tipo ENUM('Jogo', 'Filme', 'Album'),
    UNIQUE (idMidia, tipo) -- Garante que o ID é único em conjunto com o tipo
);

-- Tabela para jogos
CREATE TABLE jogo (
    idJogo INT PRIMARY KEY,
    isOnline BOOLEAN NOT NULL,
    FOREIGN KEY (idJogo) REFERENCES midia(idMidia)
);

-- Tabela para filmes
CREATE TABLE filme (
    idFilme INT PRIMARY KEY,
	diretor VARCHAR(50) NOT NULL,
    duracao TIME NOT NULL,
    elenco TEXT NOT NULL,
    FOREIGN KEY (idFilme) REFERENCES midia(idMidia)
);

-- Tabela para álbuns
CREATE TABLE album (
    idAlbum INT PRIMARY KEY,
	anoLancamento INT NOT NULL,
    artista VARCHAR(100),
	musica TEXT NOT NULL,
    FOREIGN KEY (idAlbum) REFERENCES midia(idMidia)
);

CREATE TABLE usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
cpf VARCHAR(15) NOT NULL,
	email VARCHAR(100) NOT NULL,
    	senha VARCHAR(20) NOT NULL,
    tipo ENUM('Vendedor', 'Cliente'),
    UNIQUE (idUsuario, tipo) -- Garante que o ID é único em conjunto com o tipo
);

CREATE TABLE vendedor (
    idVendedor INT PRIMARY KEY,
    FOREIGN KEY (idVendedor) REFERENCES usuario(idUsuario)
);

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY,
    FOREIGN KEY (idCliente) REFERENCES usuario(idUsuario)
);


-- Inserindo um registro de jogo
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo) VALUES ('The Witcher 3', 70, "16 Anos", "RPG", 4, "https://upload.wikimedia.org/wikipedia/pt/thumb/0/06/TW3_Wild_Hunt.png/270px-TW3_Wild_Hunt.png", 'Jogo');
SET @last_id = LAST_INSERT_ID();
INSERT INTO jogo (idJogo, isOnline) VALUES (@last_id, true);

-- Inserindo um registro de jogo
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo) VALUES ('GTA VI', 5, "18 Anos", "Ação", 1, "https://upload.wikimedia.org/wikipedia/pt/thumb/9/91/GTAVIlogo.png/270px-GTAVIlogo.png", 'Jogo');
SET @last_id = LAST_INSERT_ID();
INSERT INTO jogo (idJogo, isOnline) VALUES (@last_id, true);

-- Inserindo um registro de jogo
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo) VALUES ('Death Stranding', 50, "18 Anos", "Ação", 4, "https://upload.wikimedia.org/wikipedia/pt/thumb/e/eb/Death-Stranding-poster.jpg/270px-Death-Stranding-poster.jpg", 'Jogo');
SET @last_id = LAST_INSERT_ID();
INSERT INTO jogo (idJogo, isOnline) VALUES (@last_id, true);




-- Inserindo um registro de filme
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('Scooby Doo', 2, 'Livre', 'Comédia', 2, 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/19/01/19872929.jpg', 'Filme');

SET @last_id = LAST_INSERT_ID();

INSERT INTO filme (idFilme, diretor, duracao, elenco)
VALUES (@last_id, 'Raja Gosnell', '01:27:00', 'Matthew Lillard, Freddie Prinze Jr., Sarah Michelle Gellar');

-- Inserindo um registro de filme
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('Batman - O Cavaleiro das Trevas', 20, '16 Anos', 'Ação', 1, 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/86/98/32/19870786.jpg', 'Filme');

SET @last_id = LAST_INSERT_ID();

INSERT INTO filme (idFilme, diretor, duracao, elenco)
VALUES (@last_id, 'Christopher Nolan', '02:32:00', 'Christian Bale, Heath Ledger, Aaron Eckhart');


-- Inserindo um registro de filme
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('Minecraft', 4, 'Livre', 'Aventura', 10, 'https://br.web.img3.acsta.net/c_310_420/pictures/16/06/28/17/38/324712.jpg', 'Filme');

SET @last_id = LAST_INSERT_ID();

INSERT INTO filme (idFilme, diretor, duracao, elenco)
VALUES (@last_id, 'Jared Hess', '01:32:00', 'Jason Momoa, Danielle Brooks, Jack Black');




-- Inserindo um registro de álbum
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('...And Justice for All', 75, '16 Anos', 'Metal', 5, 'https://upload.wikimedia.org/wikipedia/pt/thumb/3/34/...And_Justice_for_All.jpg/220px-...And_Justice_for_All.jpg', 'Album');

SET @last_id = LAST_INSERT_ID();

INSERT INTO album (idAlbum, anoLancamento, artista, musica)
VALUES (@last_id, 1988, 'Metallica', 'Blackened, One, ...And Justice For All');

-- Inserindo um registro de álbum
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('Currents', 20, 'Livre', 'Indie', 1, 'https://upload.wikimedia.org/wikipedia/pt/2/2d/Currents_Tame_Impala.png', 'Album');

SET @last_id = LAST_INSERT_ID();

INSERT INTO album (idAlbum, anoLancamento, artista, musica)
VALUES (@last_id, 2015, 'Tame Impala', 'The Less I Know The Better, New Person, Same Old Mistakes, Disciples');


-- Inserindo um registro de álbum
INSERT INTO midia (nome, preco, classIndicativa, genero, qtdEstoque, capa, tipo)
VALUES ('Ramones', 35, 'Livre', 'Rock', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Ramones_rocket_to_russia_photo.jpg/250px-Ramones_rocket_to_russia_photo.jpg', 'Album');

SET @last_id = LAST_INSERT_ID();

INSERT INTO album (idAlbum, anoLancamento, artista, musica)
VALUES (@last_id, 1976, 'Ramones', 'Blitzkrieg Bop, Judy is a Punk, Chain Saw');





