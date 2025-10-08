#!/bin/bash

# Validation script for Linux keyboard configurations
# Tests syntax and basic functionality where possible

echo "=== Linux Keyboard Configuration Validation ==="
echo ""

# Check if we're in an X11 environment
if [ -z "$DISPLAY" ]; then
    echo "⚠️  Warning: No X11 display detected. Running syntax validation only."
    echo "   Full functionality testing requires a graphical Linux environment."
    echo ""
fi

# Test script syntax
echo "🔍 Testing shell script syntax..."
scripts=("caps_lock_to_left_shift.sh" "right_command_to_shift.sh" "iso_to_ansi.sh" "numpad.sh" "catboard_arrows.sh" "install.sh")

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        if bash -n "$script" 2>/dev/null; then
            echo "✅ $script: Syntax OK"
        else
            echo "❌ $script: Syntax Error"
            bash -n "$script"
        fi
    else
        echo "❌ $script: File not found"
    fi
done

echo ""

# Test Python syntax
echo "🔍 Testing Python configuration syntax..."
python_configs=("numpad_xkeysnail.py" "catboard_arrows_xkeysnail.py")

for config in "${python_configs[@]}"; do
    if [ -f "$config" ]; then
        if python3 -m py_compile "$config" 2>/dev/null; then
            echo "✅ $config: Syntax OK"
        else
            echo "❌ $config: Syntax Error"
            python3 -m py_compile "$config"
        fi
    else
        echo "❌ $config: File not found"
    fi
done

echo ""

# Check for required tools
echo "🔍 Checking for required tools..."
tools=("xmodmap" "setxkbmap" "xbindkeys" "xdotool" "xev")
missing_tools=()

for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        echo "✅ $tool: Available"
    else
        echo "❌ $tool: Not found"
        missing_tools+=("$tool")
    fi
done

echo ""

# Check for xkeysnail
echo "🔍 Checking for xkeysnail..."
if python3 -c "import xkeysnail" 2>/dev/null; then
    echo "✅ xkeysnail: Available"
else
    echo "❌ xkeysnail: Not installed (pip3 install xkeysnail)"
fi

echo ""

# Test configuration loading (if tools are available)
if [ ${#missing_tools[@]} -eq 0 ] && [ -n "$DISPLAY" ]; then
    echo "🔍 Testing configuration loading..."

    # Test a simple xkb mapping
    echo "Testing xkb option setting..."
    if setxkbmap -option caps:shift 2>/dev/null; then
        echo "✅ xkb options: Working"
        setxkbmap -option  # Reset
    else
        echo "❌ xkb options: Failed"
    fi

    # Test xmodmap
    echo "Testing xmodmap..."
    current_caps=$(xmodmap -pk | grep -i caps_lock | awk '{print $1}')
    if [ -n "$current_caps" ]; then
        echo "✅ xmodmap: Working (Caps Lock keycode: $current_caps)"
    else
        echo "❌ xmodmap: Failed to read keymap"
    fi

else
    echo "⚠️  Skipping functionality tests (missing tools or no X11 environment)"
    echo "   Install missing tools with:"
    if [ ${#missing_tools[@]} -gt 0 ]; then
        echo "   - Debian/Ubuntu: sudo apt-get install x11-xserver-utils xbindkeys xdotool"
        echo "   - Arch Linux: sudo pacman -S xorg-xset xbindkeys xdotool"
        echo "   - Fedora: sudo dnf install xorg-x11-xset xbindkeys xdotool"
    fi
    echo "   - Python package: pip3 install xkeysnail"
fi

echo ""
echo "=== Validation Complete ==="
echo ""
echo "Next steps:"
echo "1. Run './install.sh' to set up the configurations"
echo "2. Load configurations with '~/.config/karabiner-linux/config.sh'"
echo "3. Start advanced features with '~/.config/karabiner-linux/start_xkeysnail.sh'"