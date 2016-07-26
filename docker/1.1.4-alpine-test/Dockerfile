FROM caduvieira/plonegovbridg:1.1.4-alpine
MAINTAINER Carlos Vieira <edu.carlos.vieira@gmail.com>
LABEL Name="Identidade Digital para o Governo Brasileiro Federal para Plone - Imagem para testes"
LABEL Version="1.1.4-alpine-test"
LABEL Architecture="x86_64"

USER root
# libdbus-glib-1-2
RUN testDeps="xvfb wget bzip2 firefox-esr ca-certificates" \
  && apk add --no-cache $testDeps

USER plone
COPY test.cfg /plone/instance/
RUN bin/buildout -c test.cfg -t 300

USER root

ENV DISPLAY :99.0
RUN /usr/bin/Xvfb $DISPLAY -ac -screen 0 1024x768x16 +extension RANDR &

USER plone

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
