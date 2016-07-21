FROM plone/plone:4.3.9-alpine

USER root
RUN apk update && apk add --no-cache --upgrade ca-certificates

USER plone
COPY site.cfg /plone/instance/

RUN bin/buildout -c site.cfg
