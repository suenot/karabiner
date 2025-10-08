#!/bin/bash

# Linux Keyboard Customization Installation Script
# Equivalent to Karabiner-Elements for macOS

echo "=== Linux Keyboard Customization Setup ==="
echo "This script sets up Linux equivalents for Karabiner-Elements configurations"
echo ""

# Detect distribution
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/arch-release ]; then
    DISTRO="arch"
elif [ -f /etc/fedora-release ]; then
    DISTRO="fedora"
else
    DISTRO="unknown"
fi

echo "Detected distribution: $DISTRO"

# Install required packages based on distribution
echo ""
echo "Installing required packages..."

case $DISTRO in
    "debian")
        sudo apt-get update
        sudo apt-get install -y x11-xserver-utils xbindkeys xdotool python3-pip
        ;;
    "arch")
        sudo pacman -Sy --noconfirm xorg-xset xbindkeys xdotool python-pip
        ;;
    "fedora")
        sudo dnf install -y xorg-x11-xset xbindkeys xdotool python3-pip
        ;;
    *)
        echo "Unknown distribution. Please install the following packages manually:"
        echo "- x11-xserver-utils (or xorg-xset)"
        echo "- xbindkeys"
        echo "- xdotool"
        echo "- python3-pip"
        ;;
esac

# Install xkeysnail for advanced mappings
echo ""
echo "Installing xkeysnail for advanced keyboard remapping..."
pip3 install xkeysnail --user

# Create configuration directory
echo ""
echo "Creating configuration directory..."
mkdir -p ~/.config/karabiner-linux

# Copy configuration files
echo ""
echo "Setting up configuration files..."

# Copy scripts to user's config directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR"/*.sh ~/.config/karabiner-linux/
cp "$SCRIPT_DIR"/*.py ~/.config/karabiner-linux/

# Make scripts executable
chmod +x ~/.config/karabiner-linux/*.sh

# Create a master configuration file
cat > ~/.config/karabiner-linux/config.sh << 'EOF'
#!/bin/bash

# Master configuration script for Linux keyboard customization
# Add/remove configurations as needed by uncommenting the desired ones

echo "Loading Linux keyboard customization configurations..."

# Basic remapping (xkb-based)
echo "- Caps Lock to Left Shift"
~/.config/karabiner-linux/caps_lock_to_left_shift.sh

# Uncomment desired configurations below:

# echo "- Right Command to Shift"
# ~/.config/karabiner-linux/right_command_to_shift.sh

# echo "- ISO to ANSI layout"
# ~/.config/karabiner-linux/iso_to_ansi.sh

# echo "- Numpad configuration"
# ~/.config/karabiner-linux/numpad.sh

# echo "- Catboard arrows navigation"
# ~/.config/karabiner-linux/catboard_arrows.sh

echo "Configuration loaded!"
echo "To start advanced remapping with xkeysnail, run:"
echo "  sudo ~/.config/karabiner-linux/start_xkeysnail.sh"
EOF

chmod +x ~/.config/karabiner-linux/config.sh

# Create xkeysnail startup script
cat > ~/.config/karabiner-linux/start_xkeysnail.sh << 'EOF'
#!/bin/bash

# Start xkeysnail with all Python configurations
echo "Starting xkeysnail with advanced keyboard remapping..."
echo "Note: This requires sudo permissions for keyboard access."

CONFIG_DIR="$HOME/.config/karabiner-linux"

# Check if xkeysnail is installed
if ! command -v xkeysnail &> /dev/null; then
    echo "xkeysnail not found. Please install it with:"
    echo "  pip3 install xkeysnail"
    exit 1
fi

# Load all Python configurations
CONFIG_FILES=()
for config in "$CONFIG_DIR"/*.py; do
    if [ -f "$config" ]; then
        CONFIG_FILES+=("$config")
    fi
done

if [ ${#CONFIG_FILES[@]} -eq 0 ]; then
    echo "No Python configuration files found in $CONFIG_DIR"
    exit 1
fi

echo "Loading configurations: ${CONFIG_FILES[*]}"

# Start xkeysnail
sudo xkeysnail "${CONFIG_FILES[@]}"

EOF

chmod +x ~/.config/karabiner-linux/start_xkeysnail.sh

# Create systemd user service for auto-start
cat > ~/.config/systemd/user/xkeysnail.service << 'EOF'
[Unit]
Description=xkeysnail keyboard remapping service
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 -m xkeysnail %h/.config/karabiner-linux/*.py
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Configuration files have been installed to: ~/.config/karabiner-linux/"
echo ""
echo "Quick Start:"
echo "1. Load basic configurations:"
echo "   ~/.config/karabiner-linux/config.sh"
echo ""
echo "2. Start advanced remapping:"
echo "   ~/.config/karabiner-linux/start_xkeysnail.sh"
echo ""
echo "3. Enable auto-start at login:"
echo "   systemctl --user enable xkeysnail.service"
echo "   systemctl --user start xkeysnail.service"
echo ""
echo "Available configurations:"
echo "- caps_lock_to_left_shift.sh: Caps Lock → Left Shift"
echo "- right_command_to_shift.sh: Right Win → Shift"
echo "- iso_to_ansi.sh: ISO → ANSI layout conversion"
echo "- numpad.sh: Alt + keys → Numpad"
echo "- catboard_arrows.sh: Super + IJKL → Arrows"
echo ""
echo "Python configurations for xkeysnail:"
echo "- numpad_xkeysnail.py: Advanced numpad mapping"
echo "- catboard_arrows_xkeysnail.py: Advanced navigation"
echo ""
echo "For help and troubleshooting, see the README files in the configuration directory."