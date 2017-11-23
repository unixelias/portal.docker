 #!/bin/bash
shopt -s extglob

last=""

for i in $( ls docker); do
 case "$i" in
      *-test|dev  )  ;;
      *) docker build -t unixelias/plone.idg:$i \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
                   && docker push unixelias/plone.idg:$i \
                   && last=$i ;;
 esac
done

docker tag unixelias/plone.idg:$last unixelias/plone.idg:latest && docker push unixelias/plone.idg:latest;

docker login -u="$DOCKER_UFVJM_USERNAME" -p="$DOCKER_UFVJM_PASSWORD" hub.dds.ufvjm.edu.br;
docker tag unixelias/plone.idg:latest hub.dds.ufvjm.edu.br/dicom/portal:latest;
docker push hub.dds.ufvjm.edu.br/dicom/portal:latest 

# docker build -t unixelias/plone.idg:1.1.5-dev \
#         --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#         --build-arg VCS_REF=`git rev-parse --short HEAD` docker/1.1.5-dev \
#         && docker push unixelias/plone.idg:1.1.5-dev
