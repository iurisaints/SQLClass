##Instalando seu ambiente para desenvolvimento em SQL

Olá! Provavelmente você está aqui após a aula dois. Caso não, retorne, leia, aprenda e volte aqui :)

Bom, dado o primeiro recado, vamos utilizar o servidor da MariaDB e iremos utilizar a inteface do HeidiSQL.

Para instalar o servidor entre em: https://mariadb.org/download/?t=mariadb&p=mariadb&r=11.2.0&os=windows&cpu=x86_64&pkg=msi&m=fder
Baixe como .ZIP!
Após isso, faça o unzip na pasta documentos. Após isso entre na pasta e entre em bin. Abra a ./bin no terminal.
Dê o seguinte comando:
```
mysql_install_db.exe
```
Após isso:
```
mysqld.exe --console
```
Caso queira criar um arquivo para startar seu banco, crie um .bat com o comando mysqld.exe --console e envie como atalho para a área de trabalho.

Agora instale o HeidiSQL pelo link: https://www.heidisql.com/download.php?download=installer

A instalação é bem intuitiva.
Não esqueça de deixar o terminal com o servidor aberto.

Para iniciar use as credenciais:

Tipo de rede: MariaDB ou MySQL;
Biblioteca: libmysql.dll
Servidor/IP: 127.0.0.1
Usuário: root
Senha: 
Porta: 3306

Renomeie seu banco como quiser e inicie seu desenvolvimento 😄
