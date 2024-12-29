#!/bin/bash

PROJECT_SRC="$HOME/Cloud-1/ansible/inception_42"
PROJECT_DEST="/home/adminuser/"
VIRTUAL_ENV="/home/adminuser/inception_42/.env"
WORK_DIR="/home/adminuser/inception_42"


PUBLIC_IP=$(cat ./terraform/terraform.tfstate | grep -oP '"public_ip_address": "\K[^"]*' | grep -v null)


if [ -z "$PUBLIC_IP" ]; then
    echo "No public IP found in terraform.tfstate"
    exit 1
fi

IP_FILE="$HOME/Cloud-1/ansible/host_vars/"$PUBLIC_IP".yml"
touch "$IP_FILE"

echo "Created file: $PUBLIC_IP.yml"

echo "project_src: $PROJECT_SRC" >> "$IP_FILE"
echo "project_dest: $PROJECT_DEST" >> "$IP_FILE"
echo "virtual_env: $VIRTUAL_ENV" >> "$IP_FILE"
echo "work_dir: $WORK_DIR" >> "$IP_FILE"

INVENTORY="$HOME/Cloud-1/ansible/inventory"

echo "[machines]" > "$INVENTORY" 
echo "$PUBLIC_IP ansible_ssh_user=adminuser" >> "$INVENTORY" 

echo "This VM was created on $(date)"