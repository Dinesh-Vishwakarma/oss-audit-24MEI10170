#!/bin/bash
# ===================================================
# Script 2: FOSS Package Inspector
# Author: Abhrant Singh
# Course: Open Source Software (OSS NGMC)
# Description: Checks if a package is installed,
#              displays version info, and prints
#              a philosophy note using case statement
# ===================================================

# ----------- Input -----------
PACKAGE=$1

# ----------- Input Validation -----------
if [ -z "$PACKAGE" ]; then
    echo "Usage: $0 <package-name>"
    echo "Example: $0 python3"
    exit 1
fi

echo "=============================================="
echo "        FOSS Package Inspector"
echo "=============================================="

# ----------- Check Installation -----------
if command -v dpkg &>/dev/null; then
    # Debian/Ubuntu systems
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "$PACKAGE is INSTALLED on this system."
        echo ""
        echo "Package Details:"
        dpkg -l | grep -w "$PACKAGE"
    else
        echo "$PACKAGE is NOT installed."
    fi

elif command -v rpm &>/dev/null; then
    # RedHat/CentOS systems
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE is INSTALLED on this system."
        echo ""
        echo "Package Details:"
        rpm -qi "$PACKAGE" | grep -E 'Name|Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed."
    fi
else
    echo "Unsupported package manager."
fi

echo ""

# ----------- Case Statement (Philosophy Notes) -----------
echo "Open Source Insight:"
echo "----------------------------------------------"

case $PACKAGE in
    python* )
        echo "Python: A community-driven language designed for simplicity and power."
        ;;
    apache2|httpd )
        echo "Apache: The web server that helped build the modern open internet."
        ;;
    mysql* )
        echo "MySQL: Open source at the core of countless applications worldwide."
        ;;
    firefox )
        echo "Firefox: A browser that stands for privacy and an open web."
        ;;
    git )
        echo "Git: A distributed version control system built for collaboration."
        ;;
    * )
        echo "This package represents the diversity of the open-source ecosystem."
        ;;
esac

echo ""
echo "=============================================="
echo "           Inspection Complete"
echo "=============================================="
