#!/bin/bash
#pass generator 
echo "please enter the lengh of password you want to generate "
read lenght
for pass in $(seq 1);
do 
     echo `openssl rand -base64 48 | cut -c1-$lenght`
done

