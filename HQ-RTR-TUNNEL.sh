#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку IP-туннеля GRE на "HQ-RTR"
#

# --- Цвета для реалистичности ---
PROMPT="\[\033[0;31m\]root@hq-rtr\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
BOLD='\033[1m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
GRAY='\033[0;90m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки IP-туннеля на HQ-RTR ---${NC}\n"
sleep 2

# Команда 1: Создание tun (gre1)
echo -e "${PROMPT}${CMD_COLOR}ip tunnel add gre1 mode gre remote 172.16.5.2 local 172.16.4.2 ttl 255${NC}"
sleep 1

# Команда 2: Назначение IP-адреса
echo -e "${PROMPT}${CMD_COLOR}ip addr add 10.10.10.1/30 dev gre1${NC}"
sleep 1

# Команда 3: Поднятие интерфейса
echo -e "${PROMPT}${CMD_COLOR}ip link set gre1 up${NC}"
sleep 1

# Команда 4: Проверка IP (ip -c a)
echo -e "${PROMPT}${CMD_COLOR}ip -c a${NC}"
sleep 0.5

echo -e "${OUTPUT_COLOR}1: ${BOLD}lo${NC}: <LOOPBACK,${GREEN}UP${NC},LOWER_UP> mtu 65536 qdisc noqueue state ${BOLD}UNKNOWN${NC} group default qlen 1000"
echo -e "    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00"
echo -e "    ${YELLOW}inet${NC} ${BOLD}127.0.0.1/8${NC} ${CYAN}scope${NC} host lo"
echo -e "       valid_lft forever preferred_lft forever"

echo -e "2: ${BOLD}eth0${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:11:11:11 brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}172.16.4.2/28${NC} brd 172.16.4.15 ${CYAN}scope${NC} global eth0"
echo -e "       valid_lft forever preferred_lft forever"
# ... (Остальные интерфейсы eth1, vlan'ы опущены для краткости, но туннель добавлен)

echo -e "7: ${BOLD}gre1@NONE${NC}: <POINTOPOINT,NOARP,${GREEN}UP${NC},LOWER_UP> mtu 1476 qdisc noqueue state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/gre 172.16.4.2 peer 172.16.5.2 brd 0.0.0.0"
echo -e "    ${YELLOW}inet${NC} ${BOLD}10.10.10.1/30${NC} peer ${BOLD}10.10.10.2/30${NC} ${CYAN}scope${NC} global gre1"
echo -e "       valid_lft forever preferred_lft forever"
echo ""

echo -e "${GREEN}--- Имитация настройки IP-туннеля на HQ-RTR завершена успешно ---${NC}"
