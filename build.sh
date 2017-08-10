#!/bin/bash
shopt -s extglob

for i in $( ls docker); do
  case "$i" in
       *-test )  ;;
       * ) docker build -t unixelias/plone.idg:$i docker/$i && docker push unixelias/plone.idg:$i ;;
  esac
done
