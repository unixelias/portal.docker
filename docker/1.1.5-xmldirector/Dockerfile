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

RUN echo deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list
RUN echo deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install --fix-missing -y oracle-java8-installer
RUN apt-get install oracle-java8-set-default
RUN apt-get install -y python-virtualenv zlib1g-dev git-core wv expect gettext net-tools libprocps-dev patch libffi-dev libcurl4-openssl-dev


# Para Pillow 2.7.0
RUN buildDeps="curl sudo python-setuptools python-dev build-essential libldap2-dev libsasl2-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml-dev libgeos-c1 libgeos-dev" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps



RUN sudo -u plone bin/buildout -c site.cfg -t 300

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

USER root
RUN apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /plone/buildout-cache/downloads/* \
  && apt-get clean \
  && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone

EXPOSE 8080 8443 12020

ADD start-all.sh /home/plone/start-all.sh
CMD /home/plone/start-all.sh
