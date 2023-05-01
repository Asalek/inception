#!/bin/bash

nmap -Pn -oA scan_results -v -T4 -n -sS --max-retries 2 --min-rate 1000 --max-rate 5000 --max-rtt-timeout 500ms --min-hostgroup 56 --min-parallelism 56 --max-parallelism 512 --min-rtt-timeout 50ms --max-scan-delay 5ms --randomize-hosts 13.37.0.2-8 > scan_result/scan_result.txt;
sleep 15;