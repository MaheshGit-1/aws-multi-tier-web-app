# AWS Multi-Tier Web Application Deployment Guide

## Overview

This guide explains how to deploy a secure multi-tier web application on Amazon Web Services (AWS) using Amazon EC2, VPC, Security Groups, and Apache Web Server.

---

## Prerequisites

Before starting, ensure you have:

- AWS Account
- IAM User with Administrator Access
- AWS Management Console
- SSH Client (PuTTY or OpenSSH)
- Basic Linux knowledge

---

# Step 1: Create a VPC

- CIDR Block: 10.0.0.0/16
- Enable DNS Hostnames
- Enable DNS Resolution

---

# Step 2: Create a Public Subnet

- CIDR: 10.0.1.0/24
- Availability Zone: Any
- Enable Auto Assign Public IP

---

# Step 3: Create Internet Gateway

- Create Internet Gateway
- Attach it to the VPC

---

# Step 4: Configure Route Table

Create a Route Table and add:

Destination:
0.0.0.0/0

Target:
Internet Gateway

Associate the Route Table with the Public Subnet.

---

# Step 5: Launch EC2 Instance

Configuration:

- Amazon Linux 2
- t2.micro
- Public Subnet
- Enable Public IP

---

# Step 6: Configure Security Group

Inbound Rules

SSH (22)
Source:
Your IP

HTTP (80)
Source:
0.0.0.0/0

HTTPS (443)
Source:
0.0.0.0/0

---

# Step 7: Connect to EC2

```bash
ssh -i key.pem ec2-user@<Public-IP>
```

---

# Step 8: Install Apache

```bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

# Step 9: Deploy Application

Create a sample page:

```bash
echo "<h1>AWS Multi-Tier Web Application</h1>" | sudo tee /var/www/html/index.html
```

---

# Step 10: Verify Deployment

Open:

http://<Public-IP>

The web page should display successfully.

---

# Security Best Practices

- Restrict SSH access
- Follow Least Privilege IAM policies
- Keep the OS updated
- Use Security Groups instead of opening unnecessary ports

---

# Troubleshooting

### Apache not running

```bash
sudo systemctl status httpd
```

Restart Apache:

```bash
sudo systemctl restart httpd
```

### Website not opening

Check:

- Security Group
- Route Table
- Internet Gateway
- Apache Service

---

# Future Enhancements

- Application Load Balancer
- Auto Scaling
- Amazon RDS
- CloudWatch Monitoring
- HTTPS using ACM
- Route 53
