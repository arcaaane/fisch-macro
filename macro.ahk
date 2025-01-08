p::
Loop
{
    Click down
    Sleep 1000
    Click up

    Send {\}

    Loop, 10
    {
				Sleep 100
        Send {Down}
        Sleep 100 
        Send {Enter}
        Sleep 100
    }

    Sleep 15000
}
return
t::ExitApp