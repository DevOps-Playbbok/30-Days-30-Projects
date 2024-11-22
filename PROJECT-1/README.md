# Server Health Monitoring and Alert System

## Problem
The company faced frequent server downtime due to:
- Lack of real-time monitoring.
- Manual checks prone to delays and human error.
- Resource exhaustion (e.g., high CPU usage) leading to application crashes.
<img width="873" alt="Screenshot 2024-11-22 at 9 58 19 PM" src="https://github.com/user-attachments/assets/4b59a33c-ab9a-46a2-9672-1bbbd72b5d9a">

## Solution
We developed an automated server health monitoring system using a shell script to:
1. Monitor critical server metrics:
   - CPU usage
   - Memory usage
   - Disk space
2. Send alerts via:
   - Email
   - Slack
3. Generate logs for historical analysis.

## Features
- **Threshold-based Alerts**: Notify when resource usage exceeds predefined limits.
- **Integration with Slack and Email**: Ensure timely notifications to the team.
- **Extendable Design**: Add additional checks (e.g., database monitoring) as needed.

## How It Works
1. **Script Execution**: The shell script periodically checks server health using `cron`.
2. **Metric Collection**: The script collects CPU, memory, and disk usage data.
3. **Alert Trigger**: If thresholds are exceeded:
   - An email is sent using the `mail` utility.
   - A Slack message is sent using the Slack Webhook API.
4. **Logging**: All checks and alerts are logged for reference.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/DevOps-Playbbok/30-Days-30-Projects.git
   ```

2. Configure thresholds in the script:
   ```bash
   CPU_THRESHOLD=80
   MEMORY_THRESHOLD=80
   DISK_THRESHOLD=90
   ```

3. Set up Slack integration:
   > Obtain a Slack Webhook URL.
   > Add it to the script under the SLACK_WEBHOOK_URL variable.

4. Schedule the script using cron:
   ```bash
   crontab -e
   # Add the following line to run every 5 minutes:
   */5 * * * * /path/to/health_monitor.sh
   ```

