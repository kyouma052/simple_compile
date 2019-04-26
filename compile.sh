#!/bin/bash

clear
echo -n "Udah punya source kernel & toolchainnya belum ? :";
read source;

case $source in
    udah ) sh udah.sh
                  break   
                              ;;
    belum ) sh belum.sh
                  break
                  ;;
    *) echo "Udah punya tah belum tolol"
                  break
                  ;;
esac 