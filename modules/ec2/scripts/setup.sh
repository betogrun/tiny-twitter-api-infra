#!/bin/bash
apt update
apt upgrade -y
apt install -y docker.io curl git
usermod -a -G docker ubuntu
