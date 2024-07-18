#!/bin/bash

while true; do
 for i in {1..3}; do
    echo 'DL interface 0'
    curl --interface uesimtun0 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    echo 'DL interface 1'
    curl --interface uesimtun1 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 2'
    curl --interface uesimtun2 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 3'
    curl --interface uesimtun3 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 4'
    curl --interface uesimtun4 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 5'
    curl --interface uesimtun5 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 6'
    curl --interface uesimtun6 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 7'
    curl --interface uesimtun7 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 8'
    curl --interface uesimtun8 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
        echo 'DL interface 9'
   #  curl --interface uesimtun9 -X GET "http://speedtest.lt.cherryservers.com/test-100mb" -o test.file
    echo 'Downloaded!!'
    done
 wait
 echo "new round"
 sleep 10

done