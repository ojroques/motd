#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")
SCRIPTS=(
    "10-hostname"
    "20-sysinfo"
    # "30-uptime"
    "40-diskspace"
    "50-services"
    "60-docker"
)

echo "INSTALLATION SCRIPT"
echo "------------------------------------------------------------"

echo "[UPDATING SYSTEM]"
apt update -y

echo -e "\n[FIGLET]"
apt install -y figlet

echo -e "\n[COPY FILES]"
for scr in "${SCRIPTS[@]}"; do
    cp -fv "$SCRIPT_DIR"/"$scr" /etc/update-motd.d/
done

echo "------------------------------------------------------------"
echo "Installation done."
