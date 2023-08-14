# Aula Avançada sobre Transações Atômicas em SQL: Escrita e Leitura

## Introdução

Nesta aula, exploraremos em detalhes como as transações atômicas afetam operações de escrita e leitura em um banco de dados. Vamos abordar como as propriedades ACID das transações garantem a consistência e a integridade dos dados, mesmo em ambientes multiusuários.

## Escrita e Leitura em Transações

As transações podem envolver tanto operações de escrita (inserção, atualização, exclusão) quanto operações de leitura (consultas). Vamos explorar como as propriedades ACID das transações garantem a consistência quando lidamos com essas operações.

### Escrita

Quando executamos operações de escrita em uma transação, como inserir ou atualizar dados, o sistema de gerenciamento de banco de dados (SGBD) garante que essas operações sejam tratadas como uma única unidade. Isso significa que todas as operações de escrita da transação serão concluídas com sucesso ou nenhuma delas será. Se algo der errado, a transação será revertida.

### Leitura

As operações de leitura também são afetadas pelas transações. Quando um conjunto de operações de leitura é realizado dentro de uma transação, o SGBD garante que os dados lidos permaneçam consistentes durante a transação. Isso ocorre porque as transações isolam umas das outras, impedindo que outras transações modifiquem os dados enquanto uma transação estiver em andamento.

## Consistência e Isolamento

As propriedades de consistência e isolamento das transações são especialmente importantes em ambientes multiusuários, onde várias transações podem ocorrer simultaneamente.

### Consistência

A propriedade de consistência garante que uma transação leve o banco de dados de um estado válido para outro. Isso significa que todas as regras de validação e integridade devem ser atendidas, mesmo durante uma transação. Se qualquer operação dentro da transação falhar em cumprir as regras, a transação inteira será revertida.

### Isolamento

A propriedade de isolamento garante que as operações de uma transação sejam invisíveis para outras transações até que a transação seja concluída. Isso evita que operações de leitura vejam dados em um estado intermediário, que poderiam levar a resultados inconsistentes.

## Exemplo de Leitura e Escrita

Vamos considerar um exemplo onde um jogador está comprando um item de um banco de dados de jogos. O jogador quer comprar um item e ver seu saldo atualizado após a compra.

```sql
START TRANSACTION;

BEGIN
DECLARE preco_item DECIMAL(10, 2);
SELECT preco INTO preco_item FROM Itens WHERE id = 1;

INSERT INTO Compras (id_jogador, id_item, quantidade, total, data_compra)
VALUES (1, 1, 1, preco_item, NOW());

UPDATE Jogadores
SET saldo = saldo - preco_item
WHERE id = 1;

COMMIT;
```

Neste exemplo, a transação garante que a compra e a atualização de saldo sejam tratadas como uma única unidade. Se algo der errado, como um erro na inserção, todas as operações da transação serão revertidas, mantendo a integridade dos dados.

## Conclusão

Transações atômicas são fundamentais para manter a consistência e a integridade dos dados em ambientes multiusuários. Elas garantem que operações de escrita e leitura sejam tratadas de maneira isolada, prevenindo resultados inconsistentes. Ao entender como as propriedades ACID das transações afetam as operações de escrita e leitura, os desenvolvedores podem criar sistemas robustos e confiáveis.
