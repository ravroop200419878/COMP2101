#!/bin/bash
#####
# Once per host report
#####
my_hostname=$(hostname)
default_router_address=$(ip r s default| cut -d ' ' -f 3)
default_router_name=$(getent hosts $default_router_address|awk '{print $2}')
external_address=$(curl -s icanhazip.com)
external_name=$(getent hosts $external_address | awk '{print $2}')
cat <<EOF
System Identification Summary
=============================
Hostname      : $my_hostname
Default Router: $default_router_address
Router Name   : $default_router_name
External IP   : $external_address
External Name : $external_name
EOF
#####
# End of Once per host report
#####
#####
# Per-interface report
#####
interfaces=$(lshw -class network | awk '/logical name:/{print $3}')
for i in "${interfaces[@]}"; do
echo "$i"
if [[ $i = lo* ]] ; then continue ; fi
ipv4_address=$(ip a s $i | awk -F '[/ ]+' '/inet /{print $3}')
ipv4_hostname=$(getent hosts $ipv4_address | awk '{print $2}')
network_address=$(ip route list dev $i scope link|cut -d ' ' -f 1)
network_number=$(cut -d / -f 1 <<<"$network_address")
network_name=$(getent networks $network_number|awk '{print $1}')
echo Interface $i:
echo --------------------------------
echo Address         : $ipv4_address
echo Name            : $ipv4_hostname
echo Network Address : $network_address
echo Network Name    : $network_name
done
#####
# End of per-interface report
#####
