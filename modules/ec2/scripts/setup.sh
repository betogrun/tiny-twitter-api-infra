#!/bin/bash
apt-get update
apt-get install -y nginx
apt-get install -y postgresql-client
systemctl start nginx
