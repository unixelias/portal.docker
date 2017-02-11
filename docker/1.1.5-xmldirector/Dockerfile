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

#Dependências xmldirector
#Instalação do Java
#RUN echo deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list
#RUN echo deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
#RUN apt-get install --fix-missing -y oracle-java8-installer
#RUN apt-get install oracle-java8-set-default
#Instala demais dependências
RUN apt-get install -y python-virtualenv zlib1g-dev git-core wv expect gettext net-tools libprocps-dev patch libffi-dev libcurl4-openssl-dev

# Para Pillow 2.7.0
RUN buildDeps="curl sudo python-setuptools python-dev build-essential libldap2-dev libsasl2-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml-dev libgeos-c1 libgeos-dev" \
 && apt-get install -y --no-install-recommends $buildDeps

RUN virtualenv .
RUN git clone https://github.com/xml-director/xmldirector.plonecore.git

WORKDIR xmldirector.plonecore
RUN git pull
RUN ../bin/python bootstrap.py --setuptools-version=7.0 --version=2.2.5 -c buildout-plone-4.3.cfg

WORKDIR /plone/instance
COPY base.cfg /plone/instance/
COPY dev-base.cfg /plone/instance/
COPY buildout-plone-4.3.cfg /plone/instance/
RUN rsync -upErvh /plone/instance/xmldirector.plonecore /plone/instance/
RUN sudo -u plone bin/buildout -c buildout-plone-4.3.cfg \
  && sudo -u plone bin/buildout -c site.cfg -Nv -t 300 \
  && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /plone/buildout-cache/downloads/* \
  && apt-get clean \
  && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +
USER plone

EXPOSE 8080 12120

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
