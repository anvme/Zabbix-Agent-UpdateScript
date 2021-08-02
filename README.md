# Zabbix-Agent-UpdateScript
Script for fast update Zabbix Agent on Ubuntu only.
Show installed version, get latest Zabbix agent version, allow to set own zabbix agent version for installation

* Run command below for installation
```sh
cd $HOME && git clone -v https://github.com/anvme/Zabbix-Agent-UpdateScript.git zabbixagentupdater && cd ./zabbixagentupdater && chmod +x ./update-zabbix-agent.sh
```
* Run update
```sh
/bin/bash ./update-zabbix-agent.sh
```
