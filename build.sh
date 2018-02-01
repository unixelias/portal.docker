 #!/bin/bash
shopt -s extglob

for i in $( ls docker); do
 case "$i" in
      1.1.5.1|1.1.5.2|1.1.5.3|1.2|1.4 ) docker build -t unixelias/plone.idg:$i \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` docker/$i \
                   && docker push unixelias/plone.idg:$i
 esac
done
