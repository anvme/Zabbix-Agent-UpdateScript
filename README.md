# Zabbix-Agent-UpdateScript

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f7c07356783f4f1b82a6c6d845712199)](https://app.codacy.com/gh/anvme/Zabbix-Agent-UpdateScript?utm_source=github.com&utm_medium=referral&utm_content=anvme/Zabbix-Agent-UpdateScript&utm_campaign=Badge_Grade_Settings)

Script for fast update Zabbix Agent on Ubuntu only.
Show installed version, get latest Zabbix agent version, allow to set own zabbix agent version for installation

1.  Run command below for installation
```sh
cd $HOME && git clone -v https://github.com/anvme/Zabbix-Agent-UpdateScript.git zabbixagentupdater && cd ./zabbixagentupdater && chmod +x ./update-zabbix-agent.sh
```
2.  Run update
```sh
/bin/bash ./update-zabbix-agent.sh
```
