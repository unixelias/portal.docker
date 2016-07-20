Docker Plone e a Identidade Digital de Governo Eletrônico
=========================================================

Inicialmente clone o repositório e entre no diretório criado.

Para subir o cluster digite:

    $ docker-compose up -d

Para escalar os números de clientes ZEO:

    $ docker-compose scale plonegovbridg=4

Depois de escalar pare e remova a imagem do haproxy e suba novamente.

Para backup do site Plone digite:

    $ docker-compose run plonegovbridg bin/backup

Para restaurar o backup para o serviço:

    $ docker-compose run plonegovbridg bin/restore

Para ver mais sobre o docker e o plone veja a documentação em <https://github.com/plone/plone.docker/blob/master/docs/usage.rst>
