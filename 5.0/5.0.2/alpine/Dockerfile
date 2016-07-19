FROM plone/plone:5.0.2-alpine

COPY site.cfg /plone/instance/

RUN bin/buildout -c site.cfg -v
