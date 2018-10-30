 #!/bin/bash
shopt -s extglob

docker build -t unixelias/plone.idg:${TRAVIS_BRANCH} \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker;

docker push unixelias/plone.idg:${TRAVIS_BRANCH};
