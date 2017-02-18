 #!/bin/bash
shopt -s extglob

#for i in $( ls docker); do
#  case "$i" in
#       *-test )  ;;
#       * ) docker build -t unixelias/plone.idg:$i docker/$i ;;
#  esac
#done

docker build -t unixelias/plone.idg:1.1.5-dev docker/1.1.5-dev
