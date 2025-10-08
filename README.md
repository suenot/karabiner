# Karabiner Configuration Files

This repository contains various Karabiner-Elements configuration files for macOS keyboard customization.

## What is Karabiner-Elements?

Karabiner-Elements is a powerful keyboard customization tool for macOS that allows you to:
- Remap keys
- Create complex keyboard shortcuts
- Modify modifier key behavior
- Add custom functionality to your keyboard

## Installation

1. Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
2. Open Karabiner-Elements preferences
3. Navigate to the "Complex modifications" tab
4. Click "Add rule" and import the desired JSON files from this repository

## Available Configurations

### Key Mapping Files

| File | Description | Functionality |
|------|-------------|---------------|
| `caps_lock_to_left_shift.json` | Caps Lock to Left Shift | Converts caps lock key to left shift |
| `_right_command_to_shift.json` | Right Command to Shift | Maps right command key to shift |
| `delete.json` | Delete Key | Custom delete key configuration |
| `insert_custom_text_in_english_with_pbcopy.json` | Custom Text Insertion | Inserts predefined text using pbcopy |

### Navigation Files

| File | Description | Functionality |
|------|-------------|---------------|
| `catboard_arrows.json` | Catboard Arrows (IJKL) | IJKL keys act as arrow keys when left command is held |
| `catboard_arrows_right.json` | Catboard Arrows (IJKL) - Right Command | Same as above but using right command |
| `iso_to_ansi.json` | ISO to ANSI Layout | Converts ISO keyboard layout to ANSI |

### Special Function Files

| File | Description | Functionality |
|------|-------------|---------------|
| `numpad.json` | Numpad Configuration | Custom numpad key mappings |

## Usage Instructions

1. **Download Configuration**: Choose the configuration file(s) you want to use from this repository
2. **Import to Karabiner**:
   - Open Karabiner-Elements
   - Go to "Complex modifications" tab
   - Click "Add rule"
   - Click "Import more rules" and select the JSON file
3. **Enable the Rule**: Find the imported rule in the list and click "Enable"

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

1. Configuration files are properly formatted JSON
2. Descriptions are clear and descriptive
3. Files follow the naming convention: `description.json`
4. Test your configurations before submitting

## Troubleshooting

- **Rule not working**: Ensure the rule is enabled in Karabiner-Elements
- **Conflicts**: Some rules may conflict with each other. Disable conflicting rules
- **macOS updates**: After major macOS updates, you may need to re-enable Karabiner-Elements

## License

This repository is provided as-is for educational and personal use.