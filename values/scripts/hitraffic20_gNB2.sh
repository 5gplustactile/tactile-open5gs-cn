#!/bin/bash

while true; do
 for i in {1..3}; do
    curl --interface uesimtun0 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    curl --interface uesimtun1 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    curl --interface uesimtun2 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    curl --interface uesimtun3 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    curl --interface uesimtun4 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    curl --interface uesimtun5 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
   #  curl --interface uesimtun6 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
   #  curl --interface uesimtun7 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
   #  curl --interface uesimtun8 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
   #  curl --interface uesimtun9 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    echo 'Downloaded!!'
    done
 wait
 echo "new round"
 sleep 10

done