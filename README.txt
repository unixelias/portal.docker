Docker Plone e a Identidade Digital de Governo Eletrônico
=========================================================

Inicialmente clone o repositório e entre no diretório criado.

Para subir o cluster digite:

    $ docker-compose up -d

Para escalar os números de clientes ZEO:

    $ docker-compose scale plonegovbridg=4

Depois de escalar pare e remova a imagem do haproxy e suba novamente.

Para backup do site Plone digite:

    $ docker run --volumes-from plone_data -v $(pwd):/backup ubuntu bash -c "tar czvf /backup/backup-$(date '+%d_%m_%y_%H_%M').tar.gz /data"

Para restaurar o backup para o serviço:

    $ docker-compose stop -t 300 

e digite para o blobstorage:

    $ docker run --volumes-from plone_data -v $(pwd):/backup ubuntu bash -c "rm -Rf /data/blobstorage/* && cd /tmp && tar xzvf /backup/backup-14_07_16_12_51.tar.gz && mv data/blobstorage/* ../data/blobstorage && chown -R 500:500 ../data/blobstorage"

e digite para o filestorage:

    $ docker run --volumes-from plone_data -v $(pwd):/backup ubuntu bash -c "rm -Rf /data/filestorage/* && cd /tmp && tar xzvf /backup/backup-14_07_16_12_51.tar.gz && mv data/filestorage/* ../data/filestorage && chown -R 500:500 ../data/blobstorage"

> Não está funcionando corretamente o restore do backup com esse comando.

Para ver mais sobre o docker e o plone veja a documentação em <https://github.com/plone/plone.docker/blob/master/docs/usage.rst>
