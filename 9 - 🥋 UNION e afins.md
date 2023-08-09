**Aula: UNION, EXCEPT e INTERSECT no SQL**

Nesta aula, vamos explorar as operações `UNION`, `EXCEPT` e `INTERSECT` no SQL. Essas operações são poderosas para combinar, comparar e analisar conjuntos de resultados de diferentes consultas.

### UNION

A operação `UNION` é usada para combinar os resultados de duas ou mais consultas em um único conjunto de resultados, removendo duplicatas.

```sql
SELECT coluna1, coluna2 FROM tabela1
UNION
SELECT coluna1, coluna2 FROM tabela2;
```

**Exemplo:** Combinação de resultados de duas tabelas de produtos.

```sql
SELECT nome_produto, preco FROM Produtos_A
UNION
SELECT nome_produto, preco FROM Produtos_B;
```

### EXCEPT

A operação `EXCEPT` (ou `MINUS` em alguns sistemas) retorna os registros da primeira consulta que não estão presentes na segunda consulta. 

```sql
SELECT coluna1, coluna2 FROM tabela1
EXCEPT
SELECT coluna1, coluna2 FROM tabela2;
```

**Exemplo:** Produtos em estoque que não foram vendidos.

```sql
SELECT nome_produto FROM Estoque
EXCEPT
SELECT nome_produto FROM Vendas;
```

### INTERSECT

A operação `INTERSECT` retorna os registros que estão presentes em ambas as consultas.

```sql
SELECT coluna1, coluna2 FROM tabela1
INTERSECT
SELECT coluna1, coluna2 FROM tabela2;
```

**Exemplo:** Clientes que fizeram compras online e em lojas físicas.

```sql
SELECT cliente_nome FROM Compras_Online
INTERSECT
SELECT cliente_nome FROM Compras_Lojas;
```

Lembre-se de que as operações `EXCEPT` e `INTERSECT` exigem que as consultas tenham a mesma estrutura de coluna.

### Combinando Operações

Você pode combinar essas operações para realizar análises mais complexas.

**Exemplo:** Produtos únicos que estão tanto no estoque quanto nas vendas.

```sql
SELECT nome_produto FROM Estoque
INTERSECT
SELECT nome_produto FROM Vendas;
```
