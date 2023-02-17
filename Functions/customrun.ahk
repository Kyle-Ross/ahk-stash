;------------------------------------------

; Variable for double press wait interval in seconds

double_time := 0.1

;------------------------------------------

; Function which checks for a PID, making it active it is in inactive, and vice versa
activeminmax(the_PID)
{
	; Checks if the PID is currently active
	IfWinActive, ahk_pid %the_PID%
	{
		; If it is active, the window is minimised
		WinMinimize, ahk_pid %the_PID%
	}
	else
	{	
		; If it is not active, the window is made active
		WinActivate, ahk_pid %the_PID%
	}
}

;------------------------------------------

checkoptionrun(path,filename,checkifopen)
{
	; Combines the path and file name into the full path
	full_path := path "" filename

	; Checks if the file name exists as an active program
	; Then sets the value of ErrorLevel to the process ID (PID) if it exists
	; Otherwise it sets PID to 0
	; ErrorLevel is a built in variable, so already exists
	Process, Exist, %filename%

	; Setting PID to match the ErrorLevel, to avoid the value being reassigned by other functions
	PID_or_0 := ErrorLevel

	; If check mode is off - only used by double press logic
	if checkifopen = 0
	{
		run %full_path%
	}
	
	; Else, when check mode is on - also what occurs when the customrun function doublepress is on
	else
	{
		; If the file is not already active, run it
		if PID_or_0 = 0
		{
			run %full_path%
		}
		; Else, for the active file, conditionally minimise or maximise it
		else
		{
			activeminmax(PID_or_0)
		}
	}
}

;------------------------------------------

customrun(path, filename, doublepress)
{
	; If the doublepress mode is off
	if doublepress = 0
	{
		; Run while checking if already open and minimising / maximising window conditionally
		checkoptionrun(path,filename,1)
	}
	; If the double press mode is on
	else
	{
		; If the ErrorLevel is not zero, do this
		; ErrorLevel is triggered by the KeyWait function sitting outside this function
		If (!ErrorLevel)
		{
			; If there is no ErrorLevel, and therefore a double press occurred, run the process even if it is already open
			; 0, the third argument refers to the checkifopen parameter being off
			checkoptionrun(path,filename,0)
		}
		Else
		{
			checkoptionrun(path,filename,1)
			; What occurs on single press. i.e. open / activate depending on active window conditions
			; `, the third argument refers to the checkifopen parameter being on
			
		}
			
	}
}