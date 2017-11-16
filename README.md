# Docker Plone e a Identidade Digital de Governo Eletrônico

## Docker Status by tag

[![](https://images.microbadger.com/badges/version/unixelias/plone.idg.svg)](https://microbadger.com/images/unixelias/plone.idg "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/unixelias/plone.idg.svg)](https://microbadger.com/images/unixelias/plone.idg "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/unixelias/plone.idg.svg)](https://microbadger.com/images/unixelias/plone.idg "Get your own commit badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/unixelias/plone.idg:1.4.svg)](https://microbadger.com/images/unixelias/plone.idg:1.4 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/unixelias/plone.idg:1.4.svg)](https://microbadger.com/images/unixelias/plone.idg:1.4 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/unixelias/plone.idg:1.4.svg)](https://microbadger.com/images/unixelias/plone.idg:1.4 "Get your own commit badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/unixelias/plone.idg:1.2.svg)](https://microbadger.com/images/unixelias/plone.idg:1.2 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/unixelias/plone.idg:1.2.svg)](https://microbadger.com/images/unixelias/plone.idg:1.2 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/unixelias/plone.idg:1.2.svg)](https://microbadger.com/images/unixelias/plone.idg:1.2 "Get your own commit badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/unixelias/plone.idg:1.1.5.3.svg)](https://microbadger.com/images/unixelias/plone.idg:1.1.5.3 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/unixelias/plone.idg:1.1.5.3.svg)](https://microbadger.com/images/unixelias/plone.idg:1.1.5.3 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/unixelias/plone.idg:1.1.5.3.svg)](https://microbadger.com/images/unixelias/plone.idg:1.1.5.3 "Get your own commit badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/unixelias/plone.idg:dev.svg)](https://microbadger.com/images/unixelias/plone.idg:dev "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/unixelias/plone.idg:dev.svg)](https://microbadger.com/images/unixelias/plone.idg:dev "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/unixelias/plone.idg:dev.svg)](https://microbadger.com/images/unixelias/plone.idg:dev "Get your own commit badge on microbadger.com")

## Build Status
[![Build Status](https://travis-ci.org/unixelias/plone.idg.svg?branch=master)](https://travis-ci.org/unixelias/plone.idg)


## Instalando dependências

Você precisa ter instalados: docker, docker-compose e o plugin local-persist

### Docker

A [Documentação oficial](https://docs.docker.com/) do Docker oferece amplo suporte à adoção e operação do mesmo. Recomendo a instalação de acordo com as instruçes disponíveis [neste link](https://docs.docker.com/engine/installation/), que contém instruções específicas para a instalação em diversos sistemas e arquiteturas.

### Docker Compose
O Compose já faz parte do Docker e as instruções para instalação também estão disponíveis na [documentação oficial](https://docs.docker.com/compose/install/#install-compose). Ele não é necessário para testar apenas uma imagem, mas para o uso da Stack composta pelo Varnish, HAProxy, Clientes Plone e Zeoserver ele será necessário, pois gerencia as dependências de inicialização e também o escalonamento dos motores de renderização (Clientes Plone).

#### Composição da pilha de serviços

<p align="center">
  <br/>
  <img src="https://raw.githubusercontent.com/unixelias/plone.idg/master/img/stack_portal.png">
</p>

### Plugin local-persist

Se você usar a Stack de serviços com o Compose, você poderá usar o plugin Local-persist para gerenciar volumes locais para permanência dos dados. Esse plugin permite gerenciar a montagem dos volumes em pastas do sistema que podem ser facilmente movidas. Você pode combinar esse plugin com o NFS, montando o volume dentro de um diretório NFS.

O repositório do projeto disonibiliza instruções para instalação e um script para instalação automática. Mais informações:https://github.com/CWSpear/local-persist

## Usando o sistema

### Obtendo o código
Depois de instalar as dependências você dever baixar o código-fonte. Caso deseje, você pode apenas salvas o arquivo [docker-compose.yml](https://raw.githubusercontent.com/unixelias/plone.idg/master/docker-compose.yml) em uma pasta e já estará apto a iniciar a Stack.

Se desejar, clone o repositório e entre no diretório criado.
```
git clone https://github.com/unixelias/plone.idg.git
cd plone.idg
```
### Iniciando o sistema

Para subir o cluster digite:
```
$ docker-compose up -d
```
Para escalar os números de clientes ZEO:
```
$ docker-compose scale ploneidg=4
```
### Gerenciando dados

Os dados são armazenados no servidor ZEO, onde é possível gerenciar os backups. Há um mecanismo de backup e restauração na instalação do Plone das imagens e esse deve ser realizado dentro dos containeres ou pelo Compose. Uma vez que os dados estão montados apenas para o serviço 'zeoserver', não é necessário realizar procedimentos de backup nos containeres 'ploneidg'.

Para backup do site Plone digite:
```
$ docker-compose run zeoserver bin/backup
```
Para restaurar o backup para o serviço:
```
$ docker-compose run zeoserver bin/restore
```
Você pode gerenciar os dados também pelas pastas locais onde os volumes docker estiverem montados.

### Saiba mais

Para ver mais sobre o docker e o plone veja a documentação em <https://github.com/plone/plone.docker/blob/master/docs/usage.rst>.

Saiba mais sobre essa pilha de serviços consultando meu TCC [neste link](https://app.box.com/s/rrdh1jqaz3b00jwq2mncmgdhd08jbm19).
