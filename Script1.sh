#!/bin/bash
# ================================================
# Script 1: System Identity Report
# Author: Abhrant Singh
# Course: Open Source Software (OSS NGMC)
# Description: Displays key system information
# ================================================

# ----------- Variables -----------
STUDENT_NAME="Abhrant Singh"
SOFTWARE_CHOICE="Python"

# ----------- System Information -----------
KERNEL=$(uname -r)                     # Kernel version
USER_NAME=$(whoami)                   # Current user
HOME_DIR=$HOME                        # Home directory
UPTIME=$(uptime -p)                   # System uptime
DATE_TIME=$(date "+%A, %d %B %Y | %T") # Current date & time
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')

# ----------- Display Output -----------
echo "=============================================="
echo "      Open Source Audit — $STUDENT_NAME"
echo "=============================================="
echo "Chosen Software : $SOFTWARE_CHOICE"
echo ""
echo "System Information:"
echo "----------------------------------------------"
echo "Operating System : $DISTRO"
echo "Kernel Version   : $KERNEL"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME"
echo "Date & Time      : $DATE_TIME"
echo ""

# ----------- License Information -----------
echo "License Information:"
echo "----------------------------------------------"
echo "This Linux system is based on open-source software"
echo "primarily distributed under the GNU General Public License (GPL)."
echo ""
echo "=============================================="
echo "        End of System Report"
echo "=============================================="
