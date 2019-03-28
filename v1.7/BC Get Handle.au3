; #FUNCTION# ====================================================================================================================
; Name ..........: BC Get Handle
; Description ...: Getting Emulator Info for Bot
; Author ........: Ezz Redfox
; Modified ......: 03/22/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include "BC Include.au3"


Global $array[1]
$iCounter = 1

Func _GetHandle()
	While WinExists("[CLASS:Qt5QWindowIcon]")
		If Not WinExists("[CLASS:Qt5QWindowIcon; INSTANCE:" & $iCounter & "]") Then ExitLoop
		ReDim $array[$iCounter]
		$array[$iCounter - 1] = WinGetTitle("[CLASS:Qt5QWindowIcon; INSTANCE:" & $iCounter & "]")
		GUICtrlSetData($cboHandle, $array[$iCounter - 1])
		$iCounter += 1
	WEnd
EndFunc