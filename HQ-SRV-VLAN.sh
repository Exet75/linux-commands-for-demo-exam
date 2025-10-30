#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку VLAN 100 (Static) на "HQ-SRV"
#

# --- Цвета для реалистичности ---
PROMPT="\[\033[0;31m\]root@hq-srv\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
BOLD='\033[1m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки VLAN на HQ-SRV ---${NC}\n"
sleep 2

# Команда 1: Создание директории
echo -e "${PROMPT}${CMD_COLOR}mkdir /etc/net/ifaces/enp0s3.100${NC}"
sleep 0.5

# Команда 2: Настройка options
echo -e "${PROMPT}${CMD_COLOR}vim /etc/net/ifaces/enp0s3.100/options${NC}"
echo -e "${GRAY}(Имитация записи в файл: TYPE=vlan, HOST=enp0s3, VID=100, BOOTPROTO=static)${NC}"
sleep 1.5

# Команда 3: Настройка ipv4address
echo -e "${PROMPT}${CMD_COLOR}vim /etc/net/ifaces/enp0s3.100/ipv4address${NC}"
echo -e "${GRAY}(Имитация записи в файл: 192.168.1.2/26)${NC}"
sleep 1

# Команда 4: Настройка ipv4route
echo -e "${PROMPT}${CMD_COLOR}vim /etc/net/ifaces/enp0s3.100/ipv4route${NC}"
echo -e "${GRAY}(Имитация записи в файл: default via 192.168.1.1)${NC}"
sleep 1

# Команда 5: Перезапуск сети
echo -e "${PROMPT}${CMD_COLOR}systemctl restart network${NC}"
echo -e "${GRAY}(Имитация перезапуска сетевой службы...)${NC}"
sleep 3
echo ""

# Команда 6: Проверка IP
echo -e "${PROMPT}${CMD_COLOR}ip -c a${NC}"
sleep 0.5
echo -e "${OUTPUT_COLOR}1: ${BOLD}lo${NC}: <LOOPBACK,${GREEN}UP${NC},LOWER_UP> mtu 65536 qdisc noqueue state ${BOLD}UNKNOWN${NC} group default qlen 1000"
echo -e "    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00"
echo -e "    ${YELLOW}inet${NC} ${BOLD}127.0.0.1/8${NC} ${CYAN}scope${NC} host lo"
echo -e "       valid_lft forever preferred_lft forever"
echo -e "2: ${BOLD}enp0s3${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu
