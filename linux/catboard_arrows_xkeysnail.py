#!/usr/bin/env python3

# Catboard Arrows - xkeysnail configuration
# Advanced keyboard remapping for Linux, equivalent to Karabiner-Elements
# Install with: pip3 install xkeysnail

from xkeysnail.transform import *

define_keymap(None, {
    # Caps Lock to Left Shift (global)
    Key.CAPS_LOCK: Key.LEFT_SHIFT,
}, "Global caps lock remapping")

# Define Super (Mod4) + IJKL as arrow keys
define_keymap(None, {
    # Navigation with Super key (equivalent to Command key on Mac)
    K("Super+i"): K("Up"),
    K("Super+k"): K("Down"),
    K("Super+j"): K("Left"),
    K("Super+l"): K("Right"),

    # Extended navigation
    K("Super+u"): K("Home"),      # Equivalent to Cmd+Left
    K("Super+o"): K("End"),       # Equivalent to Cmd+Right
    K("Super+p"): K("Page_Up"),
    K("Super+semicolon"): K("Page_Down"),

    # Function keys
    K("Super+h"): K("Return"),
    K("Super+y"): K("Escape"),
    K("Super+m"): K("BackSpace"),
    K("Super+comma"): K("Delete"),
}, "Super key navigation")

# Alternative using Alt key if Super is not preferred
define_keymap(None, {
    # Navigation with Alt key
    K("Alt+i"): K("Up"),
    K("Alt+k"): K("Down"),
    K("Alt+j"): K("Left"),
    K("Alt+l"): K("Right"),

    # Extended navigation
    K("Alt+u"): K("Home"),
    K("Alt+o"): K("End"),
    K("Alt+p"): K("Page_Up"),
    K("Alt+semicolon"): K("Page_Down"),

    # Function keys
    K("Alt+h"): K("Return"),
    K("Alt+y"): K("Escape"),
    K("Alt+m"): K("BackSpace"),
    K("Alt+comma"): K("Delete"),
}, "Alt key navigation")