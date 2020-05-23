;#NoTrayIcon
#SingleInstance force

GroupAdd, EN, Ahk_class Vim
GroupAdd, EN, Ahk_class TTOTAL_CMD

Loop
{
    WinWaitActive, Ahk_group EN
    switchime(0)
    ActiveHwnd := WinExist("A")
    WinWaitNotActive, Ahk_id %ActiveHwnd%
}

;#if WinActive("Ahk_group EN")
;    Shift:: switchime(1)
~Escape:: switchime(0)
Shift:: switchime(1)

switchime(ime := "A")
{
    if (ime = 1)
    {
        DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,"00000804", UInt, 1))
    }
    else If (ime = 0)
    {
        DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,, UInt, 1))
    }
    Else If (ime = "A")
    {
        ;ime_status:=DllCall("GetKeyboardLayout","int",0,UInt)
        Send, #{Space}
    }
}
