# Linux Keyboard Customization

This directory contains Linux equivalents for the Karabiner-Elements configurations available for macOS. These scripts and configuration files provide similar keyboard customization functionality for Linux users.

## What's Included

### Installation and Setup
- **`install.sh`** - Automatic installation script that sets up all required dependencies and configurations

### Basic Configurations (xkb/xmodmap based)
- **`caps_lock_to_left_shift.sh`** - Maps Caps Lock to Left Shift
- **`right_command_to_shift.sh`** - Maps Right Win/Super key to Shift
- **`iso_to_ansi.sh`** - Converts ISO keyboard layout to ANSI layout
- **`numpad.sh`** - Alt + key combinations → Numpad numbers
- **`catboard_arrows.sh`** - Super + IJKL → Arrow navigation

### Advanced Configurations (xkeysnail based)
- **`numpad_xkeysnail.py`** - Advanced numpad mapping with better modifier support
- **`catboard_arrows_xkeysnail.py`** - Comprehensive navigation mapping

## Quick Start

### 1. Automatic Installation

```bash
# Clone or download the repository
cd linux

# Run the installation script
chmod +x install.sh
./install.sh
```

The installation script will:
- Detect your Linux distribution
- Install required packages (xbindkeys, xdotool, xkeysnail, etc.)
- Set up configuration files in `~/.config/karabiner-linux/`
- Create startup scripts and systemd services

### 2. Manual Setup

If you prefer manual setup, follow these steps:

#### Install Dependencies

**Debian/Ubuntu:**
```bash
sudo apt-get install x11-xserver-utils xbindkeys xdotool python3-pip
pip3 install xkeysnail --user
```

**Arch Linux:**
```bash
sudo pacman -Sy xorg-xset xbindkeys xdotool python-pip
pip install xkeysnail --user
```

**Fedora:**
```bash
sudo dnf install xorg-x11-xset xbindkeys xdotool python3-pip
pip3 install xkeysnail --user
```

#### Load Configurations

**Basic mappings (immediate effect):**
```bash
~/.config/karabiner-linux/config.sh
```

**Advanced mappings (requires xkeysnail):**
```bash
~/.config/karabiner-linux/start_xkeysnail.sh
```

## Configuration Details

### Caps Lock to Left Shift
- **Script:** `caps_lock_to_left_shift.sh`
- **Method:** XKB option `caps:shift`
- **Effect:** Caps Lock behaves as Left Shift
- **Persistence:** Use `localectl` for permanent change

### Right Command to Shift
- **Script:** `right_command_to_shift.sh`
- **Method:** xmodmap
- **Effect:** Right Win/Super key acts as Shift
- **Persistence:** Add to `~/.Xmodmap` and startup scripts

### Navigation (IJKL as Arrows)
- **Script:** `catboard_arrows.sh` or `catboard_arrows_xkeysnail.py`
- **Method:** xbindkeys/xdotool or xkeysnail
- **Mappings:**
  - Super + IJKL → Arrow keys
  - Super + UO → Home/End
  - Super + P; → Page Up/Down
  - Super + H → Enter
  - Super + Y → Escape
  - Super + M → Backspace
  - Super + , → Delete

### Numpad (Alt + Keys)
- **Script:** `numpad.sh` or `numpad_xkeysnail.py`
- **Method:** xbindkeys/xdotool or xkeysnail
- **Mappings:**
  - Alt + M → Numpad 0
  - Alt + ,./ → Numpad 1,2,3
  - Alt + KLP; → Numpad 4,5,6
  - Alt + IOP → Numpad 7,8,9

### ISO to ANSI Layout
- **Script:** `iso_to_ansi.sh`
- **Method:** xmodmap
- **Effect:** Swaps § and \| keys for ANSI layout users
- **Persistence:** Add to `~/.Xmodmap`

## Advanced Usage

### Using xkeysnail

For the most flexible and powerful remapping, use xkeysnail:

```bash
# Start with all Python configurations
sudo ~/.config/karabiner-linux/start_xkeysnail.sh

# Or start manually with specific config
sudo xkeysnail ~/.config/karabiner-linux/catboard_arrows_xkeysnail.py
```

### Systemd Auto-Start

Enable automatic startup:

```bash
systemctl --user enable xkeysnail.service
systemctl --user start xkeysnail.service
```

### Custom Configurations

Create your own Python configurations in `~/.config/karabiner-linux/`:

```python
#!/usr/bin/env python3
from xkeysnail.transform import *

define_keymap(None, {
    K("Super+your_key"): K("target_key"),
}, "Custom mapping")
```

## Troubleshooting

### Common Issues

1. **Mappings not working:**
   - Ensure xbindkeys is running: `pgrep xbindkeys`
   - Check xbindkeys config: `xbindkeys -k`
   - Restart xbindkeys: `pkill xbindkeys && xbindkeys -p`

2. **xkeysnail permission denied:**
   - Run with sudo for keyboard access
   - Add user to input group: `sudo usermod -a -G input $USER`

3. **Changes not persistent after reboot:**
   - Add commands to `~/.xprofile` or desktop environment's startup
   - Use systemd service for xkeysnail

4. **Key names not recognized:**
   - Check key names: `xev` or `xbindkeys -k`
   - Use correct key names in configurations

### Debugging Tools

- **xev** - Show key codes and names when keys are pressed
- **xbindkeys -k** - Interactive key name finder
- **xmodmap -pk** - Show current key mapping table
- **setxkbmap -query** - Show current keyboard settings

## Comparison with Karabiner-Elements

| Feature | Karabiner-Elements (macOS) | Linux Equivalent |
|---------|---------------------------|------------------|
| Simple key remapping | ✅ Native | ✅ xkb/xmodmap |
| Complex modifier mappings | ✅ Native | ✅ xkeysnail |
| GUI configuration | ✅ Native | ❌ Text-based |
| Auto-start | ✅ Native | ✅ systemd/autostart |
| Application-specific rules | ✅ Native | ⚠️ Limited (xkeysnail) |
| Device-specific rules | ✅ Native | ⚠️ Limited (udev rules) |

## Contributing

Feel free to contribute additional configurations, improvements, or documentation. Please ensure:

1. Configurations are tested on common Linux distributions
2. Scripts include proper error handling
3. Documentation is clear and comprehensive
4. Follow the existing naming conventions

## License

These Linux configurations are provided as-is for educational and personal use, similar to the original Karabiner-Elements configurations.