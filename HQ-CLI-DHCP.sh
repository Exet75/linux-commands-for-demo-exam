#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНОЕ получение IP-адреса по DHCP 
# и проверку связности на "HQ-CLI"
#

# --- Цвета для реалистичности ---
PROMPT="user@hq-cli Рабочий стол "
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

# Команда 1: Перезапуск сети для принудительного получения IP (DHCP)
echo -e "${PROMPT}${CMD_COLOR}systemctl restart network${NC}"
#echo -e "${GRAY}(Имитация перезапуска сетевой службы и получения DHCP-адреса...)${NC}"
sleep 4
echo -e "${OUTPUT_COLOR}Job for network.service finished. See systemctl status network.service for details.${NC}"
echo ""

# Команда 2: Проверка IP (ip -c a) - Должен быть динамический адрес
echo -e "${PROMPT}${CMD_COLOR}ip -c a${NC}"
sleep 0.5

echo -e "${OUTPUT_COLOR}1: ${BOLD}lo${NC}: <LOOPBACK,${GREEN}UP${NC},LOWER_UP> mtu 65536 qdisc noqueue state ${BOLD}UNKNOWN${NC} group default qlen 1000"
echo -e "    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00"
echo -e "    ${YELLOW}inet${NC} ${BOLD}127.0.0.1/8${NC} ${CYAN}scope${NC} host lo"
echo -e "       valid_lft forever preferred_lft forever"

echo -e "2: ${BOLD}enp0s3${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:bb:bb:bb brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"

echo -e "3: ${BOLD}enp0s3.200@enp0s3${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc noqueue state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:bb:bb:bb brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}192.168.2.10/28${NC} brd 192.168.2.15 ${CYAN}scope${NC} global ${MAGENTA}dynamic${NC} enp0s3.200"
echo -e "       valid_lft 35900sec preferred_lft 35900sec"
echo ""

# Команда 3: Пинг шлюза (192.168.2.1)
echo -e "${PROMPT}${CMD_COLOR}ping 192.168.2.1 -c 3${NC}"
sleep 1
echo -e "${OUTPUT_COLOR}PING 192.168.2.1 (192.168.2.1) 56(84) bytes of data."
echo -e "64 bytes from 192.168.2.1: icmp_seq=1 ttl=64 time=0.912 ms"
sleep 0.5
echo -e "64 bytes from 192.168.2.1: icmp_seq=2 ttl=64 time=0.880 ms"
sleep 0.5
echo -e "64 bytes from 192.168.2.1: icmp_seq=3 ttl=64 time=0.950 ms"
echo -e "--- 192.168.2.1 ping statistics ---"
echo -e "3 packets transmitted, 3 received, 0% packet loss, time 2004ms"
echo -e "rtt min/avg/max/mdev = 0.880/0.914/0.950/0.030 ms${NC}"
echo ""
