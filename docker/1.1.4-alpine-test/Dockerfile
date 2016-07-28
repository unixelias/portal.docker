FROM caduvieira/plonegovbridg:1.1.4-alpine
MAINTAINER Carlos Vieira <edu.carlos.vieira@gmail.com>
LABEL Name="Identidade Digital para o Governo Brasileiro Federal para Plone - Imagem para testes" \
      Version="1.1.4-alpine-test" \ 
      Architecture="x86_64"

USER root

RUN testDeps="dbus firefox-esr fontconfig python ttf-freefont xvfb xvfb ca-certificates" \
  && apk add --no-cache $testDeps

USER plone
COPY test.cfg /plone/instance/
RUN bin/buildout -c test.cfg -t 300

USER root

ENV DISPLAY :99.0

ADD back-xvfb .
RUN chmod +x back-xvfb 

EXPOSE 8080
CMD ["./back-xvfb"]
