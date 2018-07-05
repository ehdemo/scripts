#!/bin/bash

DOMAIN=$1
MAXHOPS=30

# Get IP addresses of each hop
getHopAddress(){
    y=$(ping $1 -nn -c 1 -t $2)
    if [[ $y = *"rtt"* ]]; then
        echo "END"
    else
        x=$(ping $1 -nn -c 1 -t $2 | grep "From" | awk '{print $2}')
        if [[ $x == "" ]]; then
            echo "*"
        else
            if [[ $x = *"rtt"* ]]; then
                echo "END"
            else
                echo $x
            fi
        fi
    fi
}


# Get domain name from an IP address
getDomain(){
    x=$(host $1)
    if [[ $x = *"not found"* ]]; then
        echo "*"
    else
        echo ${x::-1} | awk '{print $NF}'
    fi
}


# Get the country code of an IP address
getCountry(){
    whois $1 | grep -i "Country" | awk '{print $NF}' | head -n1
}

# Get the RTT for a IP address
getRTT(){
    x=$(ping $1 -c 3 | grep "rtt" | awk '{print $4}' | awk -F "/" '{print $2}')
    if [[ $x == "" ]]; then
        echo "*"
    else
        echo $x
    fi
}


## RUN
# Print column names
printf "%-10s %-10s %-15s %-18s %-10s\n" "<Hop#>" "<RTT>" "<Country>" "<IP>" "<Domain>"

# For each hop (ttl upto maxhops)
for ttl in `seq 1 $MAXHOPS`
do
    addr=$(getHopAddress $DOMAIN $ttl)
    if [[ $addr == "*" ]]; then
        country="*"
        rtt="*"
        domain="*"
    elif [[ $addr == "END" ]]; then
        break
    else
        country=$(getCountry $addr)
        rtt=$(getRTT $addr)
        domain=$(getDomain $addr)
    fi
    printf "%-10s %-10s %-15s %-18s %-10s\n" "$ttl" "$rtt" "$country" "$addr" "$domain"
done
