#!/bin/bash
#
# Этот скрипт имитирует УСПЕШНЫЙ вывод команды 'ip -c a'
# для устройства "BR-SRV" на основе предоставленного файла конфигурации.
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

# [span_8](start_span)enp0s3: Статический IP (LAN)[span_8](end_span)
echo -e "2: ${BOLD}enp0s3${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:55:55:55 brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}192.168.4.2/27${NC} brd 192.168.4.31 ${CYAN}scope${NC} global enp0s3"
echo -e "       valid_lft forever preferred_lft forever"
