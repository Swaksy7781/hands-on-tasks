#!/bin/bash

DATE=$(date +"%Y-%m-%d")
PROCESS_LOG="process_log_$DATE.log"
HIGH_LOG="high_mem_processes.log"

echo "Logging all running processes to $PROCESS_LOG..."
ps aux > "$PROCESS_LOG"
echo "Process log created successfully."

high_mem_processes=$(ps aux | awk '$4 > 30 {OFS="\t"; print $0}')

if [ -n "$high_mem_processes" ]; then
    echo "WARNING: The following processes are using more than 30% of system memory:"
    echo "--------------------------------------------------"
    echo "$high_mem_processes"
    echo "High Memory Usage Report - Generated on: $(date)" >> "$HIGH_LOG"
    echo "$high_mem_processes" >> "$HIGH_LOG"
fi

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [[ "$DISK_USAGE" -gt 80 ]]; then
    echo "WARNING: Disk usage on / is above 80%!"
fi

TOTAL_PROCESSES=$(ps aux | wc -l)
NUM_HIGH_MEM=$(echo "$high_mem_processes" | wc -l)

if [[ "$NUM_HIGH_MEM" -gt 0 ]]; then
    NUM_HIGH_MEM=$((NUM_HIGH_MEM))
fi

echo "========== System Health Summary =========="
echo "Total Running Processes         : $TOTAL_PROCESSES"
echo "Processes >30% Memory Usage     : $NUM_HIGH_MEM"
echo "Disk Usage on /                 : ${DISK_USAGE}%"
echo "==========================================="