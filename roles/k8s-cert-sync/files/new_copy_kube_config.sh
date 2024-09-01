#!/bin/bash

# Define variables
SOURCE_SERVER="k8s-m1"
SOURCE_PATH="/etc/kubernetes/admin.conf"
MGMT_SERVER="mgmt"
MGMT_DEST_PATH="/root/.kube/config"
MONITOR_SERVER="monitor"
MONITOR_DEST_PATH="/usr/lib/zabbix/.kube/config"

# Function to copy file using scp and update the file
copy_file() {
    local src_server=$1
    local src_path=$2
    local dest_server=$3
    local dest_path=$4

    echo "Copying $src_path from $src_server to $dest_server:$dest_path"
    scp root@$src_server:$src_path root@$dest_server:$dest_path

    echo "Updating $dest_path on $dest_server"
    ssh root@$dest_server "sed -i 's/127.0.0.1/k8s-m1/g' $dest_path"
}

# Copy admin.conf to mgmt server and update the file
copy_file $SOURCE_SERVER $SOURCE_PATH $MGMT_SERVER $MGMT_DEST_PATH
echo "Files copied and updated successfully on mgmt server."

# Copy admin.conf to monitor server and update the file
copy_file $SOURCE_SERVER $SOURCE_PATH $MONITOR_SERVER $MONITOR_DEST_PATH
echo "Files copied and updated successfully on monitor server."
