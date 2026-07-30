# Troubleshooting Guide

This document provides solutions to common issues encountered during the deployment of the AWS Multi-Tier Web Application.

---

## Issue 1: Unable to Connect to EC2 via SSH

### Possible Causes

- Security Group does not allow port 22.
- Incorrect key pair.
- Incorrect public IP address.

### Solution

Verify:

- Port 22 is open.
- Correct PEM key is used.
- Correct EC2 Public IP.

---

## Issue 2: Website Not Loading

### Possible Causes

- Apache is not running.
- Security Group blocks HTTP.
- Route Table is incorrect.

### Solution

Run:

```bash
sudo systemctl status httpd
```

If stopped:

```bash
sudo systemctl restart httpd
```

Verify:

- Port 80 is open.
- Internet Gateway attached.
- Public IP assigned.

---

## Issue 3: Permission Denied (SSH)

```bash
chmod 400 key.pem
```

Reconnect.

---

## Issue 4: Apache Installation Failed

Update packages first.

```bash
sudo yum update -y
```

Then install Apache.

```bash
sudo yum install httpd -y
```

---

## Issue 5: EC2 Instance Not Reachable

Verify:

- Internet Gateway
- Route Table
- Security Group
- Network ACL

---

## Useful Commands

```bash
sudo systemctl status httpd

sudo systemctl restart httpd

sudo yum update -y

sudo yum install httpd -y
```

---

## References

- AWS EC2 Documentation
- AWS VPC Documentation
- Apache HTTP Server Documentation
