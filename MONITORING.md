# Monitoring With Cloudwatch

## Table of contents

- [Monitoring With Cloudwatch](#monitoring-with-cloudwatch)
  - [Table of contents](#table-of-contents)
  - [What should we monitor](#what-should-we-monitor)
  - [How to](#how-to)
    - [Monitor CPU.](#monitor-cpu)
  - [Definitions](#definitions)

## What should we monitor

- Number of Users - Network
- CPU Utilization
- Memory Availability
- Status of the App (200) - Api call to check health of the instance.

## How to

### Monitor CPU.

- If CPU usage is over 50%, program Cloudwatch to send an Alarm (and or send an email using `SNS`) and make the logs available to the developers.
- Launch auto-scaling group. This will spin up more servers to increase CPU supply.

## Definitions

- **SNS** - `Simple Notifications Service`. We can attach an SNS to our cloudwatch. If we attach it to our cloudwatch, it will send an email/text message if something goes wrong.
- **Scaling Out** - Same size of servers, multiple instances (`t2micro` to multiple `t2micro`)
- **Scaling Up** - Bigger server (`t2micro` to `t2medium` or `t2large`)
