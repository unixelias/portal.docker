 #!/bin/bash
shopt -s extglob

for i in $( ls docker); do
 case "$i" in
      *-test )  ;;
      * ) docker build -t unixelias/plone.idg:$i \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
                   && docker push unixelias/plone.idg:$i ;;
 esac
done

# docker build -t unixelias/plone.idg:1.1.5-dev \
#         --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#         --build-arg VCS_REF=`git rev-parse --short HEAD` docker/1.1.5-dev \
#         && docker push unixelias/plone.idg:1.1.5-dev
