#!/bin/bash
web=$(cat list.txt)

for i in $web; do
  echo "$i $(curl -Is $i | head -1)"
done
