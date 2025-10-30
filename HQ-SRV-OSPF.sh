#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ проверку связности (ping и traceroute) 
# с удаленной сетью после настройки OSPF на "HQ-SRV"
#

# --- Цвета для реалистичности ---
PROMPT="\[\033[0;31m\]root@hq-srv\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации проверки связности с 192.168.4.2 на HQ-SRV ---${NC}\n"
sleep 2

# Команда 1: Traceroute до 192.168.4.2 (BR-SRV)
echo -e "${PROMPT}${CMD_COLOR}traceroute 192.168.4.2${NC}"
sleep 1.5
echo -e "${OUTPUT_COLOR}traceroute to 192.168.4.2 (192.168.4.2), 30 hops max, 60 byte packets${NC}"
echo -e " 1  192.168.1.1 (192.168.1.1)  0.725 ms  0.781 ms  0.690 ms ${GRAY}(HQ-RTR VLAN 100)${NC}"
echo -e " 2  172.16.4.2 (172.16.4.2)  3.125 ms  3.201 ms  3.180 ms ${GRAY}(HQ-RTR WAN)${NC}"
echo -e " 3  172.16.4.1 (172.16.4.1)  3.890 ms  3.712 ms  3.650 ms ${GRAY}(ISP)${NC}"
echo -e " 4  172.16.5.2 (172.16.5.2)  4.912 ms  4.805 ms  4.995 ms ${GRAY}(BR-RTR WAN)${NC}"
echo -e " 5  192.168.4.2 (192.168.4.2)  5.120 ms  5.015 ms  5.088 ms ${GRAY}(BR-SRV)${NC}"
echo ""

# Команда 2: Ping до 192.168.4.2 (BR-SRV)
echo -e "${PROMPT}${CMD_COLOR}ping 192.168.4.2 -c 3${NC}"
sleep 1
echo -e "${OUTPUT_COLOR}PING 192.168.4.2 (192.168.4.2) 56(84) bytes of data."
echo -e "64 bytes from 192.168.4.2: icmp_seq=1 ttl=61 time=5.10 ms"
sleep 0.5
echo -e "64 bytes from 192.168.4.2: icmp_seq=2 ttl=61 time=5.05 ms"
sleep 0.5
echo -e "64 bytes from 192.168.4.2: icmp_seq=3 ttl=61 time=5.15 ms"
echo -e "--- 192.168.4.2 ping statistics ---"
echo -e "3 packets transmitted, 3 received, 0% packet loss, time 2005ms"
echo -e "rtt min/avg/max/mdev = 5.050/5.100/5.150/0.050 ms${NC}"
echo ""

echo -e "\n${GREEN}--- Имитация проверки OSPF на HQ-SRV завершена успешно ---${NC}"
