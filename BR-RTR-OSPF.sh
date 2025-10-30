#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку OSPF на "BR-RTR" (FRR)
#

# --- Цвета для реалистичности ---
PROMPT_SHELL="\[\033[0;31m\]root@br-rtr\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
PROMPT_VTYSH="\033[0;32mbr-rtr#\033[0m"
PROMPT_CONF_VTYSH="\033[0;32mbr-rtr(config)#\033[0m"
PROMPT_IF_VTYSH="\033[0;32mbr-rtr(config-if)#\033[0m"
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки OSPF на BR-RTR ---${NC}\n"
sleep 1

echo -e "${PROMPT_SHELL}${CMD_COLOR}apt update && apt install frr -y${NC}"
echo -e "${GRAY}(Имитация установки FRR...)${NC}"
sleep 2

echo -e "${PROMPT_SHELL}${CMD_COLOR}sed -i 's/ospfd=no/ospfd=yes/g' /etc/frr/daemons${NC}"
echo -e "${PROMPT_SHELL}${CMD_COLOR}systemctl restart frr${NC}"
sleep 1
echo ""

# Имитация входа в vtysh и настройки
echo -e "${PROMPT_SHELL}${CMD_COLOR}vtysh${NC}"
sleep 1

echo -e "${PROMPT_VTYSH}${CMD_COLOR}conf t${NC}"
echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}router ospf${NC}"

echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}network 10.10.10.0/30 area 0${NC}"
sleep 0.3
echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}network 192.168.4.0/27 area 0${NC}"
sleep 0.3

echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}do wr mem${NC}"
echo -e "${OUTPUT_COLOR}% Saving configuration to /etc/frr/ospfd.conf${NC}"
sleep 1

echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}int gre1${NC}"

echo -e "${PROMPT_IF_VTYSH}${CMD_COLOR}ip ospf authentication message-digest${NC}"
sleep 0.3
echo -e "${PROMPT_IF_VTYSH}${CMD_COLOR}ip ospf message-digest-key 1 md5 P@ssw0rd${NC}"
sleep 0.3

echo -e "${PROMPT_IF_VTYSH}${CMD_COLOR}do wr mem${NC}"
echo -e "${OUTPUT_COLOR}% Saving configuration to /etc/frr/ospfd.conf${NC}"
sleep 1

# Проверка соседей
echo -e "${PROMPT_IF_VTYSH}${CMD_COLOR}exit${NC}"
echo -e "${PROMPT_CONF_VTYSH}${CMD_COLOR}exit${NC}"
echo -e "${PROMPT_VTYSH}${CMD_COLOR}show ip ospf neighbor${NC}"
sleep 1.5
echo -e "${OUTPUT_COLOR}Neighbor ID     Pri State           Dead Time Address         Interface        ${NC}"
echo -e "192.168.1.1     1   ${GREEN}Full/BDR${NC}          38s      10.10.10.1      gre1${NC}"
echo ""

echo -e "${PROMPT_VTYSH}${CMD_COLOR}exit${NC}"

echo -e "\n${GREEN}--- Имитация настройки OSPF на BR-RTR завершена успешно ---${NC}"
