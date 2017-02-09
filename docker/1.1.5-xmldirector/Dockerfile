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
RUN buildDeps="curl sudo python-setuptools python-dev build-essential libldap2-dev libsasl2-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml-dev libgeos-c1 libgeos-dev" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && sudo -u plone bin/buildout -c site.cfg -t 300

RUN echo deb http://ftp.de.debian.org/debian jessie-backports main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y  --no-install-recommends python-virtualenv zlib1g-dev git-core wv openjdk-8-jdk expect gettext net-tools libprocps-dev patch libffi-dev libcurl4-openssl-dev


USER plone
WORKDIR /home/plone

RUN curl -LO http://downloads.sourceforge.net/exist/Stable/2.2/eXist-db-setup-2.2.jar
ADD exist-setup.cmd /home/plone/exist-setup.cmd
RUN expect -f exist-setup.cmd
RUN rm eXist-db-setup-2.2.jar exist-setup.cmd
ENV EXIST_HOME /home/plone/exist

RUN virtualenv .
RUN bin/pip install grampg
RUN git clone https://github.com/xml-director/xmldirector.plonecore.git
WORKDIR xmldirector.plonecore
RUN git pull
RUN ../bin/python bootstrap.py --setuptools-version=7.0 --version=2.2.5 -c buildout-plone-5.0.cfg

RUN bin/buildout -c demo.cfg

RUN apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /plone/buildout-cache/downloads/* \
  && apt-get clean \
  && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

EXPOSE 8080 8443 12020

ADD start-all.sh /home/plone/start-all.sh
CMD /home/plone/start-all.sh
