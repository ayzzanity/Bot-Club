; #FUNCTION# ====================================================================================================================
; Name ..........: BC Misc Functions
; Description ...: Miscellaneous Functions
; Author ........: Ezz Redfox
; Modified ......: 03/22/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include "BC Include.au3"

#Region ====Bot Exit====
Func BotExit()
	MsgBox(0, "Ending", "Bot Exited")
	Exit
EndFunc   ;==>BotExit
#EndRegion ====Bot Exit====

#Region ====Bot Start====
Func BotStart($Mode)
	MsgBox(0, "The Bot Club v1.6b", $Mode & " will now start...", 5, $GameHandle)
	GUICtrlSetData($btnStart, "RUNNING...")
	GUICtrlSetState($btnStart, $GUI_DISABLE)
	GUICtrlSetState($cboMode, $GUI_DISABLE)
	GUICtrlSetState($cboDifficulty, $GUI_DISABLE)
	GUICtrlSetState($cboHandle, $GUI_DISABLE)
EndFunc   ;==>BotStart
#EndRegion ====Bot Start====

#Region ====Hide Emulator====
Func HideEmu()
	If $HideStatus = False Then
		MsgBox(0, "Hiding", "Hiding Game")
		WinMove($GameHandle, "", 2000, 1)
		Sleep(100)
		WinMove($GameHandle2, "", 2555, 31)
		$HideStatus = True
	Else
		WinMove($GameHandle, "", 1200, 1)
		Sleep(100)
		WinMove($GameHandle2, "", 1755, 31)
		$HideStatus = False
	EndIf
EndFunc   ;==>HideEmu
#EndRegion ====Hide Emulator====

#Region ====Interruptable Wait Function====
Func Delay($Duration, $FState)
	Local $Counter = 0
	$State = $FState
	While $State
		If $Counter = $Duration Then
			$State = False
			SetStatus("Checking")
			Sleep(1000)
			RoadToGlory()
		Else
			Sleep(1000)
			SetStatus("Waiting... Time: " & $Counter)
			$Counter = $Counter + 1
		EndIf
	WEnd
EndFunc   ;==>Delay
#EndRegion ====Interruptable Wait Function====

#Region ====Pause Bot====
Func PauseBot()
	If $StartWild = True Then
		MsgBox(0, "Paused", "Bot is Paused.")
		$StartWild = False
		Sleep(100)
		SetStatus("Paused")
	Else
		MsgBox(0, "Running", "Bot is resumed.")
		$StartWild = True
		WildMode()
		Sleep(100)
	EndIf
EndFunc   ;==>PauseBot
#EndRegion ====Pause Bot====

#Region ====Set Status===
Func SetStatus($status)
	GUICtrlSetData($lblStatusHere, $status)
EndFunc   ;==>SetStatus
#EndRegion ====Set Status===

#Region ====Stop Bot====
Func StopBot()
	MsgBox(0, "Stopped", "Bot is Stopped")
	; /Wild Mode
	$StartWild = False
	$OnMenuWild = False
	$PlayingWild = False
	; /War Mode
	$StartWar = False
	$OnMenuWar = False
	$PlayingWar = False
	; /Road to Glory
	$StartRTG = False
	$OnMenuRTG = False
	$PlayingRTG = False
	; /Ring Domination
	$StartRD = False
	$OnMenuRD = False
	$PlayingRD = False
	; /Team Ring Domination
	$StartTRD = False
	$OnMenuTRD = False
	$PlayingTRD = False
	; /Etc
	$HideStatus = False
	$Training = False
	$State = False
	GUICtrlSetData($btnStart, "START")
	GUICtrlSetState($btnStart, $GUI_ENABLE)
	GUICtrlSetState($cboMode, $GUI_ENABLE)
	GUICtrlSetState($cboDifficulty, $GUI_ENABLE)
	GUICtrlSetState($cboHandle, $GUI_ENABLE)
	Sleep(100)
	SetStatus("Stopped")
EndFunc   ;==>StopBot
#EndRegion ====Stop Bot====

