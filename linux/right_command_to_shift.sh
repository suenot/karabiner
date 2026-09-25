#!/bin/bash

# Right Command/Win Key to Shift - Linux equivalent
# Maps right Super (Win/Command) key to Shift

echo "Setting Right Super key to Shift..."

# Method 1: Using xmodmap (temporary - for current session)
echo "Mapping Right Super to Shift for current session..."
xmodmap -e "remove mod4 = Super_R"
xmodmap -e "add Shift = Super_R"

# Method 2: Create a persistent xmodmap file
cat > ~/.Xmodmap << 'EOF'
! Map Right Super key to Shift
remove mod4 = Super_R
add Shift = Super_R
EOF

echo "Configuration saved to ~/.Xmodmap"
echo ""
echo "To make this change persistent across reboots:"
echo "1. Add this line to your ~/.xsessionrc or ~/.xinitrc:"
echo "   xmodmap ~/.Xmodmap"
echo ""
echo "2. Or configure your desktop environment to load ~/.Xmodmap automatically"
echo ""
echo "To revert this change:"
echo "   xmodmap -e 'remove Shift = Super_R'"
echo "   xmodmap -e 'add mod4 = Super_R'"