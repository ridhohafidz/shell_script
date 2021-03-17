#!/bin/bash
status=$(curl -Is "situs" | head -1)
code=$( echo $status | cut -d$' ' -f2)
if [ $code -gt 400 ]
then
        #echo -e "nama_situs $status"
        echo -e "nama_situs $status" | mail -s "Monitor Unhan Siakad" mridhohafidz12@gmai.com

fi
