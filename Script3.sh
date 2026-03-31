#!/bin/bash
# ===================================================
# Script 3: Disk and Permission Auditor
# Author: Dinesh Vishwakarma
# Course: Open Source Software (OSS NGMC)
# Description: Audits key directories for size,
#              permissions, owner and group details
# ===================================================

# ----------- Directories to Audit -----------
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================================="
echo "        Directory Audit Report"
echo "=============================================="

# ----------- Loop Through Directories -----------
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        
        # Extract permissions, owner, group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        
        # Get directory size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "Directory : $DIR"
        echo "Permissions: $PERMS"
        echo "Owner      : $OWNER"
        echo "Group      : $GROUP"
        echo "Size       : $SIZE"
        echo "----------------------------------------------"
        
    else
        echo "Directory : $DIR does NOT exist"
        echo "----------------------------------------------"
    fi
done

# ----------- Python Config Directory Check -----------
echo ""
echo "Checking Python Configuration Directory..."
echo "----------------------------------------------"

PYTHON_DIR=$(python3 -c "import sysconfig; print(sysconfig.get_paths()['purelib'])" 2>/dev/null)

if [ -d "$PYTHON_DIR" ]; then
    PERMS=$(ls -ld "$PYTHON_DIR" | awk '{print $1, $3, $4}')
    echo "Python Library Directory Found:"
    echo "$PYTHON_DIR"
    echo "Permissions (Owner Group): $PERMS"
else
    echo "Python configuration directory not found."
fi

echo ""
echo "=============================================="
echo "            Audit Complete"
echo "=============================================="
