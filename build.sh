 #!/bin/bash
shopt -s extglob

#for i in $( ls docker); do
#  case "$i" in
#       *-test )  ;;
#       * ) docker build -t unixelias/plone.idg:$i \
#                    --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#                    --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
#                    && docker push unixelias/plone.idg:$i ;;
#  esac
#done

docker build -t unixelias/plone.idg:dev \
        --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
        --build-arg VCS_REF=`git rev-parse --short HEAD` docker/dev \
        && docker push unixelias/plone.idg:dev
