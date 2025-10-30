#!/bin/bash
#
# Скрипт, имитирующий УСПЕШНУЮ настройку NAT на "ISP"
#

# --- Цвета для реалистичности ---
# $PROMPT (root@isp:~# )
PROMPT="\[\033[0;31m\]root@isp\[\033[0m\]:\[\033[0;34m\]~\[\033[0m\]# "
# $CMD_COLOR (Белый жирный)
CMD_COLOR='\033[1;37m'
# $OUTPUT_COLOR (Обычный)
OUTPUT_COLOR='\033[0m'
# $GREEN (Зеленый)
GREEN='\033[0;32m'
# $NC (Нет цвета)
NC='\033[0m'

clear
echo -e "${GREEN}--- Начало имитации настройки NAT на ISP ---${NC}\n"
sleep 2

# [span_0](start_span)Команда 1[span_0](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 172.16.4.0/28 -o eth0 -j MASQUERADE${NC}"
sleep 1 # Имитация выполнения

# [span_1](start_span)Команда 2[span_1](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables -t nat -A POSTROUTING -s 172.16.5.0/28 -o eth0 -j MASQUERADE${NC}"
sleep 1

# [span_2](start_span)Команда 3: Проверка правил[span_2](end_span)
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
${GREEN}MASQUERADE${NC}  all  --  172.16.4.0/28        anywhere            
${GREEN}MASQUERADE${NC}  all  --  172.16.5.0/28        anywhere${NC}"
echo ""

# [span_3](start_span)Команда 4: Сохранение правил[span_3](end_span)
echo -e "${PROMPT}${CMD_COLOR}iptables-save > /root/rules${NC}"
sleep 1

# [span_4](start_span)Команда 5: Редактор[span_4](end_span)
echo -e "${PROMPT}${CMD_COLOR}export EDITOR=nano${NC}"
sleep 0.5

# [span_5](start_span)Команда 6: Crontab[span_5](end_span)
echo -e "${PROMPT}${CMD_COLOR}crontab -e${NC}"
sleep 1.5
echo -e "${OUTPUT_COLOR}no crontab for root - using an empty one
crontab: installing new crontab${NC}"
echo ""

# [span_6](start_span)Команда 7: Повторная проверка[span_6](end_span)
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
${GREEN}MASQUERADE${NC}  all  --  172.16.4.0/28        anywhere            
${GREEN}MASQUERADE${NC}  all  --  172.16.5.0/28        anywhere${NC}"
echo ""

echo -e "${GREEN}--- Имитация настройки NAT на ISP завершена успешно ---${NC}"
