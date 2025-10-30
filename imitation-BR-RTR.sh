#!/bin/bash
#
# Этот скрипт имитирует УСПЕШНЫЙ вывод команды 'ip -c a'
# для устройства "BR-RTR" на основе предоставленного файла конфигурации.
#

# --- Определение ANSI-кодов (для опции -c) ---
NC='\033[0m'       # No Color
BOLD='\033[1m'      # Bold
YELLOW='\033[1;33m' # Yellow
CYAN='\033[0;36m'   # Cyan
MAGENTA='\033[0;35m' # Magenta
GREEN='\033[0;32m'   # Green (for UP)
GRAY='\033[0;90m'   # Gray (for details)

# --- Имитация вывода ---

echo -e "1: ${BOLD}lo${NC}: <LOOPBACK,${GREEN}UP${NC},LOWER_UP> mtu 65536 qdisc noqueue state ${BOLD}UNKNOWN${NC} group default qlen 1000"
echo -e "    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00"
echo -e "    ${YELLOW}inet${NC} ${BOLD}127.0.0.1/8${NC} ${CYAN}scope${NC} host lo"
echo -e "       valid_lft forever preferred_lft forever"

# [span_5](start_span)eth0: Статический IP (WAN)[span_5](end_span)
echo -e "2: ${BOLD}eth0${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:33:33:33 brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}172.16.5.2/28${NC} brd 172.16.5.15 ${CYAN}scope${NC} global eth0"
echo -e "       valid_lft forever preferred_lft forever"

# [span_6](start_span)eth1: Статический IP (LAN)[span_6](end_span)
echo -e "3: ${BOLD}eth1${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:44:44:44 brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}192.168.4.1/27${NC} brd 192.168.4.31 ${CYAN}scope${NC} global eth1"
echo -e "       valid_lft forever preferred_lft forever"

# [span_7](start_span)gre1: Туннель[span_7](end_span)
echo -e "4: ${BOLD}gre1@NONE${NC}: <POINTOPOINT,NOARP,${GREEN}UP${NC},LOWER_UP> mtu 1476 qdisc noqueue state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/gre 0.0.0.0 brd 0.0.0.0"
echo -e "    ${YELLOW}inet${NC} ${BOLD}10.10.10.2/30${NC} peer ${BOLD}10.10.10.1/30${NC} ${CYAN}scope${NC} global gre1"
echo -e "       valid_lft forever preferred_lft forever"
