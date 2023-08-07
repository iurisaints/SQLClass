<h1> O que é UNION etc?</h1>
<p>A principal ideia destas cláusulas é &#8216;somar&#8217; e &#8216;subtrair&#8217; os registros de duas ou mais consultas.</p>
<h3>UNION ALL e UNION</h3>
<p><img decoding="async" loading="lazy" class="alignnone size-full wp-image-220" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/union.png" alt="" width="180" height="131" /></p>
<p>Iniciando com o UNION ALL, ele permite unir os registros de duas consultas. No exemplo abaixo, temos a tabela @A com os registros José, Maria e João, e a tabela @B com os registros Maria, Guilherme e Vitória.</p>
<p><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-221" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union-all-300x247.png" alt="" width="300" height="247" srcset="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union-all-300x247.png 300w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union-all.png 405w" sizes="(max-width: 300px) 100vw, 300px" /></p>
<p>Como no caso o registro Maria com ID 2 está presente nas duas tabelas, com UNION ALL, o registro irá se repetir. Caso queira que os registros iguais não se repitam, basta usar UNION, conforme o exemplo abaixo.</p>
<p><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-222" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union-300x247.png" alt="" width="300" height="247" srcset="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union-300x247.png 300w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-union.png 405w" sizes="(max-width: 300px) 100vw, 300px" /></p>
<p>Internamente no SQL Server, o que o UNION faz é um UNION ALL seguindo de um DISTINCT, ou seja, as duas consultas abaixo tem o mesmo plano de execução no SQL Server e funcionam da mesma forma.</p>
<pre class="brush: sql; title: ; notranslate" title="">SELECT ID, NOME FROM @A
UNION
SELECT ID, NOME FROM @B
</pre>
<pre class="brush: sql; title: ; notranslate" title="">
SELECT DISTINCT ID, NOME
FROM (
	SELECT ID, NOME FROM @A
	UNION ALL
	SELECT ID, NOME FROM @B
) AS C
</pre>
<p><strong>Plano de execução:</strong></p>
<p><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-223" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/union-plan-300x98.png" alt="" width="300" height="98" srcset="https://www.sqlfromhell.com/wp-content/uploads/2018/06/union-plan-300x98.png 300w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/union-plan-435x143.png 435w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/union-plan.png 497w" sizes="(max-width: 300px) 100vw, 300px" /></p>
<p>Desta forma, evite usar UNION quando UNION ALL já é o suficiente.</p>
<h3>EXCEPT</h3>
<p><img decoding="async" loading="lazy" class="alignnone size-full wp-image-224" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/except.png" alt="" width="181" height="126" /></p>
<p>Quando se quer que apareçam os registros da tabela A que não são iguais aos da tabela B, temos a opção de &#8216;subtrair&#8217; os registros utilizando EXCEPT.</p>
<p><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-225" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-except-300x247.png" alt="" width="300" height="247" srcset="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-except-300x247.png 300w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-except.png 405w" sizes="(max-width: 300px) 100vw, 300px" /></p>
<h3>___</h3>
<h3>INTERSECT</h3>
<p><img decoding="async" loading="lazy" class="alignnone size-full wp-image-226" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/intersect.png" alt="" width="165" height="118" /></p>
<p>Por fim, o uso de INTERSECT permite uma intersecção entre as consultas. Que diabos é intersecção? Então, seria como exibir somente os registros que as duas consultas têm em comum.</p>
<p><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-227" src="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-intersect-300x247.png" alt="" width="300" height="247" srcset="https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-intersect-300x247.png 300w, https://www.sqlfromhell.com/wp-content/uploads/2018/06/ex-intersect.png 405w" sizes="(max-width: 300px) 100vw, 300px" /></p>
<h3>Considerações finais</h3>
<p>Abaixo a consulta completa deste post:</p>

```sql
DECLARE @A TABLE (
	ID INT NOT NULL,
	NOME VARCHAR(10) NOT NULL
)

DECLARE @B TABLE (
	ID INT NOT NULL,
	NOME VARCHAR(10) NOT NULL
)

INSERT @A
VALUES (1, 'José'), (2, 'Maria'), (3, 'João')

INSERT @B
VALUES (2, 'Maria'), (3, 'Guilherme'), (4, 'Vitória')

SELECT Título = 'UNION ALL'

SELECT ID, NOME FROM @A
UNION ALL
SELECT ID, NOME FROM @B

SELECT Título = 'UNION'

SELECT ID, NOME FROM @A
UNION
SELECT ID, NOME FROM @B

SELECT Título = 'EXCEPT'

SELECT ID, NOME FROM @A
EXCEPT
SELECT ID, NOME FROM @B

SELECT Título = 'INTERSECT'

SELECT ID, NOME FROM @A
INTERSECT
SELECT ID, NOME FROM @B
```
