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
<pre class="brush: sql; title: ; notranslate" title="">DECLARE @A TABLE (
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
</pre>
<h3>Artigos relacionados:</h3>
<p><a title="Entendendo os 'JOIN's do SQL" href="https://www.sqlfromhell.com/entendendo-join-sql/">Entendendo os &#8216;JOIN&#8217;s do SQL</a></p>
<div class='sfsi_Sicons sfsi_Sicons_position_left' style='width: 100%; display: inline-block; vertical-align: middle; text-align:left'><div style='margin:0px 8px 0px 0px; line-height: 24px'><span>Please follow and like us:</span></div><div class='sfsi_socialwpr'><div class='sf_subscrbe sf_icon' style='text-align:left;vertical-align: middle;float:left;width:auto'><a href="http://www.specificfeeds.com/widgets/emailSubscribeEncFeed/WW1lUzh3UDVxaU0vODhhZ2E3c2lCMk1icHZtaERSNzlLOUpRSmNoRlJ4OTNrVWJsTUFHVGhTWE1vY1g1RmFYRGJiaUN4UW1kOUdwM0VveDJMc25xTkNPL2ZORURhVm11T3hJS0RqcjNyTUpDN21FTEFVQjhZbjdRQ3o3U0MrcDF8bjd4dkxtdzRIZjNVWXc0WlB5YTJYR3ZENjV1aGhXckZxYnZjZWl0Zy9sRT0=/OA==/" target="_blank"><img src="https://www.sqlfromhell.com/wp-content/plugins/ultimate-social-media-icons/images/visit_icons/Follow/icon_Follow_en_US.png" alt="error" /></a></div><div class='sf_fb sf_icon' style='text-align:left;vertical-align: middle;'><div class="fb-like" data-href="https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/"  data-send="false" data-layout="button" ></div></div><div class='sf_fb_share sf_icon' style='text-align:left;vertical-align: middle;'><a  target='_blank' href='https://www.facebook.com/sharer/sharer.php?u=https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/' style='display:inline-block;'><img class='sfsi_wicon'  data-pin-nopin='true' alt='fb-share-icon' title='Facebook Share' src='https://www.sqlfromhell.com/wp-content/plugins/ultimate-social-media-icons/images/share_icons/fb_icons/en_US.svg' /></a></div><div class='sf_twiter sf_icon' style='display: inline-block;vertical-align: middle;width: auto;margin-left: 7px;'>
						<a target='_blank' href='https://twitter.com/intent/tweet?text=Entendendo+EXCEPT%2C+INTERSECT+e+UNION+do+SQL+https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/'style='display:inline-block' >
							<img data-pin-nopin= true class='sfsi_wicon' src='https://www.sqlfromhell.com/wp-content/plugins/ultimate-social-media-icons/images/share_icons/Twitter_Tweet/en_US_Tweet.svg' alt='Tweet' title='Tweet' >
						</a>
					</div><div class='sf_pinit sf_icon' style='text-align:left;vertical-align: middle;float:left;line-height: 33px;width:auto;margin: 0 -2px;'><a href='#' onclick='sfsi_pinterest_modal_images(event,"https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/","Entendendo EXCEPT, INTERSECT e UNION do SQL")' style='display:inline-block;'  > <img class='sfsi_wicon'  data-pin-nopin='true' alt='fb-share-icon' title='Pin Share' src='https://www.sqlfromhell.com/wp-content/plugins/ultimate-social-media-icons/images/share_icons/Pinterest_Save/en_US_save.svg' /></a></div></div></div>			</div><!-- .entry-content -->

	<footer class="entry-footer">
		<span class="tags-post">Tagged <a href="https://www.sqlfromhell.com/tag/except/" rel="tag">EXCEPT</a> <a href="https://www.sqlfromhell.com/tag/intersect/" rel="tag">INTERSECT</a> <a href="https://www.sqlfromhell.com/tag/sql/" rel="tag">SQL</a> <a href="https://www.sqlfromhell.com/tag/union/" rel="tag">UNION</a></span>	</footer><!-- .entry-footer -->
</article><!-- #post-## -->

			
	<nav class="navigation post-navigation" aria-label="Posts">
		<h2 class="screen-reader-text">Navegação de Post</h2>
		<div class="nav-links"><div class="nav-previous"><a href="https://www.sqlfromhell.com/entendendo-join-sql/" rel="prev">Entendendo o JOIN do SQL (ou Junções)</a></div></div>
	</nav>
			
<div id="comments" class="comments-area comment-post">

	
			<h4 class="comment-title">
			One thought on &ldquo;<span>Entendendo EXCEPT, INTERSECT e UNION do SQL</span>&rdquo;		</h4>

		
		<ul class="comments-list">
					<li id="comment-53" class="comment even thread-even depth-1">
			<article id="div-comment-53" class="comment-body">
				<footer class="comment-meta">
					<div class="comment-author vcard">
						<img alt='' src='https://secure.gravatar.com/avatar/2cc5d1d26e6eeb7e3ac45e076db8af87?s=60&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/2cc5d1d26e6eeb7e3ac45e076db8af87?s=120&#038;d=mm&#038;r=g 2x' class='avatar avatar-60 photo' height='60' width='60' loading='lazy' decoding='async'/>						<b class="fn">Cassio</b> <span class="says">disse:</span>					</div><!-- .comment-author -->

					<div class="comment-metadata">
						<a href="https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/#comment-53"><time datetime="2019-02-21T17:20:30+00:00">fevereiro 21, 2019 às 5:20 pm</time></a>					</div><!-- .comment-metadata -->

									</footer><!-- .comment-meta -->

				<div class="comment-content">
					<p>Excelente artigo!</p>
				</div><!-- .comment-content -->

				<div class="reply"><a rel='nofollow' class='comment-reply-link' href='https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/?replytocom=53#respond' data-commentid="53" data-postid="216" data-belowelement="div-comment-53" data-respondelement="respond" data-replyto="Responder para Cassio" aria-label='Responder para Cassio'>Responder</a></div>			</article><!-- .comment-body -->
		</li><!-- #comment-## -->
		</ul><!-- .comment-list -->

		
	
	
		<div id="respond" class="comment-respond">
		<h3 id="reply-title" class="comment-reply-title">Deixe um comentário <small><a rel="nofollow" id="cancel-comment-reply-link" href="/entendendo-except-intersect-e-union-do-sql/#respond" style="display:none;">Cancelar resposta</a></small></h3><form action="https://www.sqlfromhell.com/wp-comments-post.php" method="post" id="commentform" class="comment-form" novalidate><p class="comment-form-comment"><label for="comment">Comentário <span class="required">*</span></label> <textarea id="comment" name="comment" cols="45" rows="8" maxlength="65525" required></textarea></p><p class="comment-form-author"><label for="author">Nome <span class="required">*</span></label> <input id="author" name="author" type="text" value="" size="30" maxlength="245" autocomplete="name" required /></p>
<p class="comment-form-email"><label for="email">E-mail <span class="required">*</span></label> <input id="email" name="email" type="email" value="" size="30" maxlength="100" autocomplete="email" required /></p>
<p class="comment-form-url"><label for="url">Site</label> <input id="url" name="url" type="url" value="" size="30" maxlength="200" autocomplete="url" /></p>
<p class="comment-form-cookies-consent"><input id="wp-comment-cookies-consent" name="wp-comment-cookies-consent" type="checkbox" value="yes" /> <label for="wp-comment-cookies-consent">Salvar meus dados neste navegador para a próxima vez que eu comentar.</label></p>
<p class="form-submit"><input name="submit" type="submit" id="submit" class="submit" value="Publicar comentário" /> <input type='hidden' name='comment_post_ID' value='216' id='comment_post_ID' />
<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
</p><p style="display: none;"><input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="768ece964e" /></p><p style="display: none !important;"><label>&#916;<textarea name="ak_hp_textarea" cols="45" rows="8" maxlength="100"></textarea></label><input type="hidden" id="ak_js_1" name="ak_js" value="111"/><script>document.getElementById( "ak_js_1" ).setAttribute( "value", ( new Date() ).getTime() );</script></p></form>	</div><!-- #respond -->
	<p class="akismet_comment_form_privacy_notice">Esse site utiliza o Akismet para reduzir spam. <a href="https://akismet.com/privacy/" target="_blank">Aprenda como seus dados de comentários são processados</a>.</p>
</div><!-- #comments -->

		
		</main><!-- #main -->
	</div><!-- #primary -->


<div id="secondary" class="sidebar col-md-4" role="complementary">
	
		<aside id="recent-posts-2" class="widget widget_recent_entries">
		<h5 class="widget-title">Recente</h5>
		<ul>
											<li>
					<a href="https://www.sqlfromhell.com/entendendo-except-intersect-e-union-do-sql/" aria-current="page">Entendendo EXCEPT, INTERSECT e UNION do SQL</a>
									</li>
											<li>
					<a href="https://www.sqlfromhell.com/entendendo-join-sql/">Entendendo o JOIN do SQL (ou Junções)</a>
									</li>
											<li>
					<a href="https://www.sqlfromhell.com/gerando-xml-no-sql-server-arte-do-for-xml-path/">Gerando XML no SQL Server – Arte do FOR XML PATH</a>
									</li>
											<li>
					<a href="https://www.sqlfromhell.com/gerando-xml-no-sql-server-arte-do-for-xml-raw/">Gerando XML no SQL Server – Arte do FOR XML RAW</a>
									</li>
											<li>
					<a href="https://www.sqlfromhell.com/gerando-xml-no-sql-server-arte-do-for-xml-explicit/">Gerando XML no SQL Server – Arte do FOR XML EXPLICIT</a>
									</li>
					</ul>

		</aside><aside id="categories-2" class="widget widget_categories"><h5 class="widget-title">Categorias</h5>
			<ul>
					<li class="cat-item cat-item-25"><a href="https://www.sqlfromhell.com/category/azure/">Azure</a>
</li>
	<li class="cat-item cat-item-28"><a href="https://www.sqlfromhell.com/category/destaque/">Destaque</a>
</li>
	<li class="cat-item cat-item-31"><a href="https://www.sqlfromhell.com/category/for-xml/">FOR XML</a>
</li>
	<li class="cat-item cat-item-9"><a href="https://www.sqlfromhell.com/category/full-text-search/">Full-Text Search</a>
</li>
	<li class="cat-item cat-item-14"><a href="https://www.sqlfromhell.com/category/hello-world/">Hello World</a>
</li>
	<li class="cat-item cat-item-18"><a href="https://www.sqlfromhell.com/category/seguranca/">Segurança</a>
</li>
	<li class="cat-item cat-item-32"><a href="https://www.sqlfromhell.com/category/service-broker/">Service Broker</a>
</li>
	<li class="cat-item cat-item-24"><a href="https://www.sqlfromhell.com/category/tips/">Tips</a>
</li>
	<li class="cat-item cat-item-8"><a href="https://www.sqlfromhell.com/category/xquery/">XQuery</a>
</li>
			</ul>

			</aside><aside id="archives-2" class="widget widget_archive"><h5 class="widget-title">Histórico</h5>
			<ul>
					<li><a href='https://www.sqlfromhell.com/2018/06/'>junho 2018</a>&nbsp;(9)</li>
	<li><a href='https://www.sqlfromhell.com/2018/04/'>abril 2018</a>&nbsp;(9)</li>
	<li><a href='https://www.sqlfromhell.com/2018/03/'>março 2018</a>&nbsp;(2)</li>
	<li><a href='https://www.sqlfromhell.com/2018/02/'>fevereiro 2018</a>&nbsp;(3)</li>
			</ul>
