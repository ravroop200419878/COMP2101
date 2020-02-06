#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
myhostname=$(hostname)
interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
lan_ipaddress=$(ip a s $interface_name | awk '/inet /{gsub(/\/.*/,"");print $2}')
lan_hostname=$(getent hosts $lan_ipaddress | awk '{print $2}')
external_ip=$(curl -s icanhazip.com)
external_name=$(getent hosts $external_ip | awk '{print $2}')
router_address=$(route -n | grep 'UG[ \t]' | awk '{print $2}')
router_hostname=$(getent hosts | grep "$router_address" | awk '{print $2}')

cat <<EOF
Hostname        : $myhostname
LAN Address     : $lan_ipaddress
LAN Hostname    : $lan_hostname
External IP     : $external_ip
External Name   : $external_name
Router Address  : $router_address
Router Hostname : $router_hostname
EOF
