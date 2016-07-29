 #!/bin/bash
shopt -s extglob

for i in $( ls docker); do
  case "$i" in
       *-test )  ;;
       * ) docker build -t caduvieira/plonegovbridg:$i docker/$i ;;
  esac
done
