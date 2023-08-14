#SQL Procedural

## Introdução

SQL Procedural é uma extensão da linguagem SQL padrão que permite a criação de blocos de código que podem conter lógica de programação. Isso possibilita a criação de funções, procedimentos armazenados e triggers que executam operações mais complexas diretamente no banco de dados.

## Funções

As funções são blocos de código que retornam um valor único. Elas são muito úteis para realizar cálculos ou transformações em dados.

```sql
DELIMITER //
CREATE FUNCTION CalculaIdade(data_nascimento DATE)
RETURNS INT
BEGIN
    RETURN YEAR(CURRENT_DATE()) - YEAR(data_nascimento);
END;
//
DELIMITER ;
```

## Procedimentos Armazenados

Procedimentos armazenados são blocos de código que podem executar várias instruções SQL. Eles são úteis para automatizar tarefas complexas.

```sql
DELIMITER //
CREATE PROCEDURE AtualizaSalario(IN id_funcionario INT, IN novo_salario DECIMAL(10, 2))
BEGIN
    UPDATE Funcionarios
    SET salario = novo_salario
    WHERE id = id_funcionario;
END;
//
DELIMITER ;
```

## Variáveis e Estruturas de Controle

É possível declarar variáveis e utilizar estruturas de controle como IF-ELSE e WHILE em procedimentos armazenados.

```sql
DELIMITER //
CREATE PROCEDURE AumentaSalarioTodos(IN aumento DECIMAL(10, 2))
BEGIN
    DECLARE id INT;
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT id FROM Funcionarios;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        UPDATE Funcionarios
        SET salario = salario + aumento
        WHERE id = id;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;
```

## Triggers com SQL Procedural

Além das ações básicas de triggers, também podemos usar SQL Procedural para personalizar a lógica executada em um trigger.

```sql
DELIMITER //
CREATE TRIGGER AtualizaContadorCompras
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
    UPDATE Jogadores
    SET total_compras = total_compras + 1
    WHERE id_jogador = NEW.id_jogador;
END;
//
DELIMITER ;
```

## Conclusão

O SQL Procedural expande as capacidades do SQL padrão, permitindo a criação de funções, procedimentos armazenados e triggers mais complexos e personalizados. Isso torna o SQL uma linguagem mais versátil para implementar lógica de programação diretamente no banco de dados. No entanto, é importante lembrar de considerar o desempenho e a manutenibilidade ao criar procedimentos complexos.
