p::
Loop
{
	{
		Click down
		Sleep 1000
		Click up
		Send +\
		Loop 10
		{
			Send {Down}
			Send {Enter}
		}
		Loop 15
		{
			Click
			Sleep 250
		}
		Sleep 500
	}
}
return