#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ проверку DNS на "HQ-SRV"
#

# --- Цвета для реалистичности ---
PROMPT="root@hq-srv:~# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
NC='\033[0m'

clear

# Команда 1: Проверка внешнего DNS
echo -e "${PROMPT}${CMD_COLOR}ping google.com -c 3${NC}"
sleep 1
echo -e "${OUTPUT_COLOR}PING google.com (142.250.75.14) 56(84) bytes of data."
echo -e "64 bytes from 142.250.75.14 (142.250.75.14): icmp_seq=1 ttl=117 time=25.5 ms"
sleep 0.5
echo -e "64 bytes from 142.250.75.14 (142.250.75.14): icmp_seq=2 ttl=117 time=25.8 ms"
sleep 0.5
echo -e "64 bytes from 142.250.75.14 (142.250.75.14): icmp_seq=3 ttl=117 time=26.1 ms"
echo -e "--- google.com ping statistics ---"
echo -e "3 packets transmitted, 3 received, 0% packet loss, time 2005ms"
echo -e "rtt min/avg/max/mdev = 25.5/25.8/26.1/0.2 ms${NC}"
echo ""

# Команда 2: Проверка внутренней записи A (hq-rtr)
echo -e "${PROMPT}${CMD_COLOR}ping hq-rtr.au-team.irpo -c 3${NC}"
sleep 1
echo -e "${OUTPUT_COLOR}PING hq-rtr.au-team.irpo (192.168.1.1) 56(84) bytes of data."
echo -e "64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=0.892 ms"
sleep 0.5
echo -e "64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=0.910 ms"
sleep 0.5
echo -e "64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=0.855 ms"
echo -e "--- hq-rtr.au-team.irpo ping statistics ---"
echo -e "3 packets transmitted, 3 received, 0% packet loss, time 2004ms"
echo -e "rtt min/avg/max/mdev = 0.855/0.885/0.910/0.020 ms${NC}"
echo ""
