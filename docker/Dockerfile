FROM plone:4.3

MAINTAINER Elias Alves <elias.alves@ufvjm.edu.br>

ARG BUILD_DATE
ARG VCS_REF

LABEL Name="PloneGovBR" \
      Version="1.5.1" \
      Architecture="x86_64" \
      Dockerfile_location="/root/buildinfo" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="PloneGovBR" \
      org.label-schema.description="Modelo PloneGovBR escrito para implementação no Portal da UFVJM" \
      org.label-schema.url="http://portal.ufvjm.edu.br/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/unixelias/plone.idg" \
      org.label-schema.vendor="Elias Alves at UFVJM" \
      org.label-schema.version="1.5.1" \
      org.label-schema.version="latest" \
      org.label-schema.version="stable" \
      org.label-schema.version="production" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -p 8080:8080 -v ./data:/data unixelias/plone.idg:latest"

USER plone
COPY site.cfg /plone/instance/

USER root
COPY Dockerfile /root/buildinfo

# Para Pillow
RUN buildDeps=" \
            build-essential \
            libbz2-dev \
            libgeos-dev \
            libjpeg62-turbo-dev \
            libldap2-dev \
            libreadline-gplv2-dev \
            libsasl2-dev \
            libssl-dev \
            libxml2-dev \
            libxslt1-dev \
            python-dev \
            zlib1g-dev \
            " \
 && runDeps=" \
            cron \
            curl \
            git \
            libgeos-c1 \
            nano \
            python-imaging \
            python-pip \
            python-geopy \
            python-openid \
            python-setuptools \
            sudo \
            " \
 && apt-get update \
 ## Instala as dependências para tempo de compilação
 && pip install geopy \
 && apt-get install -y --no-install-recommends $buildDeps \
 ## Instala as dependências para tempo de execução
 && apt-get install -y $runDeps \
 && sudo -u plone bin/buildout -c site.cfg -t 300 \
 && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /plone/buildout-cache/downloads/* \
 && apt-get clean \
 && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start"]
