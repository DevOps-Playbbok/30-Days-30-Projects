#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

# Function to check CPU usage
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU_USAGE%"
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "Warning: CPU usage is above $CPU_THRESHOLD%!" | mail -s "High CPU Usage Alert" admin@example.com
    fi
}

# Function to check memory usage
check_memory() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $MEMORY_USAGE%"
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "Warning: Memory usage is above $MEMORY_THRESHOLD%!" | mail -s "High Memory Usage Alert" admin@example.com
    fi
}

# Function to check disk usage
check_disk() {
    DISK_USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//g')
    echo "Disk Usage: $DISK_USAGE%"
    if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        echo "Warning: Disk usage is above $DISK_THRESHOLD%!" | mail -s "High Disk Usage Alert" admin@example.com
    fi
}

# Run checks
check_cpu
check_memory
check_disk

