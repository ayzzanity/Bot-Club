#RequireAdmin
#NoTrayIcon
#include<ButtonConstants.au3>
#include<GUIConstantsEx.au3>
#include<WindowsConstants.au3>
#include<WinAPI.au3>
#include<GDIPlus.au3>
#include<Color.au3>

HotKeySet("{f1}", "BotExit")

Global $gameHandle = WinGetHandle("[CLASS:Qt5QWindowIcon]")
Global $gameHandle2 = WinGetHandle("[CLASS:Qt5QWindowToolSaveBits]")
Global $playingWild = False
Global $draftPick = False
Global $startWild = False
Global $hideStatus = False


#Region ### START Koda GUI section ### Form=d:\autoit project\scbot.kxf
$SCBot = GUICreate("WWE Supercard Bot v0.0.1", 320, 139, -1, -1)
GUISetIcon("Z:\Odin3 v3.12.3\Odin3.exe", -1)
GUISetBkColor(0x000000)
$btnStart = GUICtrlCreateButton("START", 56, 16, 107, 57)
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
			$startWild = True
			wildGame()
	EndSwitch
EndFunc

func wildGame()
	while($startWild)
	   Local $wildSearch = MemoryReadPixel(161, 815, $gameHandle)
	   Local $playSearch = MemoryReadPixel(387, 424, $gameHandle)
	   Local $loadingDone = MemoryReadPixel(195, 547, $gameHandle)
	   Local $stillWild = MemoryReadPixel(280, 50, $gameHandle)
	   Local $stillWIld2 = MemoryReadPixel(303, 1015, $gameHandle)
	   Local $doneSearch = MemoryReadPixel(270, 960, $gameHandle)
	   Local $cardSearch = MemoryReadPixel(272, 860, $gameHandle)
	   Local $tapSearch = MemoryReadPixel(285, 888, $gameHandle)
	   Local $doneSearch = MemoryReadPixel(270, 960, $gameHandle)

	   ;find wild menu
	   if $wildSearch = 0xEBA80F then
		  ;click wild
		  ControlClick($gameHandle,"","", "left", 1, 161, 815)
		  SetStatus("Wild Menu")
		  sleep(1000)
	   Else
		  _ControlDrag($gameHandle, "left", 10, 800, 450, 800)
		  sleep(1000)
	   EndIf

	   ;find play button
	   if $playSearch = 0xCFF0FF then
		  ;click play
		  ControlClick($gameHandle,"","", "left", 1, 387, 424)
		  SetStatus("Loading")
	   EndIf

	   ;wait for loading
	   if $loadingDone = 0xEFBE55 Then
		  sleep(2500)
	   ElseIf $stillWild = 0xFAEBFA And $stillWild2 = 0xFDCE2B Then
		  $playingWild = True
		  SetStatus("Wild Mode")
	   EndIf

	   ;check if still drafting
	   if $cardSearch = 0xFAEBFA Or $tapSearch = 0xFAEBFA Or $doneSearch = 0x000000 Then
		   $draftPick = True
	   EndIf

	   ;playing wild mode
	   while($playingWild)
		  ;still playing?
		  Local $stillWild = MemoryReadPixel(280, 50, $gameHandle)
		  if $stillWild = 0xFAEBFA then
			 ControlClick($gameHandle,"","", "left", 1, 425, 900)
			 ControlClick($gameHandle,"","", "left", 1, 100, 975)
			 ControlClick($gameHandle,"","", "left", 1, 175, 975)
			 ControlClick($gameHandle,"","", "left", 1, 260, 975)
			 ControlClick($gameHandle,"","", "left", 1, 340, 975)
			 ControlClick($gameHandle,"","", "left", 1, 425, 975)
			 ControlClick($gameHandle,"","", "left", 1, 510, 975)
		  Else
			 sleep(5000)
			 $playingWild = False
			 $draftPick = True
			 SetStatus("Drafting")
		  EndIf
	   WEnd ;=>PlayingWild

	   while($draftPick)
		  Local $cardSearch = MemoryReadPixel(272, 860, $gameHandle)
		  Local $tapSearch = MemoryReadPixel(285, 888, $gameHandle)
		  Local $doneSearch = MemoryReadPixel(270, 960, $gameHandle)
		  if $cardSearch = 0xFAEBFA Then
			 ;first row
			 ControlClick($gameHandle,"","", "left", 1, 65, 250)
			 ControlClick($gameHandle,"","", "left", 1, 175, 250)
			 ControlClick($gameHandle,"","", "left", 1, 285, 250)
			 ControlClick($gameHandle,"","", "left", 1, 395, 250)
			 ControlClick($gameHandle,"","", "left", 1, 500, 250)
			 ;second row
			 ControlClick($gameHandle,"","", "left", 1, 65, 375)
			 ControlClick($gameHandle,"","", "left", 1, 175, 375)
			 ControlClick($gameHandle,"","", "left", 1, 285, 375)
			 ControlClick($gameHandle,"","", "left", 1, 395, 375)
			 ControlClick($gameHandle,"","", "left", 1, 500, 375)
			 ;third row
			 ControlClick($gameHandle,"","", "left", 1, 65, 500)
			 ControlClick($gameHandle,"","", "left", 1, 175, 500)
			 ControlClick($gameHandle,"","", "left", 1, 285, 500)
			 ControlClick($gameHandle,"","", "left", 1, 395, 500)
			 ControlClick($gameHandle,"","", "left", 1, 500, 500)
			 ;fourth row
			 ControlClick($gameHandle,"","", "left", 1, 65, 625)
			 ControlClick($gameHandle,"","", "left", 1, 175, 625)
			 ControlClick($gameHandle,"","", "left", 1, 285, 625)
			 ControlClick($gameHandle,"","", "left", 1, 395, 625)
			 ControlClick($gameHandle,"","", "left", 1, 500, 625)
			 ;last row
			 ControlClick($gameHandle,"","", "left", 1, 65, 750)
			 ControlClick($gameHandle,"","", "left", 1, 175, 750)
			 ControlClick($gameHandle,"","", "left", 1, 285, 750)
			 ControlClick($gameHandle,"","", "left", 1, 395, 750)
			 ControlClick($gameHandle,"","", "left", 1, 500, 750)
		  EndIf

		  ;tap to continue
		  if $tapSearch = 0xFAEBFA Then
			 ControlClick($gameHandle,"","", "left", 1, 285, 888)
		  EndIf

		  ;done button
		  if $doneSearch = 0x000000 Then
			 sleep(1000)
			 ControlClick($gameHandle,"","", "left", 1, 270, 960)
			 $draftPick = False
			 SetStatus("Menu")
		  EndIf
		WEnd ;=>DraftPicks
	WEnd ;=>MainLoop
EndFunc

func BotExit()
	  MsgBox(0, "Ending", "Bot Exited")
	  Exit
EndFunc ;=>BotExit

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


	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonDown, _
	  "int",   $Button, _
	  "long",  _MakeLong($X1, $Y1))


	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $WM_MOUSEMOVE, _
	  "int",   0, _
	  "long",  _MakeLong($X2, $Y2))

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonUp, _
	  "int",   $Button, _
	  "long",  _MakeLong($X2, $Y2))

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $WM_MOUSEMOVE, _
	  "int",   0, _
	  "long",  _MakeLong($X1, $Y1))


	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonDown, _
	  "int",   $Button, _
	  "long",  _MakeLong($X1, $Y1))


	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $WM_MOUSEMOVE, _
	  "int",   0, _
	  "long",  _MakeLong($X2, $Y2))

	DllCall("user32.dll", "int", "SendMessage", _
	  "hwnd",  $Window, _
	  "int",   $ButtonUp, _
	  "int",   $Button, _
	  "long",  _MakeLong($X2, $Y2))




EndFunc ;=>_ControlDrag

Func _MakeLong($LoWord,$HiWord)
  Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))
EndFunc ;=>_MakeLong