/*1)*/
CREATE DATABASE Campeonato_ProfessorIuri

USE Campeonato_ProfessorIuri

/*2)*/

CREATE TABLE Times (
	id_times INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	cidade VARCHAR(100),
	estado VARCHAR(50),
	pais VARCHAR(50),
	data_fundacao DATE,
	tecnico VARCHAR(50)
);

-- INSERT TABELA TIMES:
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Flamengo', 'Rio de Janeiro', 'RJ', 'Brasil', '1895-11-15', 'Jorge Jesus');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Palmeiras', 'São Paulo', 'SP', 'Brasil', '1914-08-26', 'Vanderlei Luxemburgo');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Grêmio', 'Porto Alegre', 'RS', 'Brasil', '1903-09-15', 'Renato Gaúcho');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Santos', 'Santos', 'SP', 'Brasil', '1912-04-14', 'Cuca');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Corinthians', 'São Paulo', 'SP', 'Brasil', '1910-09-01', 'Tiago Nunes');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Internacional', 'Porto Alegre', 'RS', 'Brasil', '1909-04-04', 'Eduardo Coudet');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Fluminense', 'Rio de Janeiro', 'RJ', 'Brasil', '1902-07-21', 'Odair Hellmann');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Atlético Mineiro', 'Belo Horizonte', 'MG', 'Brasil', '1908-03-25', 'Jorge Sampaoli');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Vasco da Gama', 'Rio de Janeiro', 'RJ', 'Brasil', '1898-08-21', 'Ramon Menezes');
INSERT INTO Times (nome, cidade, estado, pais, data_fundacao, tecnico) VALUES ('Botafogo', 'Rio de Janeiro', 'RJ', 'Brasil', '1904-07-01', 'Bruno Lazaroni');

CREATE TABLE Jogadores (
	id_jogador INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	posicao VARCHAR(50),
	idade INT,
	altura DECIMAL(4,2),
	peso DECIMAL(5,2),
	numero_camisa INT,
	id_times INT,
	FOREIGN KEY (id_times) REFERENCES Times(id_times)
);

-- INSERT INTO NA TABELA JOGADORES:
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Neymar', 'Atacante', 29, 1.75, 68.5, 10, 1);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Messi', 'Meio-campista', 33, 1.70, 72.3, 10, 2);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Cristiano Ronaldo', 'Atacante', 35, 1.87, 83.2, 7, 3);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Mbappé', 'Atacante', 22, 1.78, 73.9, 7, 4);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('De Bruyne', 'Meio-campista', 29, 1.81, 70.6, 17, 5);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Sergio Ramos', 'Defensor', 34, 1.84, 81.7, 4, 6);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('NGolo Kanté', 'Meio-campista', 30, 1.68, 68.9, 7, 7);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Robert Lewandowski', 'Atacante', 32, 1.84, 79.6, 9, 8);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Virgil van Dijk', 'Defensor', 29, 1.93, 92.1, 4, 9);
INSERT INTO Jogadores (nome, posicao, idade, altura, peso, numero_camisa, id_times) VALUES ('Kevin De Bruyne', 'Meio-campista', 30, 1.81, 70.6, 17, 10);

CREATE TABLE Jogos (
	id_jogos INT PRIMARY KEY AUTO_INCREMENT,
	data_jogos DATE,
	hora TIME,
	local_jogos VARCHAR(100),
	id_times INT,
	adversario VARCHAR(50),
	resultado VARCHAR(100),
	FOREIGN KEY (id_times) REFERENCES Times(id_times)
);

-- INSERT INTO NA TABELA JOGOS:
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-01', '15:00:00', 'Estádio A', 1, 'Time B', 'Vitória por 2-0');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-05', '19:30:00', 'Estádio C', 2, 'Time D', 'Derrota por 1-3');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-10', '14:00:00', 'Estádio B', 3, 'Time E', 'Empate por 0-0');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-15', '20:15:00', 'Estádio D', 4, 'Time F', 'Vitória por 3-1');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-20', '18:45:00', 'Estádio A', 5, 'Time G', 'Derrota por 0-2');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-25', '16:30:00', 'Estádio C', 6, 'Time H', 'Vitória por 1-0');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-01-30', '17:00:00', 'Estádio B', 7, 'Time I', 'Derrota por 1-2');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-02-05', '19:45:00', 'Estádio D', 8, 'Time J', 'Empate por 2-2');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-02-10', '20:30:00', 'Estádio A', 9, 'Time K', 'Vitória por 2-1');
INSERT INTO Jogos (data_jogos, hora, local_jogos, id_times, adversario, resultado) VALUES ('2021-02-15', '15:15:00', 'Estádio C', 10, 'Time L', 'Derrota por 0-3');

CREATE TABLE Estatisticas(
	id_estatisticas INT PRIMARY KEY AUTO_INCREMENT,
	id_jogador INT,
	gols INT,
	assistencias INT,
	yellowcard INT,
	redcard INT,
	id_jogos INT,
	FOREIGN KEY (id_jogador) REFERENCES Jogadores(id_jogador),
	FOREIGN KEY (id_jogos) REFERENCES Jogos(id_jogos)
)

-- INSERT TABELA ESTATISTICAS
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (1, 5, 2, 0, 0, 1);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (2, 3, 1, 1, 0, 1);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (3, 1, 4, 0, 0, 2);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (4, 0, 0, 2, 1, 2);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (5, 2, 1, 0, 0, 3);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (6, 1, 0, 1, 0, 3);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (7, 0, 3, 0, 0, 4);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (8, 4, 2, 0, 0, 4);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (9, 2, 1, 1, 0, 5);
INSERT INTO Estatisticas (id_jogador, gols, assistencias, yellowcard, redcard, id_jogos) VALUES (10, 0, 0, 0, 1, 5);

-- 3)Qual é a lista completa de jogadores que fazem parte do time de futsal?

SELECT * FROM jogadores WHERE id_times = 2;

-- 4)Quantas partidas o time já jogou nesta temporada?

SELECT COUNT(*) AS QuantidadeJogos FROM jogos WHERE id_times = 2;

-- 5) Qual foi o resultado da última partida disputada pelo time?

SELECT resultado FROM jogos WHERE id_times = 1 ORDER BY data_jogos DESC LIMIT 1;

-- 6) Quais jogadores têm mais gols marcados na temporada?

SELECT j.nome, e.gols
FROM jogadores AS j
INNER JOIN estatisticas AS e ON j.id_jogador = e.id_jogador
WHERE e.gols > 0
ORDER BY e.gols DESC;

-- 7) Qual é a média de gols por partida do time até agora?

SELECT AVG(e.gols) AS MediaGols
FROM jogos AS j
INNER JOIN estatisticas AS e ON e.id_jogos = j.id_jogos
WHERE j.id_times = 1

-- 8) Quem são os jogadores que têm mais cartões amarelos acumulados?

SELECT j.nome, e.yellowcard
FROM jogadores AS j
INNER JOIN estatisticas AS e ON e.id_jogador = j.id_jogador
ORDER BY e.yellowcard DESC;

-- 9) Em que partidas o jogador X marcou gols nesta temporada?

SELECT j.id_jogos, j.resultado
FROM jogos AS j
INNER JOIN estatisticas AS e ON e.id_jogos = j.id_jogos
WHERE e.id_jogador = 5 AND e.gols > 0;

-- 11) Quantas faltas foram cometidas pelo time até agora na temporada?

SELECT SUM(faltas) AS TotalFaltas
FROM jogos 
WHERE id_times = 1;

/* 12) Quais são as informações dos jogadores que jogaram em cada partida e em
qual time eles estavam?*/

SELECT jg.id_jogos AS NumeroJogo, jg.local_jogos AS LocalDoJogo, j.nome AS NomeJogador, j.posicao AS Posição
FROM jogos AS jg
INNER JOIN jogadores AS j ON j.id_times = jg.id_times
WHERE jg.id_jogos = 1

/*13) Quais são as partidas em que um determinado jogador jogou e qual foi o
resultado da partida?*/

SELECT jogos.id_jogos, jogos.resultado
FROM jogos
INNER JOIN jogadores ON jogadores.id_times = jogos.id_times
WHERE jogadores.id_jogador = 1;

/*15) Quais são as informações dos jogadores que têm mais de 10 gols na
temporada atual?*/

SELECT jg.id_jogos AS NumeroJogo, jg.local_jogos AS LocalDoJogo, j.nome AS NomeJogador, j.posicao AS Posição
FROM jogos AS jg
INNER JOIN jogadores AS j ON j.id_times = jg.id_times
INNER JOIN estatisticas AS e ON e.id_jogos = jg.id_jogos
WHERE jg.id_jogos = 2 AND e.gols >= 10
