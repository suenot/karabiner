#!/bin/bash

# Catboard Arrows - Linux equivalent for IJKL navigation
# Maps IJKL keys to arrow keys when Super (Windows/Command) key is held

echo "Setting up Catboard arrows navigation..."

# This requires xkeysnail or a similar tool for complex modifier-based remapping
# Basic xmodmap approach can't handle modifier+key -> different key mappings

# Method 1: Using xbindkeys + xte (requires installation)
cat > /tmp/catboard_arrows_xbindkeys << 'EOF'
# xbindkeys configuration for Catboard arrows
# Save this as ~/.xbindkeysrc

# Super + I = Up Arrow
"xdotool key Up"
    Mod4 + i

# Super + K = Down Arrow
"xdotool key Down"
    Mod4 + k

# Super + J = Left Arrow
"xdotool key Left"
    Mod4 + j

# Super + L = Right Arrow
"xdotool key Right"
    Mod4 + l

# Super + U = Home (Cmd+Left)
"xdotool key Home"
    Mod4 + u

# Super + O = End (Cmd+Right)
"xdotool key End"
    Mod4 + o

# Super + P = Page Up
"xdotool key Page_Up"
    Mod4 + p

# Super + Semicolon = Page Down
"xdotool key Page_Down"
    Mod4 + semicolon

# Super + H = Enter
"xdotool key Return"
    Mod4 + h

# Super + Y = Escape
"xdotool key Escape"
    Mod4 + y

# Super + M = Backspace
"xdotool key BackSpace"
    Mod4 + m

# Super + Comma = Delete
"xdotool key Delete"
    Mod4 + comma
EOF

echo "Configuration file created at /tmp/catboard_arrows_xbindkeys"
echo ""
echo "To install and use this configuration:"
echo "1. Install required packages:"
echo "   sudo apt-get install xbindkeys xdotool  # Debian/Ubuntu"
echo "   sudo pacman -S xbindkeys xdotool        # Arch Linux"
echo "   sudo dnf install xbindkeys xdotool      # Fedora"
echo ""
echo "2. Copy the configuration:"
echo "   cp /tmp/catboard_arrows_xbindkeys ~/.xbindkeysrc"
echo ""
echo "3. Load the configuration:"
echo "   xbindkeys -p"
echo ""
echo "4. Add xbindkeys to your startup applications"
echo ""
echo "Alternative: Use xkeysnail for more advanced mapping"
echo "pip3 install xkeysnail"
echo "Then create a Python config file for more complex mappings"