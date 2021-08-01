#!/bin/bash
clear >$(tty)
v=$(curl --silent https://cdn.zabbix.com/zabbix/binaries/stable/ 2>&1 | egrep -o '"[0-9]{1,2}.[0-9]{1,2}/"' | egrep -o '[0-9]{1,2}.[0-9]{1,2}' | sort -n | tail -n 1)

printf "\n\nInstallation version of Zabbix Agent will be $v \n"

printf "\n\n\nPlease confirm installation version of Zabbix Agent (Press Enter) or set version you need.\n"
read -e -i "$v" -p "Zabbix agent version: " input
v="${input:-$v}"

read -p "Ready to install Zabbix Agent version $v? Press Y or y" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    #Check current verion
    echo '================================Get Installed verion========================================'
    zabbix_agentd -V | head -n 1 | awk '{print "Installed zabbix-agent version: " $NF}'
    #Start download
    echo '================================Start download========================================'
    f=zabbix-release_$v-1+ubuntu$(lsb_release -sr)_all.deb
    release=https://repo.zabbix.com/zabbix/$v/ubuntu/pool/main/z/zabbix-release/zabbix-release_$v-1+ubuntu$(lsb_release -sr)_all.deb
    wget $release -O $f
    #Stop zabbix
    echo '================================Stop zabbix========================================'
    systemctl stop zabbix-agent
    #Install new version repo
    echo '================================Install new version repo========================================'
    dpkg -i $f
    rm $f
    apt-get update
    systemctl is-active --quiet zabbix-agent && echo "Zabbix-agent is running, press Ctrl+C to stop" && sleep 15 || echo "Zabbix-agent is NOT running"
    #Install new zabbix agent
    echo '================================Install new zabbix agent========================================'
    apt-get install --only-upgrade zabbix-agent
    #Start, status and check the version
    echo '================================Start and Status========================================'
    systemctl start zabbix-agent
    systemctl status zabbix-agent
    echo '================================Check the version========================================'
    zabbix_agentd -V | head -n 1 | awk '{print "New zabbix-agent version: " $NF}'
fi
