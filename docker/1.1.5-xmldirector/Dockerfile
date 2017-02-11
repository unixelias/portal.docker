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
RUN buildDeps="python-virtualenv zlib1g-dev git-core wv expect gettext net-tools libprocps-dev patch libffi-dev libcurl4-openssl-dev curl sudo python-setuptools python-dev build-essential libldap2-dev libsasl2-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml-dev libgeos-c1 libgeos-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo -u plone bin/buildout -c site.cfg -t 300

RUN virtualenv .
RUN git clone https://github.com/xml-director/xmldirector.plonecore.git

WORKDIR xmldirector.plonecore
RUN git pull
RUN ../bin/python bootstrap.py --setuptools-version=7.0 --version=2.2.5 -c buildout-plone-4.3.cfg

WORKDIR /plone/instance
RUN rsync -upErvh /plone/instance/xmldirector.plonecore /plone/instance/
RUN sudo -u plone bin/buildout -Nv -t 300 \
  && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /plone/buildout-cache/downloads/* \
  && apt-get clean \
  && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

EXPOSE 8080 12120

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
