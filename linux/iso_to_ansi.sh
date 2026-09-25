#!/bin/bash

# ISO to ANSI Layout - Linux equivalent
# Converts ISO keyboard layout to ANSI layout

echo "Setting up ISO to ANSI layout conversion..."

# Method 1: Using setxkbmap to swap keys
echo "Swapping ISO/ANSI keys for current session..."
setxkbmap -option ''
# Swap section key (~) for backslash
xmodmap -e "keycode 49 = backslash bar backslash bar"
# Move backslash to section key position
xmodmap -e "keycode 51 = asciitilde grave asciitilde grave"

# Method 2: Create a comprehensive xmodmap file
cat > ~/.Xmodmap << 'EOF'
! ISO to ANSI keyboard layout conversion
! This swaps the positions of §/± and \| keys

! Section key (above Tab) becomes backslash pipe
keycode 49 = backslash bar backslash bar

! Backslash key (above Enter) becomes section plus
keycode 51 = asciitilde grave asciitilde grave

! Additional ISO-specific mappings if needed
! Uncomment and adjust as required for your specific layout

! Swap Enter and Backslash (for some ISO layouts)
! keycode 36 = Return
! keycode 108 = Return

! Left Shift key (for small ISO Enter key)
! keycode 22 = NoSymbol
! keycode 62 = Shift_L
EOF

echo "Configuration saved to ~/.Xmodmap"
echo ""
echo "To apply this configuration:"
echo "1. For current session:"
echo "   xmodmap ~/.Xmodmap"
echo ""
echo "2. For persistent configuration, add to startup:"
echo "   echo 'xmodmap ~/.Xmodmap' >> ~/.xprofile"
echo ""
echo "3. Alternative with setxkbmap (less precise but simpler):"
echo "   setxkbmap -variant us"
echo ""
echo "To revert to original layout:"
echo "   setxkbmap -layout us -variant altgr-intl"