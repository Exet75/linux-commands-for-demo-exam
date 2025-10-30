#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку NAT на "BR-RTR"
#

# --- Цвета для реалистичности ---
PROMPT="\[\033[0;31m\]root@br-rtr\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки NAT на BR-RTR ---${NC}\n"
sleep 2

# [span_15](start_span)Команда 1[span_15](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 192.168.4.0/27 -o eth0 -j MASQUERADE${NC}"
sleep 1

# [span_16](start_span)Команда 2: Проверка правил[span_16](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -L${NC}"
sleep 0.5
echo -e "${OUTPUT_COLOR}Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
${GREEN}MASQUERADE${NC}  all  --  192.168.4.0/27       anywhere${NC}"
echo ""

# [span_17](start_span)Команда 3: Сохранение правил[span_17](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables-save > /root/rules${NC}"
sleep 1

# [span_18](start_span)Команда 4: Редактор[span_18](end_span)
echo -e "${PROMPT}${CMD_COLOR}export EDITOR=nano${NC}"
sleep 0.5

# [span_19](start_span)Команда 5: Crontab[span_19](end_span)
echo -e "${PROMPT}${CMD_COLOR}crontab -e${NC}"
sleep 1.5
echo -e "${OUTPUT_COLOR}no crontab for root - using an empty one
crontab: installing new crontab${NC}"
echo ""

# [span_20](start_span)Команда 6: Повторная проверка[span_20](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -L${NC}"
sleep 0.5
echo -e "${OUTPUT_COLOR}Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
${GREEN}MASQUERADE${NC}  all  --  192.168.4.0/27       anywhere${NC}"
echo ""

echo -e "${GREEN}--- Имитация настройки NAT на BR-RTR завершена успешно ---${NC}"
