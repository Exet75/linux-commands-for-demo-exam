#!/bin{source: 1} /bash
#
# Этот скрипт имитирует УСПЕШНЫЙ вывод команды 'ip -c a'
# для устройства "ISP" на основе предоставленного файла конфигурации.
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

# [span_0](start_span)eth0: Настроен по DHCP[span_0](end_span). 
# Мы сымитируем, что он получил IP-адрес 10.0.2.15 (стандартный для NAT в VM).
echo -e "2: ${BOLD}eth0${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:aa:bb:cc brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}10.0.2.15/24${NC} brd 10.0.2.255 ${CYAN}scope${NC} global ${MAGENTA}dynamic${NC} eth0"
echo -e "       valid_lft 3595sec preferred_lft 3595sec"

# [span_1](start_span)eth1: Статический IP из файла[span_1](end_span)
echo -e "3: ${BOLD}eth1${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:dd:ee:ff brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}172.16.4.1/28${NC} brd 172.16.4.15 ${CYAN}scope${NC} global eth1"
echo -e "       valid_lft forever preferred_lft forever"

# [span_2](start_span)eth2: Статический IP из файла[span_2](end_span)
echo -e "4: ${BOLD}eth2${NC}: <BROADCAST,MULTICAST,${GREEN}UP${NC},LOWER_UP> mtu 1500 qdisc fq_codel state ${GREEN}UP${NC} group default qlen 1000"
echo -e "    link/ether 08:00:27:11:22:33 brd ff:ff:ff:ff:ff:ff ${GRAY}(Mock MAC)${NC}"
echo -e "    ${YELLOW}inet${NC} ${BOLD}172.16.5.1/28${NC} brd 172.16.5.15 ${CYAN}scope${NC} global eth2"
echo -e "       valid_lft forever preferred_lft forever"
