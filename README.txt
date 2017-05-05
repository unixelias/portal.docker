Docker Plone e a Identidade Digital de Governo Eletrônico
=========================================================


Criando volume local para salvar os dados

Instale o plugin local-persist para definir um local de montagem ao criar

    Mais informações:https://github.com/CWSpear/local-persist

Inicialmente clone o repositório e entre no diretório criado.

Para subir o cluster digite:

    $ docker-compose up -d

Para escalar os números de clientes ZEO:

    $ docker-compose scale portal=4

Os dados são armazenados no servidor ZEO, onde é possível gerenciar os backups

Para backup do site Plone digite:

    $ docker-compose run zeoserver bin/backup

Para restaurar o backup para o serviço:

    $ docker-compose run zeoserver bin/restore

Para ver mais sobre o docker e o plone veja a documentação em <https://github.com/plone/plone.docker/blob/master/docs/usage.rst>
