FROM plone/plone:4.3.9-alpine

COPY site.cfg /plone/instance/

RUN bin/buildout -c site.cfg
