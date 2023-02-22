#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;__________________________________________

; Variable for double press wait interval in seconds

double_time := 0.1

;__________________________________________

; Including private variable values from the variable reference txt file
; This file must be stored in the script directory

#Include variable_reference.txt

;__________________________________________

; Including the customrun function from the functions folder in this directory

#Include Functions\customrun.ahk

;__________________________________________

;||||----Hotstrings----||||

; ::example::replaces example with this text

; Hotstrings are not supported with variables, so this has been moved to 
; a local only AHK file to avoid sharing private information on github

;__________________________________________

;||||----Message Boxes----||||

^+?:: MsgBox, %HelpText%

;__________________________________________

;||||----Basic run commands----||||

^+!r:: Run, %recording_folder%
^+!m:: Run, %phonesender_bat%

;__________________________________________

;||||----Running with conditional behaviour based on program status----||||

; Single pressing opens the program
; Single pressing when the program is open, will either maximise or minimise the window

^+a:: checkoptionrun(asana_path, asana_file, 1)
^+d:: checkoptionrun(discord_path, discord_file, 1)
^+s:: checkoptionrun(spotify_path, spotify_file, 1)
^+m:: checkoptionrun(messenger_path, messenger_file, 1)
^+Space:: checkoptionrun(obsidian_path, obsidian_file, 1)

;__________________________________________

;||||----Hotkeys with Double press behaviour----||||

; Double pressing opens a new instance
; Single pressing opens the program
; Single pressing when the program is open, will either maximise or minimise the window

;------------------------------------------

;||--EXCEL--||

^+e:: ; SET HOTKEY HERE 

; Tells Hotkey to wait for key to be released
KeyWait, e ; SET LETTER TO MATCH HOTKEY

; Sets the time that the hotkey will wait
; If the second press does not occur within the time, ErrorLevel is set to 1
; D makes it so we wait for e to be pushed down instead of released
; T is the wait time, which is set to a variable
KeyWait, e, D T %double_time% ; SET FIRST LETTER TO MATCH HOTKEY

; Run the customrun function with the doublepress option on
customrun(excel_path, excel_file, 1) ; SET FILE PATHS USING VARIABLES FROM TXT FILE

; Ends the hotkey definition and stops the others below from running as well
return

;------------------------------------------

;||--TABLEAU--||
^+t:: 
KeyWait, t
KeyWait, t, D T %double_time%
customrun(tableau_path, tableau_file, 1)
return

;------------------------------------------

;||--WORD--||
^+w:: 
KeyWait, w
KeyWait, w, D T %double_time%
customrun(word_path, word_file, 1)
return

;------------------------------------------

;||--POWERPNT--||
^+p:: 
KeyWait, p
KeyWait, p, D T %double_time%
customrun(powerpnt_path, powerpnt_file, 1)
return

;------------------------------------------

;||--OUTLOOK--||

^+l:: 
KeyWait, l
KeyWait, l, D T %double_time%
customrun(outlook_path, outlook_file, 1)
return

;------------------------------------------

;||--GOOGLE CHROME--||

^+g:: 
KeyWait, g
KeyWait, g, D T %double_time%
customrun(chrome_path, chrome_file, 1)
return