FROM plone/plone:4.3.9

COPY site.cfg /plone/instance/
RUN bin/buildout -c site.cfg
