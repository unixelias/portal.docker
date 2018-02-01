 #!/bin/bash
shopt -s extglob

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

docker build -t unixelias/plone.idg:$branch \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$branch

docker push unixelias/plone.idg:$branch
