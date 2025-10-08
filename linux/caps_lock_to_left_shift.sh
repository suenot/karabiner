#!/bin/bash

# Caps Lock to Left Shift - Linux equivalent
# This script converts Caps Lock to Left Shift using XKB

# Method 1: Using setxkbmap (temporary - for current session)
echo "Setting Caps Lock to Left Shift for current session..."
setxkbmap -option caps:shift

# Method 2: Using localectl (persistent - survives reboot)
# Uncomment the line below for persistent configuration
# echo "Setting Caps Lock to Left Shift persistently..."
# localectl set-x11-keymap us pc105 "" caps:shift

echo "Caps Lock is now mapped to Left Shift"
echo "To make this change persistent across reboots, run:"
echo "  localectl set-x11-keymap us pc105 \"\" caps:shift"
echo ""
echo "To revert this change:"
echo "  setxkbmap -option"