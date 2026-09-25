# Karabiner Configuration Files

This repository contains various Karabiner-Elements configuration files for macOS keyboard customization and Linux equivalents.

## Platform Support

This repository supports both macOS and Linux users:

### macOS (Original)
- **Tool**: Karabiner-Elements
- **Files**: `*.json` configuration files in the root directory
- **Installation**: See instructions below

### Linux (New)
- **Tools**: xkb, xmodmap, xbindkeys, xdotool, xkeysnail
- **Files**: Linux configurations in the `linux/` directory
- **Installation**: See [linux/README.md](linux/README.md) for detailed instructions

## What is Karabiner-Elements?

Karabiner-Elements is a powerful keyboard customization tool for macOS that allows you to:
- Remap keys
- Create complex keyboard shortcuts
- Modify modifier key behavior
- Add custom functionality to your keyboard

## Linux Alternatives

Linux users have several powerful alternatives to Karabiner-Elements:

- **xkb/xmodmap**: System-level keyboard mapping (built into X11)
- **xbindkeys + xdotool**: Key binding and command execution
- **xkeysnail**: Python-based advanced keyboard remapping
- **setxkbmap**: Command-line keyboard layout configuration

## Installation

### macOS Users

1. Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
2. Open Karabiner-Elements preferences
3. Navigate to the "Complex modifications" tab
4. Click "Add rule" and import the desired JSON files from this repository

### Linux Users

1. Navigate to the `linux/` directory
2. Run the installation script: `./install.sh`
3. Follow the on-screen instructions to install dependencies and configure your system

For detailed Linux installation instructions, see [linux/README.md](linux/README.md).

## Available Configurations

### macOS Configurations (Karabiner-Elements)

#### Key Mapping Files

| File | Description | Functionality |
|------|-------------|---------------|
| `caps_lock_to_left_shift.json` | Caps Lock to Left Shift | Converts caps lock key to left shift |
| `_right_command_to_shift.json` | Right Command to Shift | Maps right command key to shift |
| `delete.json` | Delete Key | Custom delete key configuration |
| `insert_custom_text_in_english_with_pbcopy.json` | Custom Text Insertion | Inserts predefined text using pbcopy |

#### Navigation Files

| File | Description | Functionality |
|------|-------------|---------------|
| `catboard_arrows.json` | Catboard Arrows (IJKL) | IJKL keys act as arrow keys when left command is held |
| `catboard_arrows_right.json` | Catboard Arrows (IJKL) - Right Command | Same as above but using right command |
| `iso_to_ansi.json` | ISO to ANSI Layout | Converts ISO keyboard layout to ANSI |

#### Special Function Files

| File | Description | Functionality |
|------|-------------|---------------|
| `numpad.json` | Numpad Configuration | Custom numpad key mappings |

### Linux Configurations

#### Basic Scripts (xkb/xmodmap based)

| File | Description | Functionality |
|------|-------------|---------------|
| `caps_lock_to_left_shift.sh` | Caps Lock to Left Shift | Converts caps lock key to left shift |
| `right_command_to_shift.sh` | Right Win to Shift | Maps right Win key to shift |
| `iso_to_ansi.sh` | ISO to ANSI Layout | Converts ISO keyboard layout to ANSI |
| `numpad.sh` | Alt + Keys → Numpad | Alt key combinations become numpad |
| `catboard_arrows.sh` | Super + IJKL → Arrows | Super key combinations for navigation |

#### Advanced Scripts (xkeysnail based)

| File | Description | Functionality |
|------|-------------|---------------|
| `numpad_xkeysnail.py` | Advanced Numpad | Enhanced numpad with modifier support |
| `catboard_arrows_xkeysnail.py` | Advanced Navigation | Comprehensive navigation mapping |

#### Setup Files

| File | Description | Functionality |
|------|-------------|---------------|
| `install.sh` | Installation Script | Automatic setup for Linux users |
| `README.md` | Linux Documentation | Detailed Linux setup instructions |

## Usage Instructions

### macOS Users

1. **Download Configuration**: Choose the configuration file(s) you want to use from this repository
2. **Import to Karabiner**:
   - Open Karabiner-Elements
   - Go to "Complex modifications" tab
   - Click "Add rule"
   - Click "Import more rules" and select the JSON file
3. **Enable the Rule**: Find the imported rule in the list and click "Enable"

### Linux Users

1. **Run Installation**: Execute `./install.sh` in the `linux/` directory
2. **Load Configurations**: Run `~/.config/karabiner-linux/config.sh` for basic mappings
3. **Advanced Features**: Start xkeysnail with `~/.config/karabiner-linux/start_xkeysnail.sh`

For detailed Linux usage instructions, see [linux/README.md](linux/README.md).

## File Structure

Each configuration file follows the Karabiner-Elements JSON format:

```json
{
  "title": "Configuration Name",
  "rules": [
    {
      "description": "Rule Description",
      "manipulators": [
        {
          "type": "basic",
          "from": { /* key input conditions */ },
          "to": [ /* output actions */ ]
        }
      ]
    }
  ]
}
```

## Contributing

Feel free to submit new configurations or improvements to existing ones. Please ensure:

### macOS Configurations
1. Configuration files are properly formatted JSON
2. Descriptions are clear and descriptive
3. Files follow the naming convention: `description.json`
4. Test your configurations before submitting

### Linux Configurations
1. Scripts are properly tested on common Linux distributions
2. Include proper error handling and documentation
3. Follow the existing naming conventions
4. Provide both basic and advanced versions when possible

## Cross-Platform Support

This repository aims to provide equivalent functionality across platforms:

| Feature | macOS (Karabiner) | Linux (xkeysnail/xbindkeys) |
|---------|-------------------|---------------------------|
| Simple key remapping | ✅ | ✅ |
| Modifier-based mapping | ✅ | ✅ |
| Complex navigation | ✅ | ✅ |
| Numpad emulation | ✅ | ✅ |
| Layout conversion | ✅ | ✅ |
| GUI configuration | ✅ | ❌ (CLI-based) |

## Troubleshooting

### macOS (Karabiner-Elements)
- **Rule not working**: Ensure the rule is enabled in Karabiner-Elements
- **Conflicts**: Some rules may conflict with each other. Disable conflicting rules
- **macOS updates**: After major macOS updates, you may need to re-enable Karabiner-Elements

### Linux
- **Mappings not working**: Check if xbindkeys is running (`pgrep xbindkeys`)
- **Permission denied**: xkeysnail requires sudo for keyboard access
- **Changes not persistent**: Add commands to startup scripts or use systemd services
- **Key names not recognized**: Use `xev` or `xbindkeys -k` to find correct key names

For detailed Linux troubleshooting, see [linux/README.md](linux/README.md).

## License

This repository is provided as-is for educational and personal use.