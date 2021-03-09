#!/bin/bash
web=$(cat list.txt)

data=""

for i in $web; do
        status=$(curl -Is $i | head -1)
        code=$( echo $status | cut -d$' ' -f2)
        if [ $code -gt 400 ]
        then
                data+=" ${i} ${status} \n"
        fi
done

if [ ! -z "$data" ]
then
        echo -e "$data" | mail -s "Monitor" mridhohafidz12@gmail.com
        #echo -e "$data"
fi
