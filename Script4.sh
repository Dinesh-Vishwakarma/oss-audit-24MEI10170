#!/bin/bash
# ===================================================
# Script 4: Log File Analyzer (HealthApp.log version)
# Author: Dinesh Vishwakarma
# ===================================================

# ----------- Default File -----------
LOGFILE="HealthApp.log"
KEYWORD=${1:-"error"}   # You can still pass keyword if needed

COUNT=0

echo "=============================================="
echo "        Log File Analyzer"
echo "=============================================="

# ----------- Check File Exists -----------
if [ ! -f "$LOGFILE" ]; then
    echo "Error: '$LOGFILE' not found in current directory."
    exit 1
fi

# ----------- Check Empty File -----------
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' is empty."
    exit 1
fi

# ----------- Read File Line by Line -----------
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# ----------- Output -----------
echo ""
echo "Analyzing File: $LOGFILE"
echo "Keyword '$KEYWORD' found $COUNT times."

echo ""
echo "Last 5 matching lines:"
echo "----------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5

echo ""
echo "=============================================="
echo "        Analysis Complete"
echo "=============================================="
