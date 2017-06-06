FROM plone:4.3
MAINTAINER Elias Alves <elias.alves@ufvjm.edu.br>
LABEL Name="Modelo Plone v4.3 IDG escrito para implementação no Portal da UFVJM" \
      Version="1.1.5.2" \
      Architecture="x86_64" \
      Dockerfile_location="/root/buildinfo"

USER plone
COPY site.cfg /plone/instance/

USER root
COPY Dockerfile /root/buildinfo

# Para Pillow 2.7.0
RUN buildDeps="curl sudo python-setuptools python-dev python-ldap build-essential libldap2-dev libsasl2-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml-dev libgeos-c1 libgeos-dev" \
 ### && runDeps="nano" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo -u plone bin/buildout -c site.cfg -t 300 \
 && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
 ### && apt-get install -y --no-install-recommends $runDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /plone/buildout-cache/downloads/* \
 && apt-get clean \
 && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
