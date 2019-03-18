#RequireAdmin
#NoTrayIcon
#include<ButtonConstants.au3>
#include<GUIConstantsEx.au3>
#include<WindowsConstants.au3>
#include<WinAPI.au3>
#include<GDIPlus.au3>
#include<Color.au3>

#Region ===== Hotkeys =====
HotKeySet("{f1}", "PauseGame")
HotKeySet("{f2}", "StopGame")
HotKeySet("{f3}", "HideGame")
HotKeySet("{f4}", "BotExit")
#EndRegion

Global $gameHandle = WinGetHandle("[CLASS:Qt5QWindowIcon]")
Global $gameHandle2 = WinGetHandle("[CLASS:Qt5QWindowToolSaveBits]")
Global $playingRD = False
Global $draftPick = False
Global $startRD = False
Global $hideStatus = False


#Region ### START Koda GUI section ### Form=d:\autoit project\scbot.kxf
$SCBot = GUICreate("WWE Supercard Bot v0.0.1", 320, 139, -1, -1)
GUISetIcon("Z:\Odin3 v3.12.3\Odin3.exe", -1)
GUISetBkColor(0x000000)
$btnStart = GUICtrlCreateButton("START", 56, 16, 107, 57)
GUICtrlSetColor(-1, 0x000000)
$btnHide = GUICtrlCreateButton("Hide Game", 56, 80, 211, 25)
GUICtrlSetColor(-1, 0x000000)
$btnExit = GUICtrlCreateButton("EXIT", 168, 16, 99, 57)
GUICtrlSetColor(-1, 0x000000)
$lblStatus = GUICtrlCreateLabel("Status:", 56, 112, 37, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
$lblStatusHere = GUICtrlCreateLabel("Welcome!", 96, 112, 60, 17)
GUICtrlSetColor(-1, 0x00FF00)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	menu()
WEnd

func menu()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnStart
			MsgBox(0,"WWE Supercard Bot v0.1.1", "Bot will now start...", 5, $gameHandle)
			$startRD = True
			RingDomination()
	EndSwitch
EndFunc

Func RingDomination()
	while($startRD)
	   Local $RDSearch = MemoryReadPixel(197, 574, $gameHandle)
	   Local $playSearch = MemoryReadPixel(394, 644, $gameHandle)
	   Local $loadingDone = MemoryReadPixel(307, 302, $gameHandle)
	   Local $stillRD = MemoryReadPixel(215, 59, $gameHandle)
	   Local $stillRD2 = MemoryReadPixel(375, 898, $gameHandle)
	   Local $doneSearch = MemoryReadPixel(270, 960, $gameHandle)

	   ;find wild menu
	   if $RDSearch = 0xC56C07 then
		  ;click wild
		  ControlClick($gameHandle,"","", "left", 1, 197, 574)
		  SetStatus("RD Menu")
		  sleep(1000)
	   Else
		  _ControlDrag($gameHandle, "left", 409, 546, 147, 546)
		  sleep(1000)
	   EndIf

	   ;find play button
	   if $playSearch = 0xFFCB3F then
		  ;click play
		  ControlClick($gameHandle,"","", "left", 1, 394, 644)
		  SetStatus("Loading")
	   EndIf

	   ;wait for loading
	   if $loadingDone = 0x265879 Then
		  sleep(2500)
	   ElseIf $stillRD = 0xFAEBFA And $stillRD2 = 0x445455 Then
		  $playingRD = True
		  SetStatus("RD Mode")
	   EndIf

	   ;playing RD mode
	   while($playingRD)
		  ;still playing?
		  Local $stillRD = MemoryReadPixel(215, 59, $gameHandle)
		  Local $doneRD = MemoryReadPixel(429, 940, $gameHandle)
		  If $doneRD = 0x00A3E7 Then
			 sleep(5000)
			 $playingRD = False
			 $draftPick = True
			 SetStatus("Drafting")
		  ElseIf $stillRD = 0xFAEBFA Then
			 ControlClick($gameHandle,"","", "left", 1, 425, 900)
			 ;first card
			 _ControlDrag($gameHandle, "left", 100, 975, 110, 370)
			 _ControlDrag($gameHandle, "left", 100, 975, 280, 370)
			 _ControlDrag($gameHandle, "left", 100, 975, 450, 370)
			 _ControlDrag($gameHandle, "left", 100, 975, 110, 550)
			 _ControlDrag($gameHandle, "left", 100, 975, 280, 550)
			 _ControlDrag($gameHandle, "left", 100, 975, 450, 550)
			 _ControlDrag($gameHandle, "left", 100, 975, 110, 740)
			 _ControlDrag($gameHandle, "left", 100, 975, 280, 740)
			 _ControlDrag($gameHandle, "left", 100, 975, 450, 740)

			 ;second card
			 _ControlDrag($gameHandle, "left", 175, 975, 110, 370)
			 _ControlDrag($gameHandle, "left", 175, 975, 280, 370)
			 _ControlDrag($gameHandle, "left", 175, 975, 450, 370)
			 _ControlDrag($gameHandle, "left", 175, 975, 110, 550)
			 _ControlDrag($gameHandle, "left", 175, 975, 280, 550)
			 _ControlDrag($gameHandle, "left", 175, 975, 450, 550)
			 _ControlDrag($gameHandle, "left", 175, 975, 110, 740)
			 _ControlDrag($gameHandle, "left", 175, 975, 280, 740)
			 _ControlDrag($gameHandle, "left", 175, 975, 450, 740)

			 ;third card
			 _ControlDrag($gameHandle, "left", 260, 975, 110, 370)
			 _ControlDrag($gameHandle, "left", 260, 975, 280, 370)
			 _ControlDrag($gameHandle, "left", 260, 975, 450, 370)
			 _ControlDrag($gameHandle, "left", 260, 975, 110, 550)
			 _ControlDrag($gameHandle, "left", 260, 975, 280, 550)
			 _ControlDrag($gameHandle, "left", 260, 975, 450, 550)
			 _ControlDrag($gameHandle, "left", 260, 975, 110, 740)
			 _ControlDrag($gameHandle, "left", 260, 975, 280, 740)
			 _ControlDrag($gameHandle, "left", 260, 975, 450, 740)

			 ;fourth card
			 _ControlDrag($gameHandle, "left", 340, 975, 110, 370)
			 _ControlDrag($gameHandle, "left", 340, 975, 280, 370)
			 _ControlDrag($gameHandle, "left", 340, 975, 450, 370)
			 _ControlDrag($gameHandle, "left", 340, 975, 110, 550)
			 _ControlDrag($gameHandle, "left", 340, 975, 280, 550)
			 _ControlDrag($gameHandle, "left", 340, 975, 450, 550)
			 _ControlDrag($gameHandle, "left", 340, 975, 110, 740)
			 _ControlDrag($gameHandle, "left", 340, 975, 280, 740)
			 _ControlDrag($gameHandle, "left", 340, 975, 450, 740)

			 ;fifth card
			 _ControlDrag($gameHandle, "left", 425, 975, 110, 370)
			 _ControlDrag($gameHandle, "left", 425, 975, 280, 370)
			 _ControlDrag($gameHandle, "left", 425, 975, 450, 370)
			 _ControlDrag($gameHandle, "left", 425, 975, 110, 550)
			 _ControlDrag($gameHandle, "left", 425, 975, 280, 550)
			 _ControlDrag($gameHandle, "left", 425, 975, 450, 550)
			 _ControlDrag($gameHandle, "left", 425, 975, 110, 740)
			 _ControlDrag($gameHandle, "left", 425, 975, 280, 740)
			 _ControlDrag($gameHandle, "left", 425, 975, 450, 740)
		  Else
			 sleep(5000)
			 $playingRD = False
			 $draftPick = True
			 SetStatus("Drafting")
		  EndIf
	   WEnd ;=>PlayingRD

	   while($draftPick)
		  Local $cardSearch = MemoryReadPixel(331, 185, $gameHandle)
		  Local $tapSearch = MemoryReadPixel(367, 863, $gameHandle)
		  Local $doneSearch = MemoryReadPixel(248, 969, $gameHandle)
		  if $cardSearch = 0xFAEBFA Then
			 ;first row
			 ControlClick($gameHandle,"","", "left", 1, 120, 330)
			 ControlClick($gameHandle,"","", "left", 1, 180, 330)
			 ControlClick($gameHandle,"","", "left", 1, 250, 330)
			 ControlClick($gameHandle,"","", "left", 1, 320, 330)
			 ControlClick($gameHandle,"","", "left", 1, 380, 330)
			 ControlClick($gameHandle,"","", "left", 1, 430, 330)
			 ;second row
			 ControlClick($gameHandle,"","", "left", 1, 110, 390)
			 ControlClick($gameHandle,"","", "left", 1, 175, 390)
			 ControlClick($gameHandle,"","", "left", 1, 240, 390)
			 ControlClick($gameHandle,"","", "left", 1, 320, 390)
			 ControlClick($gameHandle,"","", "left", 1, 385, 390)
			 ControlClick($gameHandle,"","", "left", 1, 450, 390)
			 ;third row
			 ControlClick($gameHandle,"","", "left", 1, 130, 500)
			 ControlClick($gameHandle,"","", "left", 1, 215, 500)
			 ControlClick($gameHandle,"","", "left", 1, 345, 500)
			 ControlClick($gameHandle,"","", "left", 1, 430, 500)
			 ;fourth row
			 ControlClick($gameHandle,"","", "left", 1, 130, 560)
			 ControlClick($gameHandle,"","", "left", 1, 200, 560)
			 ControlClick($gameHandle,"","", "left", 1, 360, 560)
			 ControlClick($gameHandle,"","", "left", 1, 430, 560)
			 ;fifth row
			 ControlClick($gameHandle,"","", "left", 1, 110, 670)
			 ControlClick($gameHandle,"","", "left", 1, 220, 670)
			 ControlClick($gameHandle,"","", "left", 1, 320, 670)
			 ControlClick($gameHandle,"","", "left", 1, 460, 670)
			 ;sixth row
			 ControlClick($gameHandle,"","", "left", 1, 130, 725)
			 ControlClick($gameHandle,"","", "left", 1, 200, 725)
			 ControlClick($gameHandle,"","", "left", 1, 360, 725)
			 ControlClick($gameHandle,"","", "left", 1, 440, 725)
			 ;seventh row
			 ControlClick($gameHandle,"","", "left", 1, 120, 790)
			 ControlClick($gameHandle,"","", "left", 1, 250, 790)
			 ControlClick($gameHandle,"","", "left", 1, 320, 790)
			 ControlClick($gameHandle,"","", "left", 1, 430, 790)
			 ;last row
			 ControlClick($gameHandle,"","", "left", 1, 150, 830)
			 ControlClick($gameHandle,"","", "left", 1, 210, 830)
			 ControlClick($gameHandle,"","", "left", 1, 350, 830)
			 ControlClick($gameHandle,"","", "left", 1, 420, 830)
		  EndIf

		  ;tap to continue
		  if $tapSearch = 0xFAEBFA Then
			 ControlClick($gameHandle,"","", "left", 1, 285, 888)
		  EndIf

		  ;done button
		  if $doneSearch = 0xC4E7FF Then
			 sleep(1000)
			 ControlClick($gameHandle,"","", "left", 1, 270, 960)
			 $draftPick = False
			 SetStatus("Menu")
		  EndIf
		WEnd ;=>DraftPicks
	WEnd ;=>MainLoop
EndFunc

#Region ====Hide Game====
Func HideGame()
   if $HideStatus = False then
	  MsgBox(0, "Hiding", "Hiding Game")
	  WinMove($gameHandle, "",2000,1)
	  Sleep(100)
	  WinMove($gameHandle2, "",2555,31)
	  $hideStatus = True
   Else
	  WinMove($gameHandle, "",1200,1)
	  Sleep(100)
	  WinMove($gameHandle2, "",1755,31)
	  $HideStatus = False
   EndIf
EndFunc ;=>HideGame
#EndRegion

#Region ====Pause Game====
Func PauseGame()
	If $startRD = True Then
		MsgBox(0, "Paused", "Bot is Paused.")
		$startWild = False
		Sleep(100)
		SetStatus("Paused")
	Else
		MsgBox(0, "Running", "Bot is resumed.")
		$startWild = True
		RingDomination()
		Sleep(100)
	EndIf
EndFunc
#EndRegion

#Region ====Stop Game====
Func StopGame()
	If $startRD = True Then
		MsgBox(0, "Stopped", "Bot is Stopped")
		$startWild = False
		Sleep(100)
		SetStatus("Stopped")
	EndIf
EndFunc
#EndRegion

#Region ====Bot Exit====
Func BotExit()
	  MsgBox(0, "Ending", "Bot Exited")
	  Exit
EndFunc ;=>BotExit
#EndRegion

func SetStatus($status)
	GUICtrlSetData($lblStatusHere, $status)
EndFunc ;=>SetStatus

Func MemoryReadPixel($x, $y, $handle)
   Local $hDC
   Local $iColor
   Local $sColor

   $hDC = _WinAPI_GetWindowDC($handle)
   $iColor = DllCall("gdi32.dll", "int", "GetPixel", _
		"int", $hDC, _
		"int", $x, _
		"int", $y)
   $sColor = Hex($iColor[0], 6)
   $rsColor = "0x"&Hex("0x"&StringRight($sColor,2)&StringMid($sColor,3,2) & StringLeft($sColor,2),6)
   _WinAPI_ReleaseDC($handle, $hDC)
   Return $rsColor
EndFunc ;=>MemoryReadPixel

Func _ControlDrag($Window, $Button, $X1, $Y1, $X2, $Y2)
   Local $MK_LBUTTON       =  0x0001
   Local $WM_LBUTTONDOWN   =  0x0201
   Local $WM_LBUTTONUP     =  0x0202

   Local $MK_RBUTTON       =  0x0002
   Local $WM_RBUTTONDOWN   =  0x0204
   Local $WM_RBUTTONUP     =  0x0205

   Local $WM_MOUSEMOVE     =  0x0200


   Select
   Case $Button = "left"
	  $Button     =  $MK_LBUTTON
	  $ButtonDown =  $WM_LBUTTONDOWN
	  $ButtonUp   =  $WM_LBUTTONUP
   Case $Button = "right"
	  $Button     =  $MK_RBUTTON
	  $ButtonDown =  $WM_RBUTTONDOWN
	  $ButtonUp   =  $WM_RBUTTONUP
   EndSelect

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $WM_MOUSEMOVE, _
	  "int",   0, _
	  "long",  _MakeLong($X1, $Y1))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonDown, _
	  "int",   $Button, _
	  "long",  _MakeLong($X1, $Y1))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $WM_MOUSEMOVE, _
	  "int",   0, _
	  "long",  _MakeLong($X2, $Y2))
	Sleep(100)

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonUp, _
	  "int",   $Button, _
	  "long",  _MakeLong($X2, $Y2))
	Sleep(100)




EndFunc ;=>_ControlDrag

Func _MakeLong($LoWord,$HiWord)
  Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))
EndFunc ;=>_MakeLong