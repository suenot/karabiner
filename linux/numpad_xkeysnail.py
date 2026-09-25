#!/usr/bin/env python3

# Numpad Configuration - xkeysnail configuration
# Maps keys to numpad when Alt key is held
# Install with: pip3 install xkeysnail

from xkeysnail.transform import *

# Define Alt + key mappings for numpad
define_keymap(None, {
    # Numpad numbers with Alt key (equivalent to Right Option on Mac)
    K("Alt+m"): K("KP_0"),
    K("Alt+comma"): K("KP_1"),
    K("Alt+period"): K("KP_2"),
    K("Alt+slash"): K("KP_3"),
    K("Alt+k"): K("KP_4"),
    K("Alt+l"): K("KP_5"),
    K("Alt+semicolon"): K("KP_6"),
    K("Alt+i"): K("KP_7"),
    K("Alt+o"): K("KP_8"),
    K("Alt+p"): K("KP_9"),
}, "Alt key numpad")

# Alternative using Super key
define_keymap(None, {
    # Numpad numbers with Super key
    K("Super+m"): K("KP_0"),
    K("Super+comma"): K("KP_1"),
    K("Super+period"): K("KP_2"),
    K("Super+slash"): K("KP_3"),
    K("Super+k"): K("KP_4"),
    K("Super+l"): K("KP_5"),
    K("Super+semicolon"): K("KP_6"),
    K("Super+i"): K("KP_7"),
    K("Super+o"): K("KP_8"),
    K("Super+p"): K("KP_9"),
}, "Super key numpad")