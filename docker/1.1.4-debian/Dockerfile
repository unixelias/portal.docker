FROM plone/plone:4.3.9-debian
MAINTAINER Carlos Vieira <edu.carlos.vieira@gmail.com>
LABEL Name="Identidade Digital para o Governo Brasileiro Federal para Plone"
LABEL Version="1.1.4-debian"
LABEL Architecture="x86_64"

USER plone
COPY site.cfg /plone/instance/

USER root
# Para Pillow 2.7.0
RUN buildDeps="curl sudo python-setuptools python-dev build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libyaml" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
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
