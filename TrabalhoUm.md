Faça após a aula 5!

**Trabalho Um!**

Antes de iniciar o desenvolvimento do sistema, é essencial realizar a modelagem do banco de dados para garantir uma estrutura adequada e eficiente. Neste trabalho, o primeiro passo é criar a modelagem Entidade-Relacionamento (ER) na notação de Peter Chen. A partir dessa modelagem, serão definidas as tabelas e seus atributos correspondentes. Vamos detalhar cada etapa do trabalho:

1. **Modelagem Entidade-Relacionamento (ER):**
A modelagem ER é uma técnica visual para representar as entidades e seus relacionamentos no sistema. Nesse caso, a modelagem pode incluir entidades como "Medicamento", "Cliente", "Fornecedor" e "Venda". Estabeleça os relacionamentos entre as entidades, considerando que um medicamento pode ser vendido para vários clientes e um cliente pode realizar várias compras. Além disso, um medicamento pode ter um fornecedor específico e um fornecedor pode fornecer vários medicamentos.

2. **Criação das Tabelas:**
Com a modelagem ER concluída, podemos criar as tabelas no banco de dados. Para cada entidade identificada, crie uma tabela correspondente. Aqui estão alguns exemplos de tabelas e seus atributos:

   - Tabela "Medicamento":
     - Atributos: 
       - `id` (INT): chave primária que identifica exclusivamente cada medicamento.
       - `nome` (VARCHAR): nome do medicamento.
       - `fabricante` (VARCHAR): nome do fabricante do medicamento.
       - `preco` (DECIMAL): preço do medicamento.
       - `quantidade` (INT): quantidade disponível em estoque.

   - Tabela "Cliente":
     - Atributos: 
       - `id` (INT): chave primária que identifica exclusivamente cada cliente.
       - `nome` (VARCHAR): nome do cliente.
       - `endereco` (VARCHAR): endereço do cliente.
       - `email` (VARCHAR): endereço de e-mail do cliente.
       - `telefone` (VARCHAR): número de telefone do cliente.

   - Tabela "Fornecedor":
     - Atributos: 
       - `id` (INT): chave primária que identifica exclusivamente cada fornecedor.
       - `nome` (VARCHAR): nome do fornecedor.
       - `endereco` (VARCHAR): endereço do fornecedor.
       - `telefone` (VARCHAR): número de telefone do fornecedor.

   - Tabela "Venda":
     - Atributos: 
       - `id` (INT): chave primária que identifica exclusivamente cada venda.
       - `data` (DATE): data da venda.
       - `id_medicamento` (INT): chave estrangeira referenciando o medicamento vendido.
       - `id_cliente` (INT): chave estrangeira referenciando o cliente que realizou a compra.

3. **Definição das Tipagens e Restrições:**
Após a criação das tabelas, é importante definir as tipagens corretas para os atributos. Utilize tipos de dados adequados, como VARCHAR para strings, INT para números inteiros

 e DECIMAL para valores monetários. Além disso, é possível definir restrições, como chaves primárias (PRIMARY KEY) e chaves estrangeiras (FOREIGN KEY), para garantir a integridade dos dados.

4. **Inserção de Dados e Manipulação:**
Agora que as tabelas estão prontas, você pode inserir dados iniciais usando o comando `INSERT INTO`. Adicione medicamentos, clientes, fornecedores e vendas de exemplo para permitir a manipulação e teste do sistema.

5. **Consultas e Relatórios:**
Utilize o comando `SELECT` para realizar consultas no banco de dados e obter informações relevantes. Por exemplo, você pode consultar o estoque atual de medicamentos, verificar as vendas realizadas em um determinado período ou obter uma lista de clientes cadastrados. Explore recursos avançados, como junções (JOIN), agregações (GROUP BY) e ordenações (ORDER BY), para gerar relatórios mais elaborados.

  1. **Consulta de Estoque:**
     - Quais são os medicamentos com quantidade em estoque menor que um determinado valor?
     - Quais são os medicamentos mais vendidos nos últimos três meses?
     - Quais são os medicamentos com validade próxima ao vencimento?
     - Quais são os medicamentos que estão em falta no estoque?

  2. **Consulta de Vendas e Clientes:**
     - Quais são as vendas realizadas por um cliente específico?
     - Qual é o valor total das vendas realizadas em um determinado período?
     - Quais são os clientes que fizeram compras acima de um determinado valor?
     - Quais são os clientes mais frequentes em termos de número de compras?

  3. **Consulta de Fornecedores:**
     - Quais são os fornecedores que mais forneceram medicamentos nos últimos seis meses?
     - Quais são os fornecedores que forneceram um medicamento específico?
     - Quais são os fornecedores que têm um contrato de fornecimento ativo?

  4. **Consulta de Relatórios Gerenciais:**
     - Qual é o valor total de vendas por mês no último ano?
     - Quais são os medicamentos mais lucrativos por categoria?
     - Quais são os clientes com maior valor acumulado de compras ao longo do tempo?
     - Quais são os fornecedores que têm um bom desempenho em termos de qualidade e entrega?

6. **Manutenção e Aperfeiçoamento:**
Mantenha o banco de dados atualizado, realizando backup dos dados regularmente e implementando práticas de segurança adequadas. Além disso, considere aperfeiçoar o desempenho das consultas utilizando índices e otimizando as consultas mais frequentes.

Lembre-se de que essa é uma descrição básica do trabalho relacionado a um sistema de gerenciamento para uma grande farmácia. Cada projeto pode ter requisitos específicos adicionais, como controle de lotes, controle de validade de medicamentos, relatórios regulatórios e muito mais. É importante adaptar o trabalho com base nas necessidades e nas particularidades do cenário real da farmácia.
