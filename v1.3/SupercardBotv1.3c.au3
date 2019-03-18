#RequireAdmin
#NoTrayIcon
#include<ButtonConstants.au3>
#include<ComboConstants.au3>
#include<GUIConstants.au3>
#include<GUIConstantsEx.au3>
#include<StaticConstants.au3>
#include<WindowsConstants.au3>
#include<WinAPI.au3>
#include<GDIPlus.au3>
#include<Color.au3>

#Region ===== Hotkeys =====
;HotKeySet("{f2}", "PauseGame")
HotKeySet("{f1}", "StopGame")
;HotKeySet("{f3}", "HideGame")
HotKeySet("{f4}", "BotExit")
#EndRegion

#Region /===Global Variables===/
Global $GameHandle = WinGetHandle("[CLASS:Qt5QWindowIcon]")
Global $GameHandle2 = WinGetHandle("[CLASS:Qt5QWindowToolSaveBits]")
Global $StartWild = False
Global $OnMenuWild = False
Global $PlayingWild = False
Global $PlayingRTG = False
Global $StartRTG = False
Global $HideStatus = False
#EndRegion

#Region /========== GUI Design ==========/
$SCBot = GUICreate("WWE Superbot v0.1.3b", 281, 332, -1, -1)
GUISetIcon("D:\AutoIt Project\WWE Superbot\images\gui\sc.ico", -1)
GUISetBkColor(0x808080)
$btnStart = GUICtrlCreateButton("START", 32, 248, 220, 40)
GUICtrlSetColor(-1, 0x000000)
$lblStatus = GUICtrlCreateLabel("Status:", 32, 296, 37, 17)
GUICtrlSetColor(-1, 0x000000)
$lblStatusHere = GUICtrlCreateLabel("Status Here", 72, 296, 180, 17)
GUICtrlSetColor(-1, 0x00FF00)
$Menu = GUICtrlCreateGroup("Main Menu", 32, 16, 220, 225)
GUICtrlSetColor(-1, 0x000000)
$lblF1 = GUICtrlCreateLabel("[F1] - Stop Bot", 48, 216, 72, 17)
$lblF4 = GUICtrlCreateLabel("[F4] - Exit Bot", 144, 216, 67, 17)
$lblHotkeys = GUICtrlCreateLabel("==========Hotkeys==========", 48, 176, 194, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$lblMode = GUICtrlCreateLabel("=======GAME MODE========", 48, 128, 191, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$cboMode = GUICtrlCreateCombo("", 48, 152, 185, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "===SELECT MODE===|Wild Mode|War Mode|Royal Rumble|Women"&Chr(39)&"s Royal Rumble|Elimination Chamber|Money in the Bank|<Event> Ring Domination|<Event> Road to Glory|<Event> Last Man Standing|<Team> Ring Domination|<Team> Road to Glory", "===SELECT MODE===")
$imgLogo = GUICtrlCreatePic("D:\AutoIt Project\WWE Superbot\images\gui\sc.jpg", 48, 40, 188, 76)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion

#Region //===== MAIN LOOP =====//
While 1
	Menu()
WEnd
#EndRegion

#Region ====Main Menu====
Func Menu()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnStart
			MsgBox(0,"WWE Supercard Bot v0.1.3", "Bot will now start...", 5, $GameHandle)
			GUICtrlSetData($btnStart, "RUNNING...")
			GUICtrlSetState($btnStart, $GUI_DISABLE)

			$GameMode = GUICtrlRead($cboMode)
			If $GameMode = "Wild Mode" Then
				$StartWild = True
				WildMode()
			ElseIf $GameMode = "<Event> Road to Glory" Then
				$StartRTG = True
				RoadToGlory()
			EndIf

	EndSwitch
EndFunc
#EndRegion

#Region =====Wild Mode=====
Func WildMode()
	while($StartWild)
	   Local $WildSearch = MemoryReadPixel(161, 815, $GameHandle)
	   Local $PlaySearch = MemoryReadPixel(387, 424, $GameHandle)
	   Local $StillLoading = MemoryReadPixel(195, 547, $GameHandle)
	   Local $StillWild = MemoryReadPixel(280, 50, $GameHandle)
	   Local $StillWild2 = MemoryReadPixel(303, 1015, $GameHandle)
	   Local $DoneSearch = MemoryReadPixel(270, 960, $GameHandle)

	   ;find wild menu
	   If $WildSearch = 0xEBA80F Then
		  ;click wild
		  ControlClick($GameHandle,"","", "left", 1, 161, 815)
		  $OnMenuWild = True
		  SetStatus("Wild Menu")
		  Sleep(1000)
	   Else
		  _ControlDrag($GameHandle, "left", 10, 800, 450, 800)
		  Sleep(1000)
	   EndIf
	   ;find play button
	   If $PlaySearch = 0xCFF0FF Then
		  ;click play
		  ControlClick($GameHandle,"","", "left", 1, 387, 424)
		  SetStatus("Loading")
		  Sleep(1000)
	   ;wait for loading
	   ElseIf $StillLoading = 0xEFBE55 Then
		  Sleep(3500)
	   ElseIf $StillWild = 0xFAEBFA And $StillWild2 = 0xFDCE2B Then
		  $PlayingWild = True
		  SetStatus("Playing Wild Mode")
	   EndIf

	   ;playing Wild mode
	   while($PlayingWild)
		  ;pixels to search
		  Local $StillWild = MemoryReadPixel(280, 50, $GameHandle)
		  Local $StillLoading = MemoryReadPixel(195, 547, $GameHandle)
		  Local $CardSearch = MemoryReadPixel(272, 860, $GameHandle)
		  Local $TapSearch = MemoryReadPixel(285, 888, $GameHandle)
		  Local $DoneSearch = MemoryReadPixel(386, 990, $GameHandle)

		  ;still playing?
		  If $StillWild = 0xFAEBFA Then
			 SetStatus("Playing Wild Mode")
			 ControlClick($GameHandle,"","", "left", 1, 425, 900)
			 ControlClick($GameHandle,"","", "left", 1, 100, 975)
			 ControlClick($GameHandle,"","", "left", 1, 175, 975)
			 ControlClick($GameHandle,"","", "left", 1, 260, 975)
			 ControlClick($GameHandle,"","", "left", 1, 340, 975)
			 ControlClick($GameHandle,"","", "left", 1, 425, 975)
			 ControlClick($GameHandle,"","", "left", 1, 510, 975)
		  ElseIf $StillLoading = 0xEFBE55 Then
			 Sleep(2500)
			 SetStatus("Loading...")
		  ElseIf $CardSearch = 0xFAEBFA Then
			 SetStatus("Drafting...")
			 ;first row
			 ControlClick($GameHandle,"","", "left", 1, 65, 250)
			 ControlClick($GameHandle,"","", "left", 1, 175, 250)
			 ControlClick($GameHandle,"","", "left", 1, 285, 250)
			 ControlClick($GameHandle,"","", "left", 1, 395, 250)
			 ControlClick($GameHandle,"","", "left", 1, 500, 250)
			 ;second row
			 ControlClick($GameHandle,"","", "left", 1, 65, 375)
			 ControlClick($GameHandle,"","", "left", 1, 175, 375)
			 ControlClick($GameHandle,"","", "left", 1, 285, 375)
			 ControlClick($GameHandle,"","", "left", 1, 395, 375)
			 ControlClick($GameHandle,"","", "left", 1, 500, 375)
			 ;third row
			 ControlClick($GameHandle,"","", "left", 1, 65, 500)
			 ControlClick($GameHandle,"","", "left", 1, 175, 500)
			 ControlClick($GameHandle,"","", "left", 1, 285, 500)
			 ControlClick($GameHandle,"","", "left", 1, 395, 500)
			 ControlClick($GameHandle,"","", "left", 1, 500, 500)
			 ;fourth row
			 ControlClick($GameHandle,"","", "left", 1, 65, 625)
			 ControlClick($GameHandle,"","", "left", 1, 175, 625)
			 ControlClick($GameHandle,"","", "left", 1, 285, 625)
			 ControlClick($GameHandle,"","", "left", 1, 395, 625)
			 ControlClick($GameHandle,"","", "left", 1, 500, 625)
			 ;last row
			 ControlClick($GameHandle,"","", "left", 1, 65, 750)
			 ControlClick($GameHandle,"","", "left", 1, 175, 750)
			 ControlClick($GameHandle,"","", "left", 1, 285, 750)
			 ControlClick($GameHandle,"","", "left", 1, 395, 750)
			 ControlClick($GameHandle,"","", "left", 1, 500, 750)
		  ;tap to continue
		  ElseIf $TapSearch = 0xFAEBFA Then
			 ControlClick($GameHandle,"","", "left", 1, 175, 907)
		  ;done button
		  ElseIf $DoneSearch = 0xECFFFF Then
			 Sleep(1000)
			 ControlClick($GameHandle,"","", "left", 1, 330, 960)
			 $PlayingWild = False
			 SetStatus("Wild Menu")
		  Else
			 SetStatus("Working...")
			 Sleep(2500)
			 ControlClick($GameHandle,"","", "left", 1, 330, 960)
		  EndIf
		WEnd ;=>PlayingWild
	WEnd ;=>MainLoop
EndFunc
#EndRegion

#Region =====Road to Glory=====
Func RoadToGlory()
	while($StartRTG)
	   Local $RTGSearch = MemoryReadPixel(152, 564, $GameHandle)
	   Local $PlaySearch = MemoryReadPixel(303, 811, $GameHandle)
	   Local $ChooseOpponent = MemoryReadPixel(486, 796, $GameHandle)
	   Local $ChooseOpponent2 = MemoryReadPixel(478, 795, $GameHandle)
	   Local $StillLoading = MemoryReadPixel(233, 510, $GameHandle)
	   Local $StillRTG = MemoryReadPixel(194, 47, $GameHandle)
	   Local $StillRTG2 = MemoryReadPixel(45, 796, $GameHandle)
	   Local $DoneSearch = MemoryReadPixel(270, 960, $GameHandle)

	   ;find rtg menu
	   If $RTGSearch = 0xFFCE00 Then
		  ;click rtg
		  ControlClick($GameHandle,"","", "left", 1, 152, 564)
		  SetStatus("RTG Menu")
		  Sleep(1000)
	   ;find play button
	   ElseIf $PlaySearch = 0xFFD445 Then
		  ;click play
		  ControlClick($GameHandle,"","", "left", 1, 303, 811)
		  SetStatus("Choosing an opponent")
	   ;choose an opponent
	   ElseIf $PlaySearch = 0x768797 Then
		  SetStatus("Out of Bouts")
		  Sleep(910000)
	   ElseIf $ChooseOpponent = 0xFCF8FF Or $ChooseOpponent2 = 0xFFFF7A Then
		   ControlClick($GameHandle,"","", "left", 1, 486, 796)
		   SetStatus("Loading")
	   ;wait for loading
	   ElseIf $StillLoading = 0xFFBB00 Then
		  Sleep(3500)
	   ElseIf $StillRTG = 0xFAEBFA And $StillRTG2 = 0xB9CBFF Then
		  $PlayingRTG = True
		  SetStatus("RTG Mode")
	   Else
		  _ControlDrag($GameHandle, "left", 10, 800, 450, 800)
		  Sleep(1000)
	   EndIf

	   ;playing RTG mode
	   while($PlayingRTG)
		  ;pixels to search
		  Local $StillRTG = MemoryReadPixel(195, 47, $GameHandle)
		  Local $StillLoading = MemoryReadPixel(233, 510, $GameHandle)
		  Local $TapFromPoints = MemoryReadPixel(427, 816, $GameHandle)
		  Local $CardSearch = MemoryReadPixel(311, 933, $GameHandle)
		  Local $TapSearch = MemoryReadPixel(175, 907, $GameHandle)
		  Local $DoneSearch = MemoryReadPixel(271, 873, $GameHandle)

		  ;still playing?
		  If $StillRTG = 0xFAEBFA Then
			 ControlClick($GameHandle,"","", "left", 1, 490, 850)
			 ControlClick($GameHandle,"","", "left", 1, 120, 950)
			 ControlClick($GameHandle,"","", "left", 1, 250, 950)
			 ControlClick($GameHandle,"","", "left", 1, 360, 950)
			 ControlClick($GameHandle,"","", "left", 1, 475, 950)
		  ElseIf $StillLoading = 0xFFBB00 Then
			 Sleep(2500)
			 SetStatus("Loading...")
		  ElseIf $TapFromPoints = 0x8DAFFF Then
			 ControlClick($GameHandle,"","", "left", 1, 427, 816)
			 SetStatus("Points Received")
		  ElseIf $CardSearch = 0xAA1813 Then
			 SetStatus("Drafting...")
			 ;first row
			 ControlClick($GameHandle,"","", "left", 1, 65, 250)
			 ControlClick($GameHandle,"","", "left", 1, 175, 250)
			 ControlClick($GameHandle,"","", "left", 1, 285, 250)
			 ControlClick($GameHandle,"","", "left", 1, 395, 250)
			 ControlClick($GameHandle,"","", "left", 1, 500, 250)
			 ;second row
			 ControlClick($GameHandle,"","", "left", 1, 65, 375)
			 ControlClick($GameHandle,"","", "left", 1, 175, 375)
			 ControlClick($GameHandle,"","", "left", 1, 285, 375)
			 ControlClick($GameHandle,"","", "left", 1, 395, 375)
			 ControlClick($GameHandle,"","", "left", 1, 500, 375)
			 ;third row
			 ControlClick($GameHandle,"","", "left", 1, 65, 500)
			 ControlClick($GameHandle,"","", "left", 1, 175, 500)
			 ControlClick($GameHandle,"","", "left", 1, 285, 500)
			 ControlClick($GameHandle,"","", "left", 1, 395, 500)
			 ControlClick($GameHandle,"","", "left", 1, 500, 500)
			 ;fourth row
			 ControlClick($GameHandle,"","", "left", 1, 65, 625)
			 ControlClick($GameHandle,"","", "left", 1, 175, 625)
			 ControlClick($GameHandle,"","", "left", 1, 285, 625)
			 ControlClick($GameHandle,"","", "left", 1, 395, 625)
			 ControlClick($GameHandle,"","", "left", 1, 500, 625)
			 ;last row
			 ControlClick($GameHandle,"","", "left", 1, 65, 750)
			 ControlClick($GameHandle,"","", "left", 1, 175, 750)
			 ControlClick($GameHandle,"","", "left", 1, 285, 750)
			 ControlClick($GameHandle,"","", "left", 1, 395, 750)
			 ControlClick($GameHandle,"","", "left", 1, 500, 750)
		  ;tap to continue
		  ElseIf $TapSearch = 0xFAEBFA Then
			 ControlClick($GameHandle,"","", "left", 1, 175, 907)
		  ;done button
		  ElseIf $DoneSearch = 0x670000 Then
			 Sleep(1000)
			 $PlayingRTG = False
			 SetStatus("RTG Menu")
		  Else
			 SetStatus("Not Found")
			 Sleep(2500)
			 ControlClick($GameHandle,"","", "left", 1, 330, 960)
		  EndIf
		WEnd ;=>PlayingRTG
	WEnd ;=>MainLoop
EndFunc
#EndRegion

#Region ====Hide Game====
Func HideGame()
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
EndFunc ;=>HideGame
#EndRegion

#Region ====Pause Game====
Func PauseGame()
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
EndFunc
#EndRegion

#Region ====Stop Game====
Func StopGame()
		MsgBox(0, "Stopped", "Bot is Stopped")
		$StartWild = False
		$PlayingWild = False
		$StartRTG = False
		$PlayingRTG = False
		GUICtrlSetData($btnStart, "START")
		GUICtrlSetState($btnStart, $GUI_ENABLE)
		Sleep(100)
		SetStatus("Stopped")
EndFunc
#EndRegion

#Region ====Bot Exit====
Func BotExit()
	  MsgBox(0, "Ending", "Bot Exited")
	  Exit
EndFunc ;=>BotExit
#EndRegion

#Region ====Set Status===
Func SetStatus($status)
	GUICtrlSetData($lblStatusHere, $status)
EndFunc ;=>SetStatus
#EndRegion

#Region ====MemoryReadPixel====
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
#EndRegion

#Region ====Control Drag====
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
#EndRegion

#Region ==== Make Long ====
Func _MakeLong($LoWord,$HiWord)
  Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))
EndFunc ;=>_MakeLong
#EndRegion