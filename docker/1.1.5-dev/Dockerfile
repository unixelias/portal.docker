FROM plone:4.3
MAINTAINER Elias Alves <elias.alves@ufvjm.edu.br>
LABEL Name="Modelo Plone v4.3 IDG escrito para implementação no Portal da UFVJM" \
      Version="1.1.5.3" \
      Architecture="x86_64" \
      Dockerfile_location="/root/buildinfo"

USER plone
COPY site.cfg /plone/instance/

USER root
COPY Dockerfile /root/buildinfo

# Para Pillow 2.7.0
RUN buildDeps=" \
          build-essential \
          curl \
          libbz2-dev \
          libldap2-dev \
          libjpeg62-turbo-dev \
          libgeos-c1 \
          libgeos-dev \
          libsasl2-dev \
          libssl-dev \
          libyaml-dev \
          libxml2-dev \
          libxslt1-dev \
          python-dev python-ldap \
          python-setuptools \
          sudo \
          \
          automake \
          autotools-dev \
          libedit-dev \
          libjemalloc-dev \
          libncurses5-dev \
          libpcre3-dev \
          libtool \
          pkg-config \
          python-docutils \
          python-sphinx \
          " \
 && runDeps=" \
          apt-transport-https \
          cron \
          varnish \
          " \
 && apt-get update \
 ## Instala as dependências para tempo de compilação
 && apt-get install -y --no-install-recommends $buildDeps \
 ## Instala as dependências para tempo de execução
 && apt-get update && apt-get install -y $runDeps \
 && sudo -u plone bin/buildout -c site.cfg -t 300 \
 && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /plone/buildout-cache/downloads/* \
 && apt-get clean \
 && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

EXPOSE 8080
EXPOSE 6081
EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["service varnish start && start"]
