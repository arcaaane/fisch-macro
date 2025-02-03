control := 0.2 ; The amount of control your rod has
rodCast := 1000 ; How long it holds down to cast your rod

; ========== Do not change any vars below ==========

ToolX := ScreenHeight/2
ToolX2 := ToolX - 25

Tooltip, Press P to start, -835, 150, 1
ToolTip, Task: None, -835, 170, 2
p::
Loop
{  
    fail := 0
    Sleep 200
    ToolTip, Task: Casting Rod, -835, 170, 2
    Sleep 50
    Click down
    Sleep 1000
    Click up
    Sleep 50
    ToolTip, Task: Shaking Rod, -855, 170, 2
    Sleep 50
    BarColor := 0x000000
    barCenterX := 943
    barCenterY := 884
    Send {\}
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
    ToolTip, Task: Playing Minigame, -855, 170, 2
    While (fail < 5) {
       PixelSearch, FoundX, FoundY, 520, 809, 1379, 942, 0x434B5B, 3, Fast RGB
       if (!ErrorLevel) {
           Tooltip, FISCH LOCATION, FoundX, 800, 3
           if (FoundX > 969) {
	       Click Down
               Sleep 50
	   }
	   if (FoundX < 969) {
	       Click up
      	       Sleep 50
	   }
       } else {
           Tooltip, Not Found, -855, 170, 2
           fail += 1
	   Sleep 50
       }
    }
    ToolTip, Task: Reseting, -855, 170, 2
    Sleep 3000
}
t::ExitApp
