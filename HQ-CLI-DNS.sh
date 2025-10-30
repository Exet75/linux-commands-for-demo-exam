#!/bin/bash

# Скрипт-имитация вывода команд на HQ-CLI (Раздел 9)

# Имитация успешного ping google.com (проверка доступа в интернет через NAT на HQ-RTR и ISP)
echo "=== Имитация вывода: ping google.com ==="
echo "PING google.com (142.250.75.14) 56(84) bytes of data."
echo "64 bytes from lhr48s17-in-f14.1e100.net (142.250.75.14): icmp_seq=1 ttl=117 time=25.5 ms"
echo "64 bytes from lhr48s17-in-f14.1e100.net (142.250.75.14): icmp_seq=2 ttl=117 time=26.1 ms"
echo "64 bytes from lhr48s17-in-f14.1e100.net (142.250.75.14): icmp_seq=3 ttl=117 time=25.8 ms"
echo "--- google.com ping statistics ---"
echo "3 packets transmitted, 3 received, 0% packet loss, time 2003ms"
echo "rtt min/avg/max/mdev = 25.545/25.845/26.130/0.237 ms"
echo ""

# Имитация успешного ping hq-rtr.au-team.irpo (проверка DNS резолвинга и доступности HQ-RTR)
# HQ-RTR: 192.168.1.1 (eth1.100), HQ-CLI IP: 192.168.2.11 (eth1.200)
# [span_0](start_span)В конфиге DNS: address=/hq-rtr.au-team.irpo/192.168.1.1[span_0](end_span)
echo "=== Имитация вывода: ping hq-rtr.au-team.irpo ==="
HQ_RTR_IP="192.168.1.1"
HQ_RTR_HOSTNAME="hq-rtr.au-team.irpo"
echo "PING $HQ_RTR_HOSTNAME ($HQ_RTR_IP) 56(84) bytes of data."
echo "64 bytes from $HQ_RTR_IP: icmp_seq=1 ttl=64 time=0.854 ms"
echo "64 bytes from $HQ_RTR_IP: icmp_seq=2 ttl=64 time=0.621 ms"
echo "64 bytes from $HQ_RTR_IP: icmp_seq=3 ttl=64 time=0.687 ms"
echo "--- $HQ_RTR_HOSTNAME ping statistics ---"
echo "3 packets transmitted, 3 received, 0% packet loss, time 2000ms"
echo "rtt min/avg/max/mdev = 0.621/0.720/0.854/0.096 ms"
echo ""

# Имитация успешного dig moodle.au-team.irpo (проверка CNAME резолвинга)
# [span_1](start_span)В конфиге DNS: cname=moodle.au-team.irpo,hq-rtr.au-team.irpo[span_1](end_span)
echo "=== Имитация вывода: dig moodle.au-team.irpo ==="
echo "; <<>> DiG 9.11.5-P4-5.1+deb10u8-Debian <<>> moodle.au-team.irpo"
echo ";; global options: +cmd"
echo ";; Got answer:"
echo ";; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18196"
echo ";; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0"
echo ""
echo ";; ANSWER SECTION:"
echo "moodle.au-team.irpo. 0 IN CNAME hq-rtr.au-team.irpo."
echo "hq-rtr.au-team.irpo. 0 IN A 192.168.1.1"
echo ""
echo ";; Query time: 0 msec"
[span_2](start_span)echo ";; SERVER: 192.168.1.2#53(192.168.1.2)[span_2](end_span)"
echo ";; WHEN: Wed Oct 29 02:53:42 EDT 2025"
echo ";; MSG SIZE  rcvd: 88"
echo ""

# Имитация успешного dig wiki.au-team.irpo (проверка CNAME резолвинга)
# [span_3](start_span)В конфиге DNS: cname=wiki.au-team.irpo,hq-rtr.au-team.irpo[span_3](end_span)
echo "=== Имитация вывода: dig wiki.au-team.irpo ==="
echo "; <<>> DiG 9.11.5-P4-5.1+deb10u8-Debian <<>> wiki.au-team.irpo"
echo ";; global options: +cmd"
echo ";; Got answer:"
echo ";; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 24789"
echo ";; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0"
echo ""
echo ";; ANSWER SECTION:"
echo "wiki.au-team.irpo. 0 IN CNAME hq-rtr.au-team.irpo."
echo "hq-rtr.au-team.irpo. 0 IN A 192.168.1.1"
echo ""
echo ";; Query time: 0 msec"
[span_4](start_span)echo ";; SERVER: 192.168.1.2#53(192.168.1.2)[span_4](end_span)"
echo ";; WHEN: Wed Oct 29 02:53:42 EDT 2025"
echo ";; MSG SIZE  rcvd: 86"
echo ""
