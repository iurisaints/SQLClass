As funções de agregação em MySQL são utilizadas para realizar cálculos e operações em conjuntos de valores de uma coluna ou grupo de colunas. Essas funções são especialmente úteis para obter informações resumidas e estatísticas sobre os dados armazenados no banco de dados. Abaixo, vou explicar algumas das principais funções de agregação disponíveis no MySQL:

1. **COUNT():**
A função COUNT() é utilizada para contar o número de registros em uma coluna ou grupo de colunas. Ela retorna o total de valores não nulos. A sintaxe básica é a seguinte:

```sql
SELECT COUNT(coluna) FROM tabela;
```

Por exemplo, para contar o número de clientes na tabela "clientes", podemos utilizar o seguinte comando:

```sql
SELECT COUNT(*) FROM clientes;
```

2. **SUM():**
A função SUM() é utilizada para calcular a soma dos valores de uma coluna numérica. Ela retorna a soma total dos valores. A sintaxe básica é a seguinte:

```sql
SELECT SUM(coluna) FROM tabela;
```

Por exemplo, para calcular o total das vendas na tabela "vendas", podemos utilizar o seguinte comando:

```sql
SELECT SUM(valor_venda) FROM vendas;
```

3. **AVG():**
A função AVG() é utilizada para calcular a média dos valores de uma coluna numérica. Ela retorna a média aritmética dos valores. A sintaxe básica é a seguinte:

```sql
SELECT AVG(coluna) FROM tabela;
```

Por exemplo, para calcular a média de idade dos clientes na tabela "clientes", podemos utilizar o seguinte comando:

```sql
SELECT AVG(idade) FROM clientes;
```

4. **MIN():**
A função MIN() é utilizada para encontrar o valor mínimo em uma coluna. Ela retorna o valor mínimo encontrado. A sintaxe básica é a seguinte:

```sql
SELECT MIN(coluna) FROM tabela;
```

Por exemplo, para encontrar o preço mínimo de um medicamento na tabela "medicamentos", podemos utilizar o seguinte comando:

```sql
SELECT MIN(preco) FROM medicamentos;
```

5. **MAX():**
A função MAX() é utilizada para encontrar o valor máximo em uma coluna. Ela retorna o valor máximo encontrado. A sintaxe básica é a seguinte:

```sql
SELECT MAX(coluna) FROM tabela;
```

Por exemplo, para encontrar o preço máximo de um medicamento na tabela "medicamentos", podemos utilizar o seguinte comando:

```sql
SELECT MAX(preco) FROM medicamentos;
```

<h3> Agregação Cheatsheet</h3>
```sql
SELECT COUNT(coluna) FROM tabela WHERE condição;
-- CONTA QUANTAS COLUNAS QUE EXISTEM NA TABELA COM A CONDIÇÃO --

SELECT SUM(coluna) FROM tabela WHERE condição;
-- SOMA TODAS AS COLUNAS QUE EXISTEM NA TABELA COM A CONDIÇÃO --

SELECT AVG(coluna) FROM tabela WHERE condição;
-- FAZ A MÉDIA DE TODAS AS COLUNAS QUE EXISTEM NA TABELA COM A CONDIÇÃO --

SELECT MIN(coluna) FROM tabela WHERE condição;
-- MOSTRA O VALOR MÍNIMO EM RELAÇÃO A TODAS AS COLUNAS --
-- QUE EXISTEM NA TABELA COM A CONDIÇÃO --

SELECT MAX(coluna) FROM tabela WHERE condição;
-- MOSTRA O VALOR MÁXIMO EM RELAÇÃO A TODAS AS COLUNAS --
-- QUE EXISTEM NA TABELA COM A CONDIÇÃO --
```
