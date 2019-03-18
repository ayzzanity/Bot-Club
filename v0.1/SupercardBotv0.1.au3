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

while(1)
   Local $wildSearch = MemoryReadPixel(161, 815, $gameHandle)
   Local $playSearch = MemoryReadPixel(320, 347, $gameHandle)
   Local $loadingDone = MemoryReadPixel(195, 547, $gameHandle)
   Local $stillWild = MemoryReadPixel(280, 50, $gameHandle)
   Local $stillWIld2 = MemoryReadPixel(303, 1015, $gameHandle)

   ;find wild menu
   if $wildSearch = 0xEBA80F then
	  ;click wild
	  ControlClick($gameHandle,"","", "left", 1, 161, 815)
	  sleep(1000)
   EndIf

   ;find play button
   if $playSearch = 0xAAA0AA then
	  ;click play
	  ControlClick($gameHandle,"","", "left", 1, 400, 425)
   EndIf

   ;wait for loading
   if $loadingDone = 0xEFBE55 Then
	  sleep(2500)
   ElseIf $stillWild = 0xFAEBFA And $stillWild2 = 0xFDCE2B Then
	  $playingWild = True
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
	  EndIf
   WEnd

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
		 ControlClick($gameHandle,"","", "left", 1, 270, 960)
		 delay(1000)
		 $draftPick = False
	  EndIf
   WEnd
WEnd

Func MemoryReadPixel($x, $y, $handle)
   Local $hDC
   Local $iColor
   Local $sColor

   $hDC = _WinAPI_GetWindowDC($handle)
   $iColor = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $x, "int", $y)
   $sColor = Hex($iColor[0], 6)
   $rsColor = "0x"&Hex("0x"&StringRight($sColor,2)&StringMid($sColor,3,2) & StringLeft($sColor,2),6)
   _WinAPI_ReleaseDC($handle, $hDC)
   Return $rsColor
EndFunc

func BotExit()
	  MsgBox(0, "Ending", "Bot Exited")
	  Exit
EndFunc