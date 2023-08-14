#Stored Functions e Stored Procedures em MySQL

## Introdução

Tanto Stored Functions (Funções Armazenadas) quanto Stored Procedures (Procedimentos Armazenados) são componentes importantes em bancos de dados relacionais, mas eles têm propósitos diferentes e são usados em contextos distintos. Vamos entender as principais diferenças entre esses dois conceitos.

## Stored Functions

Stored Functions são blocos de código SQL que retornam um valor. Esses valores podem ser utilizados em consultas, atribuídos a variáveis ou até mesmo serem retornados diretamente ao usuário.

### Exemplo de Stored Function

Suponha que queremos criar uma função que calcule o preço final de um produto após aplicar um desconto:

```sql
DELIMITER //
CREATE FUNCTION CalculaPrecoComDesconto (precoDecimal DECIMAL(10, 2), descontoDecimal DECIMAL(4, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE precoFinal DECIMAL(10, 2);
    SET precoFinal = precoDecimal - (precoDecimal * descontoDecimal);
    RETURN precoFinal;
END;
//
DELIMITER ;
```

## Stored Procedures

Stored Procedures são blocos de código SQL que podem realizar várias ações, como inserções, atualizações e exclusões de registros, mas não retornam um valor como resultado.

### Exemplo de Stored Procedure

Suponha que queremos criar uma procedure que insere um novo jogador na tabela de jogadores:

```sql
DELIMITER //
CREATE PROCEDURE InserirJogador (nomeJogador VARCHAR(100), dataNascimento DATE, nacionalidade VARCHAR(50))
BEGIN
    INSERT INTO Jogadores (nome, data_nascimento, pais)
    VALUES (nomeJogador, dataNascimento, nacionalidade);
END;
//
DELIMITER ;
```

## Principais Diferenças

- **Retorno de Valor:**
  - Stored Function retorna um valor específico após sua execução.
  - Stored Procedure não retorna um valor específico, é focada em executar ações.

- **Uso em Consultas:**
  - Stored Function pode ser usada em uma consulta SQL como parte de uma expressão.
  - Stored Procedure não pode ser usada diretamente em consultas SQL.

- **Exceções:**
  - Stored Function pode lançar exceções e controlar erros.
  - Stored Procedure também pode lançar exceções e controlar erros.

## Conclusão

As Stored Functions e Stored Procedures são importantes ferramentas para interagir com bancos de dados, mas têm finalidades distintas. Functions são úteis quando precisamos de um valor de retorno para ser utilizado em consultas, enquanto Procedures são utilizadas para executar ações mais complexas no banco de dados. Ambas desempenham papéis essenciais no desenvolvimento de aplicações que envolvem bancos de dados relacionais.

Lembre-se de escolher a ferramenta certa para a tarefa certa, garantindo a eficiência e a manutenção do sistema.
