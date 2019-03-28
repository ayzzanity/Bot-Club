; #FUNCTION# ====================================================================================================================
; Name ..........: BC Actions
; Description ...: All the click actions will be stored here
; Author ........: Ezz Redfox
; Modified ......: 03/20/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include <BC Global Variables.au3>

Func _DraftClicks() ;Draft Board Clicks
	;first row
	ControlClick($GameHandle, "", "", "left", 1, 65, 250)
	ControlClick($GameHandle, "", "", "left", 1, 175, 250)
	ControlClick($GameHandle, "", "", "left", 1, 285, 250)
	ControlClick($GameHandle, "", "", "left", 1, 395, 250)
	ControlClick($GameHandle, "", "", "left", 1, 500, 250)
	;second row
	ControlClick($GameHandle, "", "", "left", 1, 65, 375)
	ControlClick($GameHandle, "", "", "left", 1, 175, 375)
	ControlClick($GameHandle, "", "", "left", 1, 285, 375)
	ControlClick($GameHandle, "", "", "left", 1, 395, 375)
	ControlClick($GameHandle, "", "", "left", 1, 500, 375)
	;third row
	ControlClick($GameHandle, "", "", "left", 1, 65, 500)
	ControlClick($GameHandle, "", "", "left", 1, 175, 500)
	ControlClick($GameHandle, "", "", "left", 1, 285, 500)
	ControlClick($GameHandle, "", "", "left", 1, 395, 500)
	ControlClick($GameHandle, "", "", "left", 1, 500, 500)
	;fourth row
	ControlClick($GameHandle, "", "", "left", 1, 65, 625)
	ControlClick($GameHandle, "", "", "left", 1, 175, 625)
	ControlClick($GameHandle, "", "", "left", 1, 285, 625)
	ControlClick($GameHandle, "", "", "left", 1, 395, 625)
	ControlClick($GameHandle, "", "", "left", 1, 500, 625)
	;last row
	ControlClick($GameHandle, "", "", "left", 1, 65, 750)
	ControlClick($GameHandle, "", "", "left", 1, 175, 750)
	ControlClick($GameHandle, "", "", "left", 1, 285, 750)
	ControlClick($GameHandle, "", "", "left", 1, 500, 750)
	ControlClick($GameHandle, "", "", "left", 1, 395, 750)
EndFunc   ;==>_DraftClicks

Func _ShardClicks() ;RD Shards Clicks
	;first row
	ControlClick($GameHandle, "", "", "left", 1, 120, 330)
	ControlClick($GameHandle, "", "", "left", 1, 180, 330)
	ControlClick($GameHandle, "", "", "left", 1, 250, 330)
	ControlClick($GameHandle, "", "", "left", 1, 320, 330)
	ControlClick($GameHandle, "", "", "left", 1, 380, 330)
	ControlClick($GameHandle, "", "", "left", 1, 430, 330)
	;second row
	ControlClick($GameHandle, "", "", "left", 1, 110, 390)
	ControlClick($GameHandle, "", "", "left", 1, 175, 390)
	ControlClick($GameHandle, "", "", "left", 1, 240, 390)
	ControlClick($GameHandle, "", "", "left", 1, 320, 390)
	ControlClick($GameHandle, "", "", "left", 1, 385, 390)
	ControlClick($GameHandle, "", "", "left", 1, 450, 390)
	;third row
	ControlClick($GameHandle, "", "", "left", 1, 130, 500)
	ControlClick($GameHandle, "", "", "left", 1, 215, 500)
	ControlClick($GameHandle, "", "", "left", 1, 345, 500)
	ControlClick($GameHandle, "", "", "left", 1, 430, 500)
	;fourth row
	ControlClick($GameHandle, "", "", "left", 1, 130, 560)
	ControlClick($GameHandle, "", "", "left", 1, 200, 560)
	ControlClick($GameHandle, "", "", "left", 1, 360, 560)
	ControlClick($GameHandle, "", "", "left", 1, 430, 560)
	;fifth row
	ControlClick($GameHandle, "", "", "left", 1, 110, 670)
	ControlClick($GameHandle, "", "", "left", 1, 220, 670)
	ControlClick($GameHandle, "", "", "left", 1, 320, 670)
	ControlClick($GameHandle, "", "", "left", 1, 460, 670)
	;sixth row
	ControlClick($GameHandle, "", "", "left", 1, 130, 725)
	ControlClick($GameHandle, "", "", "left", 1, 200, 725)
	ControlClick($GameHandle, "", "", "left", 1, 360, 725)
	ControlClick($GameHandle, "", "", "left", 1, 440, 725)
	;seventh row
	ControlClick($GameHandle, "", "", "left", 1, 120, 790)
	ControlClick($GameHandle, "", "", "left", 1, 250, 790)
	ControlClick($GameHandle, "", "", "left", 1, 320, 790)
	ControlClick($GameHandle, "", "", "left", 1, 430, 790)
	;last row
	ControlClick($GameHandle, "", "", "left", 1, 150, 830)
	ControlClick($GameHandle, "", "", "left", 1, 210, 830)
	ControlClick($GameHandle, "", "", "left", 1, 350, 830)
	ControlClick($GameHandle, "", "", "left", 1, 420, 830)
EndFunc   ;==>_ShardClicks

Func _RDControlDrag() ;RD Cards Drag
	;first card
	_ControlDrag($GameHandle, "left", 100, 975, 110, 370)
	_ControlDrag($GameHandle, "left", 100, 975, 280, 370)
	_ControlDrag($GameHandle, "left", 100, 975, 450, 370)
	_ControlDrag($GameHandle, "left", 100, 975, 110, 550)
	_ControlDrag($GameHandle, "left", 100, 975, 280, 550)
	_ControlDrag($GameHandle, "left", 100, 975, 450, 550)
	_ControlDrag($GameHandle, "left", 100, 975, 110, 740)
	_ControlDrag($GameHandle, "left", 100, 975, 280, 740)
	_ControlDrag($GameHandle, "left", 100, 975, 450, 740)

	;second card
	_ControlDrag($GameHandle, "left", 175, 975, 110, 370)
	_ControlDrag($GameHandle, "left", 175, 975, 280, 370)
	_ControlDrag($GameHandle, "left", 175, 975, 450, 370)
	_ControlDrag($GameHandle, "left", 175, 975, 110, 550)
	_ControlDrag($GameHandle, "left", 175, 975, 280, 550)
	_ControlDrag($GameHandle, "left", 175, 975, 450, 550)
	_ControlDrag($GameHandle, "left", 175, 975, 110, 740)
	_ControlDrag($GameHandle, "left", 175, 975, 280, 740)
	_ControlDrag($GameHandle, "left", 175, 975, 450, 740)

	;third card
	_ControlDrag($GameHandle, "left", 260, 975, 110, 370)
	_ControlDrag($GameHandle, "left", 260, 975, 280, 370)
	_ControlDrag($GameHandle, "left", 260, 975, 450, 370)
	_ControlDrag($GameHandle, "left", 260, 975, 110, 550)
	_ControlDrag($GameHandle, "left", 260, 975, 280, 550)
	_ControlDrag($GameHandle, "left", 260, 975, 450, 550)
	_ControlDrag($GameHandle, "left", 260, 975, 110, 740)
	_ControlDrag($GameHandle, "left", 260, 975, 280, 740)
	_ControlDrag($GameHandle, "left", 260, 975, 450, 740)

	;fourth card
	_ControlDrag($GameHandle, "left", 340, 975, 110, 370)
	_ControlDrag($GameHandle, "left", 340, 975, 280, 370)
	_ControlDrag($GameHandle, "left", 340, 975, 450, 370)
	_ControlDrag($GameHandle, "left", 340, 975, 110, 550)
	_ControlDrag($GameHandle, "left", 340, 975, 280, 550)
	_ControlDrag($GameHandle, "left", 340, 975, 450, 550)
	_ControlDrag($GameHandle, "left", 340, 975, 110, 740)
	_ControlDrag($GameHandle, "left", 340, 975, 280, 740)
	_ControlDrag($GameHandle, "left", 340, 975, 450, 740)

	;fifth card
	_ControlDrag($GameHandle, "left", 425, 975, 110, 370)
	_ControlDrag($GameHandle, "left", 425, 975, 280, 370)
	_ControlDrag($GameHandle, "left", 425, 975, 450, 370)
	_ControlDrag($GameHandle, "left", 425, 975, 110, 550)
	_ControlDrag($GameHandle, "left", 425, 975, 280, 550)
	_ControlDrag($GameHandle, "left", 425, 975, 450, 550)
	_ControlDrag($GameHandle, "left", 425, 975, 110, 740)
	_ControlDrag($GameHandle, "left", 425, 975, 280, 740)
	_ControlDrag($GameHandle, "left", 425, 975, 450, 740)
EndFunc   ;==>_RDControlDrag

Func _PlayWildMode()
	ControlClick($GameHandle, "", "", "left", 1, 425, 900)
	ControlClick($GameHandle, "", "", "left", 1, 100, 975)
	ControlClick($GameHandle, "", "", "left", 1, 175, 975)
	ControlClick($GameHandle, "", "", "left", 1, 260, 975)
	ControlClick($GameHandle, "", "", "left", 1, 340, 975)
	ControlClick($GameHandle, "", "", "left", 1, 425, 975)
	ControlClick($GameHandle, "", "", "left", 1, 510, 975)
EndFunc   ;==>_PlayWildMode

Func _PlayRoadToGlory()
	ControlClick($GameHandle, "", "", "left", 1, 490, 850)
	ControlClick($GameHandle, "", "", "left", 1, 120, 950)
	ControlClick($GameHandle, "", "", "left", 1, 250, 950)
	ControlClick($GameHandle, "", "", "left", 1, 360, 950)
	ControlClick($GameHandle, "", "", "left", 1, 475, 950)
EndFunc   ;==>_PlayRoadToGlory

; #FUNCTION# ====================================================================================================================
; Name ..........: BC Control Drag Function
; Description ...: Mouse Dragging function for a specific control
; Author ........: Ezz Redfox
; Modified ......: 03/20/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
Func _ControlDrag($Window, $Button, $X1, $Y1, $X2, $Y2) ;Mouse Dragging Function
	Local $MK_LBUTTON = 0x0001
	Local $WM_LBUTTONDOWN = 0x0201
	Local $WM_LBUTTONUP = 0x0202

	Local $MK_RBUTTON = 0x0002
	Local $WM_RBUTTONDOWN = 0x0204
	Local $WM_RBUTTONUP = 0x0205

	Local $WM_MOUSEMOVE = 0x0200


	Select
		Case $Button = "left"
			$Button = $MK_LBUTTON
			$ButtonDown = $WM_LBUTTONDOWN
			$ButtonUp = $WM_LBUTTONUP
		Case $Button = "right"
			$Button = $MK_RBUTTON
			$ButtonDown = $WM_RBUTTONDOWN
			$ButtonUp = $WM_RBUTTONUP
	EndSelect

	DllCall("user32.dll", "int", "SendMessage", _
			"hwnd", $Window, _
			"int", $WM_MOUSEMOVE, _
			"int", 0, _
			"long", _MakeLong($X1, $Y1))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
			"hwnd", $Window, _
			"int", $ButtonDown, _
			"int", $Button, _
			"long", _MakeLong($X1, $Y1))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
			"hwnd", $Window, _
			"int", $WM_MOUSEMOVE, _
			"int", 0, _
			"long", _MakeLong($X2, $Y2))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
			"hwnd", $Window, _
			"int", $ButtonUp, _
			"int", $Button, _
			"long", _MakeLong($X2, $Y2))
	Sleep(100)

EndFunc   ;==>_ControlDrag

Func _MakeLong($LoWord, $HiWord) ;Int to Long Conversion
	Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))
EndFunc   ;==>_MakeLong
