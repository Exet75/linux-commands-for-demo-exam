#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку NAT на "HQ-RTR"
#

# --- Цвета для реалистичности ---
PROMPT="\[\033[0;31m\]root@hq-rtr\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
CMD_COLOR='\033[1;37m'
OUTPUT_COLOR='\033[0m'
GREEN='\033[0;32m'
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки NAT на HQ-RTR ---${NC}\n"
sleep 2

# [span_7](start_span)Команда 1[span_7](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 192.168.1.0/26 -o eth0 -j MASQUERADE${NC}"
sleep 1

# [span_8](start_span)Команда 2 (собрана из[span_8](end_span) [span_9](start_span)и)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 192.168.2.0/28 -o eth0 -j MASQUERADE${NC}"
sleep 1

# Команда 3[span_9](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 192.168.3.0/29 -o eth0 -j MASQUERADE${NC}"
sleep 1

# [span_10](start_span)Команда 4: Проверка правил[span_10](end_span)
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
${GREEN}MASQUERADE${NC}  all  --  192.168.1.0/26       anywhere            
${GREEN}MASQUERADE${NC}  all  --  192.168.2.0/28       anywhere            
${GREEN}MASQUERADE${NC}  all  --  192.168.3.0/29       anywhere${NC}"
echo ""

# [span_11](start_span)Команда 5: Сохранение правил[span_11](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables-save > /root/rules${NC}"
sleep 1

# [span_12](start_span)Команда 6: Редактор[span_12](end_span)
echo -e "${PROMPT}${CMD_COLOR}export EDITOR=nano${NC}"
sleep 0.5

# [span_13](start_span)Команда 7: Crontab[span_13](end_span)
echo -e "${PROMPT}${CMD_COLOR}crontab -e${NC}"
sleep 1.5
echo -e "${OUTPUT_COLOR}no crontab for root - using an empty one
crontab: installing new crontab${NC}"
echo ""

# [span_14](start_span)Команда 8: Повторная проверка[span_14](end_span)
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
${GREEN}MASQUERADE${NC}  all  --  192.168.1.0/26       anywhere            
${GREEN}MASQUERADE${NC}  all  --  192.168.2.0/28       anywhere            
${GREEN}MASQUERADE${NC}  all  --  192.168.3.0/29       anywhere${NC}"
echo ""

echo -e "${GREEN}--- Имитация настройки NAT на HQ-RTR завершена успешно ---${NC}"
