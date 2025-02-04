#SingleInstance Force

; ========== Preferences ==========

; What the Rod's control is
control := 0.2

; How long to cast your rod
rodCast := 1000

; Amount of time to wait for the bobber
bobberWait := 2000

; Auto lower graphics
lowergraphics := true

; Auto zoom in
autozoom := true

; ========== Config ==========

; Key to start macro
startKey := p

; Key to exit macro
exitKey := t

; How many times the macro checks if the minigame is active before resetting
failAmount := 5

; Navigation Key
navigationKey := "/"

; ========== Macro Settings ==========

; Change to false if you dont want it to auto shake
autoShake := true

; Change to false if you dont want it to do the minigame
autoMinigame := true

; Change to false if you dont want it to auto cast
autoCast := true

; ========== End Settings ==========

if (autozoom != true and autozoom != false)
    {
        msgbox, "autozoom" is not set to false or true
        ExitApp
    }

if (lowergraphics != true and lowergraphics != false)
    {
        msgbox, "lowergraphics" is not set to false or true
        ExitApp
    }

if (autoShake != true and autoShake != false)
    {
        msgbox, "autoShake" is not set to false or true
        ExitApp
    }

if (autoMinigame != true and autoMinigame != false)
    {
        msgbox, "autoMinigame" is not set to false or true
        ExitApp
    }

if (autoCast != true and autoCast != false)
    {
        msgbox, "autoCast" is not set to false or true
        ExitApp
    }

; ==============================

if (control < .2)
    {
        msgbox, rod control must be greater than .2 to function correctly
	ExitApp
    }

; ==============================

WinActivate, Roblox
if WinActive("Roblox")
{
WinMaximize, Roblox
}
else
{
msgbox, Roblox is not opened
ExitApp
}

; ==============================

ToolX := A_WindowWidth/20
Tooltip1 := (A_WindowHeight/2)-(20*9)
Tooltip2 := (A_WindowHeight/2)-(20*8)
Tooltip3 := (A_WindowHeight/2)-(20*7)
Tooltip4 := (A_WindowHeight/2)-(20*6)
Tooltip5 := (A_WindowHeight/2)-(20*5)

; ==============================

Tooltip, Press %startKey% to start, %ToolX%, %Tooltip1%, 1
ToolTip, Task: None, %ToolX%, %Tooltip2%, 2

; ==============================

p::
global rodCast, ToolX, Tooltip2, failAmount, navigationKey
Loop
{

; ==============================

if (lowergraphics)
{
    Loop, 10
    {
        ToolTip, Task: Lowering Graphics, %ToolX%, %Tooltip2%, 2
        Send, +{F10}
        Sleep 100
    }
}

; ==============================

if (autozoom)
{
    Loop, 30
    {
        ToolTip, Task: Enabling First Person, %ToolX%, %Tooltip2%, 2
        Send, {WheelDown}
        Sleep 100
    }
    Send, {WheelUp}
}

; ==============================

    ; Cast rod
    Sleep 200
    ToolTip, Task: Casting Rod, %ToolX%, %Tooltip2%, 2
    Sleep 50
    Click down
    Sleep rodCast
    Click up
    Sleep 50

; ==============================

    ; Shake rod
    fail := 0
    ToolTip, Task: Shaking Rod, %ToolX%, %Tooltip2%, 2
    Sleep 50
    Send {navigationKey}
    Sleep 200
    While (true) {
       PixelSearch, FoundX, FoundY, 520, 809, 1379, 942, 0x434B5B, 3, Fast RGB
       if (ErrorLevel) {
           Send {Down}
           Sleep 50
           Send {Enter}
           Sleep 50
       } else {
           Break
       }
    }
    Sleep 350

; ==============================

    fail := 0
    ToolTip, Task: Playing Minigame, %ToolX%, %Tooltip2%, 2
    While (fail < failAmount) {
    PixelSearch, FoundX, FoundY, 520, 809, 1379, 942, 0x434B5B, 3, Fast RGB
    if (!ErrorLevel) {
        Tooltip, FISCH LOCATION, FoundX, 800, 3
        while (FoundX > 969) {
            Click Down
            Sleep 50
        }
        while (FoundX < 969) {
            Click Up
            Sleep 50
        }
    } else {
        fail += 1
        Sleep 100
    }
}

; ==============================

; Prepare for next catch
ToolTip, Task: Reseting, %ToolX%, %Tooltip2%, 2
Sleep 3000
}
exitKey::ExitApp
