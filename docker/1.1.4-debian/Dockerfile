FROM plone/plone:4.3.9

USER plone
COPY site.cfg /plone/instance/

USER root
# Para Pillow 2.7.0
RUN buildDeps="curl sudo python-setuptools python-dev build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo -u plone bin/buildout -c site.cfg -v -t 300 \
 && sudo -u plone pip install selenium \
 && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps \
 && apt-get install -y --no-install-recommends xserver-xephyr xvfb iceweasel \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /plone/buildout-cache/downloads/* \
 && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +

USER plone


COPY xvfb /etc/init.d/
RUN chmod +x /etc/init.d/xvfb

RUN /etc/init.d/xvfb start
ENV DISPLAY :99.0
RUN firefox &
