#QL Procedural com Estruturas de Controle

## Introdução

SQL Procedural é uma extensão da linguagem SQL padrão que permite a criação de blocos de código que podem conter lógica de programação. Além das operações básicas de consulta e manipulação de dados, o SQL Procedural permite a utilização de estruturas de controle, como condicionais e loops, para realizar operações mais complexas.

## IF-ELSE

A estrutura IF-ELSE permite executar um bloco de código condicionalmente, dependendo de uma condição.

```sql
DELIMITER //
CREATE PROCEDURE VerificaIdade(IN id_jogador INT)
BEGIN
    DECLARE idade INT;
    SELECT idade INTO idade FROM Jogadores WHERE id = id_jogador;
    
    IF idade >= 18 THEN
        SELECT 'Pode jogar jogos para adultos';
    ELSE
        SELECT 'Não pode jogar jogos para adultos';
    END IF;
END;
//
DELIMITER ;
```

## LOOP

A estrutura LOOP permite criar um loop que executa um bloco de código repetidamente até que uma condição seja atendida.

```sql
DELIMITER //
CREATE PROCEDURE ExibeNumerosAte10()
BEGIN
    DECLARE contador INT DEFAULT 1;
    
    loop_label: LOOP
        SELECT contador;
        SET contador = contador + 1;
        IF contador > 10 THEN
            LEAVE loop_label;
        END IF;
    END LOOP;
END;
//
DELIMITER ;
```

## WHILE

O WHILE é uma estrutura de loop que executa um bloco de código enquanto uma condição for verdadeira.

```sql
DELIMITER //
CREATE PROCEDURE CalculaFatorial(IN numero INT)
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE resultado INT DEFAULT 1;
    
    WHILE contador <= numero DO
        SET resultado = resultado * contador;
        SET contador = contador + 1;
    END WHILE;
    
    SELECT resultado;
END;
//
DELIMITER ;
```

## CASE

A estrutura CASE é usada para realizar avaliações condicionais em SQL.

```sql
DELIMITER //
CREATE PROCEDURE ClassificaJogador(IN id_jogador INT)
BEGIN
    DECLARE pontos INT;
    SELECT pontos INTO pontos FROM Jogadores WHERE id = id_jogador;
    
    CASE
        WHEN pontos >= 100 THEN
            SELECT 'Nível Avançado';
        WHEN pontos >= 50 THEN
            SELECT 'Nível Intermediário';
        ELSE
            SELECT 'Nível Iniciante';
    END CASE;
END;
//
DELIMITER ;
```

## Conclusão

O SQL Procedural com estruturas de controle expande as possibilidades da linguagem SQL, permitindo a criação de procedimentos mais sofisticados e flexíveis. O uso de IF-ELSE, LOOP, WHILE e CASE possibilita a execução de lógicas condicionais e repetitivas diretamente no banco de dados, tornando o SQL uma linguagem mais poderosa para lidar com operações complexas.
