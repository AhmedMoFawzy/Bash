#! /bin/bash

read -p "Enter URL: " url
for word in $(cat wordlist)
do 
    echo /$word
    curl $utl/$word.php
done
