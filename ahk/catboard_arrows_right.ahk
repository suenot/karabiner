; --- AutoHotkey v2 ---
; catboard arrows right command
; Generated from karabiner JSON: catboard_arrows_right.json
#Requires AutoHotkey v2.0
#SingleInstance Force

; ijkl
>#j:: Send "{Left}"
>#k:: Send "{Down}"
>#i:: Send "{Up}"
>#l:: Send "{Right}"

; home
>#u:: Send "#{Left}"

; end
>#o:: Send "#{Right}"

; page_up
>#p:: Send "{PgUp}"

; page_down
>#;:: Send "{PgDn}"

; h->enter
>#h:: Send "{Enter}"

; y->escape
>#y:: Send "{Escape}"

; m->backspace
>#m:: Send "{Backspace}"

; ,->delete
>#,:: Send "{Delete}"
