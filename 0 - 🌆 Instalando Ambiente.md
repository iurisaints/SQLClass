**Instalando seu ambiente para desenvolvimento em SQL**

Vamos utilizar o servidor da MariaDB e iremos utilizar a inteface do HeidiSQL.
Passo 1:
[Download HeidiSQL Portable](https://www.heidisql.com/download.php?download=portable-64)
E utilize a opção **Portable version (zipped): 32 bit ≃ 64 bit ≃** e clique na opção 64bits

Para instalar o servidor entre em [MariaDB Downloader](https://mariadb.org/download/?t=mariadb&p=mariadb&r=11.2.0&os=windows&cpu=x86_64&pkg=msi&m=fder) e baixe como .ZIP!

Após isso, faça o unzip na pasta documentos. Após isso entre na pasta e entre em bin. Abra a ./bin no terminal.
Dê o seguinte comando:
```
mysql_install_db.exe
```
Após isso:
```
mysqld.exe --console
```
(Irei fazer com todos em sala de aula a partir daqui: )
Caso queira criar um arquivo para startar seu banco, crie um .bat com o comando mysqld.exe --console e envie como atalho para a área de trabalho. 

Para iniciar use as credenciais:

Tipo de rede: MariaDB ou MySQL;

Biblioteca: libmysql.dll

Servidor/IP: 127.0.0.1

Usuário: root

Senha: 

Porta: 3306

Caso o seu banco tenha dado problema com a porta, você pode modificar o arquivo da pasta Data > my.ini para:
```
[mysqld]
port=5000
datadir=C:/Users/Administrador/Downloads/mariadb-11.3.2-winx64/data
[client]
port=5000
plugin-dir=C:\Users\Administrador\Downloads\mariadb-11.3.2-winx64/lib/plugin

```

Renomeie seu banco como quiser e inicie seu desenvolvimento 😄
