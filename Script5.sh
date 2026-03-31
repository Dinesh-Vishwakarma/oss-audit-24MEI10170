#!/bin/bash
# ===================================================
# Script 5: Open Source Manifesto Generator
# Author: Dinesh Vishwakarma
# Course: Open Source Software (OSS NGMC)
# Description: Generates a personalized open source
#              philosophy statement based on user input
# ===================================================

echo "=============================================="
echo "     Open Source Manifesto Generator"
echo "=============================================="
echo ""
echo "Answer the following questions:"
echo ""

# ----------- User Input -----------
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# ----------- Variables -----------
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# ----------- Manifesto Creation -----------
echo "" > "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "        Open Source Manifesto" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "Author: $USER_NAME" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "I believe that open-source software represents true $FREEDOM." >> "$OUTPUT"
echo "Tools like $TOOL empower individuals to learn, create, and innovate without barriers." >> "$OUTPUT"
echo "In the future, I aim to build and share $BUILD with the global community," >> "$OUTPUT"
echo "contributing to a culture of collaboration, transparency, and continuous improvement." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just about code — it is about people, knowledge, and progress." >> "$OUTPUT"

# ----------- Output Display -----------
echo ""
echo "Manifesto successfully generated!"
echo "Saved as: $OUTPUT"
echo ""
echo "Preview:"
echo "----------------------------------------------"
cat "$OUTPUT"

echo ""
echo "=============================================="
echo "        Generation Complete"
echo "=============================================="

# Note: You can create an alias for quick access like:
# alias manifesto='./script5.sh'
