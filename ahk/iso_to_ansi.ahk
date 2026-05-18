; --- AutoHotkey v2 ---
; iso_to_ansi
; Generated from karabiner JSON: iso_to_ansi.json
#Requires AutoHotkey v2.0
#SingleInstance Force

; backslash + left_command = backslash
<#\:: Send "\"

; backslash->enter (iso to ansi)
\:: Send "{Enter}"

; tilde to left shift
``:: Send "{LShift}"

; § to tilde
; <no-ahk-equivalent:non_us_backslash>:: Send "{``}"
