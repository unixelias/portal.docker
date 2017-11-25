 #!/bin/bash
shopt -s extglob

for i in $( ls docker); do
 case "$i" in
      dev ) docker build -t unixelias/plone.idg:$i \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
                   && docker push unixelias/plone.idg:$i ;;
 esac
done

docker login -u="$DOCKER_UFVJM_USERNAME" -p="$DOCKER_UFVJM_PASSWORD" hub.dds.ufvjm.edu.br;
docker tag unixelias/plone.idg:dev hub.dds.ufvjm.edu.br/dicom/portal:dev;
docker push hub.dds.ufvjm.edu.br/dicom/portal:dev
