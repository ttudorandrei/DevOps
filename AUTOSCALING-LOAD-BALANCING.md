# AWS Autoscaling and Load Balancing

## Table of Contents

- [AWS Autoscaling and Load Balancing](#aws-autoscaling-and-load-balancing)
  - [Table of Contents](#table-of-contents)
  - [What is Autoscaling](#what-is-autoscaling)
  - [What is Load Balancing](#what-is-load-balancing)
  - [Launch Template - Steps](#launch-template---steps)
  - [Load Balancing and Autoscaling - Steps](#load-balancing-and-autoscaling---steps)
  - [View your autoscaling group](#view-your-autoscaling-group)
  - [IMPORTANT! To stop autoscaling group](#important-to-stop-autoscaling-group)

## What is Autoscaling

Autoscaling automatically adjusts the amount of computational resources based on the server load.

## What is Load Balancing

Load Balancing distributes traffic between EC2 instances so that no one instance gets overwhelmed.

## Launch Template - Steps

- Login into AWS
- Go to EC2 Dashboard
- Click on Launch Template
- Click on Create Launch Template
- Name Your Template and use the same for Description
- Go To Template Tags, add a Name tag and name it as your Launch Template
- Got To App and OS Images
- Choose Ubuntu 18.04
- For instance type choose t2.micro
- Provide Key Pair name (eng103a)
- Don't include Network Settings in launch template
- Create two security groups. One for `HTTP`, allow from any IP on `port 80` and the second one for `ssh`, allow only from your IP for `port 22`

## Load Balancing and Autoscaling - Steps

- First create an Autoscaling Group
- Name it: `eng103a_tudor_asg_app`
- Select Launch Template
- Select Latest Version and click `Next`
- Choose Availability Zones (three of them)
- Click "Next"
- Choose `Attach to a new load balancer`
- Choose the appropriate one, in this case `Application Load Balancer`.
- Name the load balancer
- For balancer scheme choose `Internet Facing`
- Allow HTTP Portocol in `Listeners Group` and add new target group name `eng103a-tudor-listeners-groups-lb`
- Tick ELB under `Health Checks`
- Enable Group Metrics and click `next`
- For `Group Size`, Desired capacity = 2, min cap = 2, max cap = 3
- Next, choose `Target Tracking Scaling Policy`
- Name the policy, and change the Target Value to be 25
- Next x3
- You should be on the review page where you can review your choices or `Create Auto Scaling group`
- Once you create your Auto Scaling group, we should have two instances running (as we did choose minimum 2 instances)

## View your autoscaling group

- Go to your auto scaling group and click on it. You should be presented with the `Details` of your autoscaling group
- You can review and change the details of your autoscaling group

## IMPORTANT! To stop autoscaling group

- Go to Auto-scaling groups
- Delete Auto-scaling group !!!
