#!/bin/bash

# Infinite loop
while true; do
    for i in {1..3}; do
        for iface in $(seq 0 9); do
            echo "DL interface $iface"
            
            # Run curl with timeout and check throughput
            if ! curl --interface "uesimtun$iface" \
                      --max-time 60 \
                      --connect-timeout 10 \
                      -X GET "http://speedtest.lt.cherryservers.com/test-100mb" \
                      -o test.file; then
                echo "Error: Download failed on interface uesimtun$iface. Continuing..."
                continue
            fi

            # Check if file size is 0 (indicating 0 throughput)
            if [ ! -s test.file ]; then
                echo "Error: Download throughput is 0 on interface uesimtun$iface. Continuing..."
                continue
            fi

            echo "Downloaded on interface $iface!!"
        done
    done
    
    wait
    echo "New round"
    sleep 10
done
