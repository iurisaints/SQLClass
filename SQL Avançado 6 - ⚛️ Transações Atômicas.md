# Transações Atômicas em SQL

## Introdução

Transações atômicas são um conceito fundamental em bancos de dados relacionais. Uma transação é um conjunto de operações que são tratadas como uma única unidade de trabalho. A propriedade "atômica" garante que todas as operações em uma transação sejam concluídas com sucesso ou revertidas em caso de erro, mantendo a integridade dos dados.

## Propriedades ACID

As transações atômicas seguem as propriedades ACID:

1. **Atomicidade:** Uma transação é tratada como uma unidade indivisível. Todas as operações da transação são executadas com sucesso ou nenhuma delas é.

2. **Consistência:** Uma transação leva o banco de dados de um estado válido para outro. As operações devem garantir que os dados respeitem as regras de integridade e validação.

3. **Isolamento:** Cada transação é isolada das outras. As operações de uma transação não são visíveis para outras transações até que a transação seja concluída.

4. **Durabilidade:** Após o término da transação, os resultados das operações são permanentemente armazenados e sobrevivem a falhas no sistema.

## Exemplo de Transação

Considere um banco de dados de um jogo onde os jogadores compram itens. Vamos criar uma tabela "Compras" e uma tabela "Itens" para ilustrar uma transação.

```sql
CREATE TABLE Itens (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Compras (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_jogador INT,
    id_item INT,
    quantidade INT,
    total DECIMAL(10, 2),
    data_compra TIMESTAMP,
    FOREIGN KEY (id_jogador) REFERENCES Jogadores(id),
    FOREIGN KEY (id_item) REFERENCES Itens(id)
);
```

Suponha que um jogador esteja comprando um item e precisamos inserir um registro na tabela "Compras" e subtrair o valor do item do saldo do jogador. Isso precisa ser uma operação atômica para garantir que o jogador não perca dinheiro se algo der errado.

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

A transação começa com `START TRANSACTION` e é concluída com `COMMIT`, garantindo que todas as operações intermediárias sejam executadas com sucesso. Se algo der errado, podemos usar `ROLLBACK` para reverter todas as operações.

## Conclusão

As transações atômicas são essenciais para manter a integridade dos dados em bancos de dados. Elas garantem que um conjunto de operações seja tratado como uma única unidade, evitando resultados inconsistentes em caso de falhas. A aplicação correta de transações atômicas é fundamental para garantir que os dados do banco de dados permaneçam confiáveis e precisos.
