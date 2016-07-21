FROM plone/plone:5.0.2-alpine

USER root
RUN apk update && apk add --no-cache --upgrade ca-certificates

USER 500
COPY site.cfg /plone/instance/

RUN bin/buildout -c site.cfg
