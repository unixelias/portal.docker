 #!/bin/bash
shopt -s extglob

TAG=`git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,'`

docker build -t unixelias/plone.idg:${TAG} \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/${TAG}

docker push unixelias/plone.idg:${TAG}
