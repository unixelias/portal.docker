 #!/bin/bash
shopt -s extglob

last=""

for i in $( ls docker); do
 case "$i" in
      dev ) docker build -t unixelias/plone.idg:$i \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
                   && docker push unixelias/plone.idg:$i \
                   && last=$i ;;
 esac
done

# docker build -t unixelias/plone.idg:1.1.5-dev \
#         --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#         --build-arg VCS_REF=`git rev-parse --short HEAD` docker/1.1.5-dev \
#         && docker push unixelias/plone.idg:1.1.5-dev
