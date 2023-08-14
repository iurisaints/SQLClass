#Stored Procedures em MySQL

## Introdução às Stored Procedures

Uma Stored Procedure (Procedimento Armazenado) é um conjunto de instruções SQL predefinidas que podem ser executadas repetidamente com um único chamado. Elas são armazenadas no banco de dados e podem receber parâmetros de entrada e retornar valores de saída, tornando-as uma ferramenta poderosa para automatizar tarefas complexas.

## Vantagens das Stored Procedures

- **Reusabilidade:** As stored procedures podem ser chamadas de várias partes da aplicação.
- **Segurança:** Acesso direto às tabelas pode ser restrito, permitindo que as operações sejam controladas pelas stored procedures.
- **Performance:** Uma vez compiladas, as stored procedures podem ser mais eficientes do que comandos SQL ad hoc.

## Criando uma Stored Procedure

A sintaxe geral para criar uma Stored Procedure é a seguinte:

```sql
DELIMITER //
CREATE PROCEDURE nome_do_procedimento ([parâmetros])
BEGIN
    -- Corpo do procedimento com comandos SQL
END;
//
DELIMITER ;
```

## Exemplo de Stored Procedure

Suponha que queremos criar uma stored procedure que liste todos os produtos com preço acima de um determinado valor.

```sql
DELIMITER //
CREATE PROCEDURE ListarProdutosAcimaDeValor (IN valorDecimal DECIMAL(10, 2))
BEGIN
    SELECT nome, preco
    FROM Produtos
    WHERE preco > valorDecimal;
END;
//
DELIMITER ;
```

## Chamando uma Stored Procedure

Podemos chamar a stored procedure utilizando o seguinte comando:

```sql
CALL ListarProdutosAcimaDeValor(50.00);
```

## Considerações Finais

- Stored Procedures são conjuntos de instruções SQL predefinidas.
- Elas podem receber parâmetros de entrada e retornar valores de saída.
- São criadas usando a declaração `CREATE PROCEDURE`.
- Podem ser chamadas usando o comando `CALL`.

Stored Procedures são ferramentas valiosas para automatizar tarefas e melhorar a segurança e desempenho do banco de dados. No entanto, é importante usá-las de forma criteriosa, evitando a criação excessiva de procedimentos complexos que possam complicar a manutenção futura.
