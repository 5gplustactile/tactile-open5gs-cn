#!/bin/bash

# Infinite loop
while true; do
    for i in {1..3}; do
        for iface in $(seq 0 9); do
            echo "DL interface $iface"
            
            # Run 3 curl requests in parallel
            {
                if ! curl --interface "uesimtun$iface" \
                          --max-time 60 \
                          --connect-timeout 10 \
                          -X GET "http://speedtest.lt.cherryservers.com/test-100mb" \
                          -o test_$iface_1.file; then
                    echo "Error: Download 1 failed on interface uesimtun$iface."
                elif [ ! -s test_$iface_1.file ]; then
                    echo "Error: Download 1 throughput is 0 on interface uesimtun$iface."
                else
                    echo "Downloaded 1 on interface $iface!!"
                fi
            } &  # Background process 1

            {
                if ! curl --interface "uesimtun$iface" \
                          --max-time 60 \
                          --connect-timeout 10 \
                          -X GET "http://speedtest.lt.cherryservers.com/test-100mb" \
                          -o test_$iface_2.file; then
                    echo "Error: Download 2 failed on interface uesimtun$iface."
                elif [ ! -s test_$iface_2.file ]; then
                    echo "Error: Download 2 throughput is 0 on interface uesimtun$iface."
                else
                    echo "Downloaded 2 on interface $iface!!"
                fi
            } &  # Background process 2

            {
                if ! curl --interface "uesimtun$iface" \
                          --max-time 60 \
                          --connect-timeout 10 \
                          -X GET "http://speedtest.lt.cherryservers.com/test-100mb" \
                          -o test_$iface_3.file; then
                    echo "Error: Download 3 failed on interface uesimtun$iface."
                elif [ ! -s test_$iface_3.file ]; then
                    echo "Error: Download 3 throughput is 0 on interface uesimtun$iface."
                else
                    echo "Downloaded 3 on interface $iface!!"
                fi
            } &  # Background process 3

            # Wait for the 3 background processes to complete
            wait
        done
    done
    
    echo "New round"
    sleep 10
done
