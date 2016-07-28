FROM plone/plone:4.3.9-alpine
MAINTAINER Carlos Vieira <edu.carlos.vieira@gmail.com>
LABEL Name="Identidade Digital para o Governo Brasileiro Federal para Plone" \
      Version="1.1.4-alpine" \
      Architecture="x86_64" \
      Dockerfile_location="/root/buildinfo"

USER plone
COPY site.cfg /plone/instance/

USER root
COPY Dockerfile /root/buildinfo
# Para Pillow 2.7.0
RUN apk add --no-cache --virtual .build-deps \
    curl \
    bzip2-dev \
    gcc \
    libc-dev \
    ncurses-dev \
    openssl-dev \
    readline-dev \
    zlib-dev \
    sudo \
    make \
    libxml2-dev \
    libxslt-dev \
    libjpeg-turbo-dev \
    libpng-dev openssl \
 && sudo -u plone LIBRARY_PATH=/lib:/usr/lib bin/buildout -c site.cfg -t 300 \
 && apk del .build-deps \
 && rm -rf /plone/instance/buildout-cache/downloads/* \
 && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

