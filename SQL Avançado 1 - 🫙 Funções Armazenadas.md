# Stored Functions em MySQL

## Introdução às Stored Functions

Uma Stored Function (Função Armazenada) é um bloco de código SQL que pode receber parâmetros, executar operações e retornar um valor. Ela é armazenada no banco de dados e pode ser chamada em consultas SQL como uma função regular. Isso permite encapsular lógica de negócios em operações reutilizáveis.

## Vantagens das Stored Functions

- **Reusabilidade:** Você pode usar a mesma lógica em várias consultas sem repetição.
- **Segurança:** Ajuda a restringir o acesso direto às tabelas, pois as funções atuam como uma camada intermediária.
- **Organização:** Mantém a lógica de negócios centralizada e gerenciável no banco de dados.
- **Desempenho:** As funções podem ser otimizadas pelo sistema de gerenciamento de banco de dados.

## Criando uma Stored Function

A sintaxe geral para criar uma Stored Function é a seguinte:

```sql
CREATE FUNCTION nome_da_funcao ([parâmetros])
RETURNS tipo_de_retorno
BEGIN
    -- Corpo da função com comandos SQL
    RETURN valor;
END;
```

## Exemplo de Stored Function

Suponha que temos uma tabela chamada `Produtos` com colunas `preco` e `desconto`, e queremos calcular o preço final com desconto.

```sql
DELIMITER //
CREATE FUNCTION CalculaPrecoFinal (precoDecimal DECIMAL(10, 2), descontoDecimal DECIMAL(4, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE precoFinal DECIMAL(10, 2);
    SET precoFinal = precoDecimal - (precoDecimal * descontoDecimal);
    RETURN precoFinal;
END;
//
DELIMITER ;
```

## Chamando uma Stored Function

Depois de criada, podemos chamá-la em nossas consultas:

```sql
SELECT nome, preco, desconto, CalculaPrecoFinal(preco, desconto) AS preco_com_desconto
FROM Produtos;
```

## Considerações Finais

- As Stored Functions são úteis para encapsular lógica de negócios no banco de dados.
- Elas podem receber parâmetros e retornar valores.
- São criadas usando a declaração `CREATE FUNCTION`.
- Podem ser chamadas em consultas SQL como funções regulares.

Lembre-se de que a utilização de Stored Functions deve ser cuidadosamente considerada, pois seu uso excessivo pode afetar o desempenho do banco de dados.

Esta foi uma introdução às Stored Functions em MySQL. Elas são uma ferramenta poderosa para melhorar a organização e reutilização de lógica de negócios em consultas SQL.
