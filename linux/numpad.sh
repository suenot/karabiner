#!/bin/bash

# Numpad Configuration - Linux equivalent
# Maps keys to numpad when Alt key is held

echo "Setting up numpad configuration..."

# Using xbindkeys + xdotool for Alt + key -> numpad mappings
cat > /tmp/numpad_xbindkeys << 'EOF'
# xbindkeys configuration for numpad
# Save this as ~/.xbindkeysrc

# Alt + M = Numpad 0
"xdotool key KP_0"
    Alt + m

# Alt + Comma = Numpad 1
"xdotool key KP_1"
    Alt + comma

# Alt + Period = Numpad 2
"xdotool key KP_2"
    Alt + period

# Alt + Slash = Numpad 3
"xdotool key KP_3"
    Alt + slash

# Alt + K = Numpad 4
"xdotool key KP_4"
    Alt + k

# Alt + L = Numpad 5
"xdotool key KP_5"
    Alt + l

# Alt + Semicolon = Numpad 6
"xdotool key KP_6"
    Alt + semicolon

# Alt + I = Numpad 7
"xdotool key KP_7"
    Alt + i

# Alt + O = Numpad 8
"xdotool key KP_8"
    Alt + o

# Alt + P = Numpad 9
"xdotool key KP_9"
    Alt + p
EOF

echo "Configuration file created at /tmp/numpad_xbindkeys"
echo ""
echo "To install and use this configuration:"
echo "1. Install required packages:"
echo "   sudo apt-get install xbindkeys xdotool  # Debian/Ubuntu"
echo "   sudo pacman -S xbindkeys xdotool        # Arch Linux"
echo "   sudo dnf install xbindkeys xdotool      # Fedora"
echo ""
echo "2. Copy the configuration:"
echo "   cp /tmp/numpad_xbindkeys ~/.xbindkeysrc"
echo ""
echo "3. Load the configuration:"
echo "   xbindkeys -p"
echo ""
echo "4. Add xbindkeys to your startup applications"