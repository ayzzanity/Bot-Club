#Region **** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\WWE Superbot\images\gui\sc.ico
#EndRegion

#NoTrayIcon
#RequireAdmin
#include<ButtonConstants.au3>
#include<ComboConstants.au3>
#include<GUIConstants.au3>
#include<GUIConstantsEx.au3>
#include<GUIComboBox.au3>
#include<StaticConstants.au3>
#include<WindowsConstants.au3>
#include<WinAPI.au3>
#include<GDIPlus.au3>
#include<Color.au3>

#Region ===== Hotkeys =====
HotKeySet("{f1}", "StopGame")
;HotKeySet("{f2}", "PauseGame")
;HotKeySet("{f3}", "HideGame")
HotKeySet("{f4}", "BotExit")
#EndRegion

#Region /===Global Variables===/
Global $GameHandle = WinGetHandle("[CLASS:Qt5QWindowIcon]")
Global $GameHandle2 = WinGetHandle("[CLASS:Qt5QWindowToolSaveBits]")
Global $StartWild = False
Global $OnMenuWild = False
Global $PlayingWild = False
Global $StartRTG = False
Global $OnMenuRTG = False
Global $PlayingRTG = False
Global $HideStatus = False
Global $Training = False
Global $State = False
#EndRegion

#Region /========== GUI Design ==========/
$SCBot = GUICreate("WWE Superbot v1.4c", 281, 332, -1, -1)
GUISetIcon("D:\AutoIt Project\WWE Superbot\images\gui\sc.ico", -1)
GUISetBkColor(0x808080)
$btnStart = GUICtrlCreateButton("START", 32, 248, 220, 40)
GUICtrlSetColor(-1, 0x000000)
$lblStatus = GUICtrlCreateLabel("Status:", 32, 296, 37, 17)
GUICtrlSetColor(-1, 0x000000)
$lblStatusHere = GUICtrlCreateLabel("Not Running...", 72, 296, 180, 17)
GUICtrlSetColor(-1, 0x00FF00)
$Menu = GUICtrlCreateGroup("Main Menu", 32, 16, 220, 225)
GUICtrlSetColor(-1, 0x000000)
$lblDifficulty = GUICtrlCreateLabel("Difficulty:", 48, 176, 47, 17)
GUICtrlSetColor(-1, 0x000000)
$cboDifficulty = GUICtrlCreateCombo("", 96, 168, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "+5|+3|+1")
$lblF1 = GUICtrlCreateLabel("[F1] - Stop Bot", 48, 216, 72, 17)
$lblF4 = GUICtrlCreateLabel("[F4] - Exit Bot", 144, 216, 67, 17)
$lblHotkeys = GUICtrlCreateLabel("==========Hotkeys==========", 48, 192, 194, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$lblMode = GUICtrlCreateLabel("=======GAME MODE========", 48, 120, 191, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$cboMode = GUICtrlCreateCombo("", 48, 144, 185, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "===SELECT MODE===|Training Test|Wild Mode|War Mode|Royal Rumble|Womens Royal Rumble|Elimination Chamber|Money in the Bank|Ring Domination|Road to Glory|Last Man Standing|<Team> Ring Domination|<Team> Road to Glory", "===SELECT MODE===")
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
			$GameMode = GUICtrlRead($cboMode)
			If $GameMode = "Wild Mode" Then
				MsgBox(0,"WWE Supercard Bot v1.4c", "Bot will now start...", 5, $GameHandle)
				GUICtrlSetData($btnStart, "RUNNING...")
				GUICtrlSetState($btnStart, $GUI_DISABLE)
				GUICtrlSetState($cboMode, $GUI_DISABLE)
				GUICtrlSetState($cboDifficulty, $GUI_DISABLE)
				$StartWild = True
				WildMode()
			ElseIf $GameMode = "Road to Glory" Then
				MsgBox(0,"WWE Supercard Bot v1.4b", "Bot will now start...", 5, $GameHandle)
				GUICtrlSetData($btnStart, "RUNNING...")
				GUICtrlSetState($btnStart, $GUI_DISABLE)
				GUICtrlSetState($cboMode, $GUI_DISABLE)
				GUICtrlSetState($cboDifficulty, $GUI_DISABLE)
				$StartRTG = True
				RoadToGlory()
			ElseIf $GameMode = "Training Test" Then
				MsgBox(0,"WWE Supercard Bot v1.4b", "Bot will now start...", 5, $GameHandle)
				GUICtrlSetData($btnStart, "RUNNING...")
				GUICtrlSetState($btnStart, $GUI_DISABLE)
				GUICtrlSetState($cboMode, $GUI_DISABLE)
				GUICtrlSetState($cboDifficulty, $GUI_DISABLE)
				$Training = True
				TrainCards()
			Else
				MsgBox(0,"Error", "Game Mode not yet available...", 5, $GameHandle)
			EndIf
	EndSwitch
EndFunc
#EndRegion

#Region =====Wild Mode=====
Func WildMode()
	while($StartWild)
	   Local $WildSearch = MemoryReadPixel(161, 815, $GameHandle)
	   Local $OnWild = MemoryReadPixel(387, 424, $GameHandle)
	   Local $MaxCards = MemoryReadPixel(72, 358, $GameHandle)
	   Local $MaxCards2 = MemoryReadPixel(484, 356, $GameHandle)
	   Local $MaxEnergy = MemoryReadPixel(167, 455, $GameHandle)

	   ;find wild menu
	   If $OnMenuWild = False and $PlayingWild = False Then
		   If $WildSearch = 0xEBA80F Then
			  ;click wild
			  ControlClick($GameHandle,"","", "left", 1, 161, 815)
			  $OnMenuWild = True
			  SetStatus("Wild Menu")
			  Sleep(1000)
		   ElseIf $OnWild = 0xCFF0FF Then
			  $OnMenuWild = True
			  SetStatus("Wild Menu")
			  Sleep(1000)
		   Else
			  _ControlDrag($GameHandle, "left", 250, 800, 450, 800)
			  Sleep(1000)
		   EndIf
	   EndIf

	   If $OnMenuWild Then
		   Local $PlaySearch = MemoryReadPixel(387, 424, $GameHandle)
		   Local $StillLoading = MemoryReadPixel(195, 547, $GameHandle)
		   Local $StillWild = MemoryReadPixel(280, 50, $GameHandle)
		   Local $StillWild2 = MemoryReadPixel(303, 1015, $GameHandle)
		   ;find play button
		   If $PlaySearch = 0xCFF0FF Then
			  ;click play
			  ControlClick($GameHandle,"","", "left", 1, 387, 424)
			  SetStatus("Loading")
			  Sleep(1000)
		   ;if cards are full
		   ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
			   ;click ok
			   ControlClick($GameHandle,"","", "left", 1, 278, 610)
			   Sleep(1000)
			   ;go back to main menu
			   ControlClick($GameHandle,"","", "left", 1, 34, 60)
			   ;Go to training
			   $OnMenuWild = False
			   $StartWild = False
			   $Training = True
			   TrainCards()
		   ;wait for loading
		   ElseIf $StillLoading = 0xEFBE55 Then
			  Sleep(3500)
		   ;check if ingame already
		   ElseIf $StillWild = 0xFAEBFA And $StillWild2 = 0xFDCE2B Then
			  $PlayingWild = True
			  $OnMenuWild = False
			  SetStatus("Playing Wild Mode")
		   EndIf
	   EndIf

	   ;playing Wild mode
	   If $PlayingWild Then
		  ;pixels to search
		  Local $StillWild = MemoryReadPixel(178, 923, $GameHandle)
		  Local $StillLoading = MemoryReadPixel(195, 547, $GameHandle)
		  Local $CardSearch = MemoryReadPixel(268, 961, $GameHandle)
		  Local $TapSearch = MemoryReadPixel(285, 888, $GameHandle)
		  Local $DoneSearch = MemoryReadPixel(386, 990, $GameHandle)

		  ;still playing?
		  If $StillWild = 0xE0DC6A Then
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
		  ElseIf $CardSearch = 0xF58931 Then
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
			 ;click tap to continue
			 ControlClick($GameHandle,"","", "left", 1, 175, 907)
		  ;cards maxed limit
		  ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
			 ;click ok
			 ControlClick($GameHandle,"","", "left", 1, 278, 610)
		  ;energy maxed limit
		  ElseIf $MaxEnergy = 0x095500 Then
			 ;click ok
			 ControlClick($GameHandle,"","", "left", 1, 278, 610)
		  ;done button
		  ElseIf $DoneSearch = 0xECFFFF Then
			 Sleep(1000)
			 $PlayingWild = False
			 $OnMenuWild = True
			 SetStatus("Wild Menu")
		  Else
			 SetStatus("Working...")
			 Sleep(1000)
			 ControlClick($GameHandle,"","", "left", 1, 330, 960)
		  EndIf
		EndIf ;=>PlayingWild
	WEnd ;=>MainLoop
EndFunc
#EndRegion

#Region =====Road to Glory=====
Func RoadToGlory()
	Local $DCounter = 0
	while($StartRTG)
	   Local $RTGSearch = MemoryReadPixel(152, 564, $GameHandle)
	   Local $OnRTG = MemoryReadPixel(309, 873, $GameHandle)
	   Local $MaxCards = MemoryReadPixel(72, 358, $GameHandle)
	   Local $MaxCards2 = MemoryReadPixel(484, 356, $GameHandle)

	   ;find rtg menu
	   If $OnMenuRTG = False and $PlayingRTG = False Then
		   If $RTGSearch = 0xFFCE00 Then
			  ;click rtg
			  ControlClick($GameHandle,"","", "left", 1, 152, 564)
			  $OnMenuRTG = True
			  SetStatus("RTG Menu")
			  $DCounter = 0
			  Sleep(1000)
			ElseIf $OnRTG = 0x670000 Then
			  $OnMenuRTG = True
			  SetStatus("RTG Menu")
			  Sleep(1000)
			Else
			  If $DCounter<4 Then
			  _ControlDrag($GameHandle, "left", 30, 400, 530, 400)
			  ElseIf $DCounter>3 Then
				  _ControlDrag($GameHandle, "left", 530, 400, 30, 400)
			  EndIf
			  Sleep(1000)
			  $DCounter= $DCounter+1
			EndIf
		EndIf

	   ;find play button
	   If $OnMenuRTG Then
		  $SetDifficulty = GUICtrlRead($cboDifficulty)
		  If $SetDifficulty = "+5" Then
			  Local $dX = 486
			  Local $dy = 796
			  Local $Difficulty = MemoryReadPixel($dX, $dY, $GameHandle)
		  ElseIf $SetDifficulty = "+3" Then
			  Local $dX = 507
			  Local $dy = 643
			  Local $Difficulty = MemoryReadPixel($dX, $dY, $GameHandle)
		  ElseIf $SetDifficulty = "+1" Then
			  Local $dX = 484
			  Local $dy = 498
			  Local $Difficulty = MemoryReadPixel($dX, $dY, $GameHandle)
		  EndIf

		  Local $PlaySearch = MemoryReadPixel(303, 811, $GameHandle)
		  Local $Difficulty3 = MemoryReadPixel(507, 643, $GameHandle)
		  Local $Difficulty5 = MemoryReadPixel(486, 796, $GameHandle)
		  Local $Difficulty10 = MemoryReadPixel(478, 795, $GameHandle)
		  Local $StillLoading = MemoryReadPixel(233, 510, $GameHandle)
		  Local $StillRTG = MemoryReadPixel(194, 47, $GameHandle)
		  Local $StillRTG2 = MemoryReadPixel(45, 796, $GameHandle)

		  If $PlaySearch = 0xFFD445 Then
			;click play
			ControlClick($GameHandle,"","", "left", 1, 303, 811)
			SetStatus("Choosing difficulty")
		  ElseIf $PlaySearch = 0x768797 And $State = False Then
			SetStatus("Waiting for free bouts")
			Delay(60, True)
		  ;choose difficulty
		  ElseIf $Difficulty = 0xFCF8FF Or $Difficulty = 0xFFFF7D Then
			ControlClick($GameHandle,"","", "left", 1, $dX, $dY)
			SetStatus("Loading")
		  ;if cards are full
		  ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
			;click ok
			ControlClick($GameHandle,"","", "left", 1, 278, 610)
			Sleep(1000)
			;go back to main menu
			ControlClick($GameHandle,"","", "left", 1, 34, 60)
			;Go to training
			$OnMenuRTG = False
			$StartRTG = False
			$Training = True
			TrainCards()
		  ;wait for loading
	      ElseIf $StillLoading = 0xFFBB00 Then
			Sleep(3500)
		  ElseIf $StillRTG = 0xFAEBFA And $StillRTG2 = 0xB9CBFF Then
			$PlayingRTG = True
			$OnMenuRTG = False
			SetStatus("RTG Mode")
		  EndIf
	   EndIf

	   ;playing RTG mode
	   If $PlayingRTG Then
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
		  ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
			 ;click ok
			 ControlClick($GameHandle,"","", "left", 1, 278, 610)
		  ;done button
		  ElseIf $DoneSearch = 0x670000 Then
			 Sleep(1000)
			 $PlayingRTG = False
			 $OnMenuRTG = True
			 SetStatus("RTG Menu")
		  Else
			 SetStatus("Working...")
			 Sleep(2500)
			 ControlClick($GameHandle,"","", "left", 1, 330, 960)
		  EndIf
		EndIf ;=>PlayingRTG
	WEnd ;=>MainLoop
EndFunc
#EndRegion

#Region =====Train Cards=====
Func TrainCards()
	SetStatus("Training Cards")
	Local $TrainingDone = False
	While($Training)
		Local $CardList = MemoryReadPixel(198, 993, $GameHandle)
		Local $FilterButton = MemoryReadPixel(406, 137, $GameHandle)
		Local $Filters = MemoryReadPixel(286, 239, $GameHandle)
		Local $Improve = MemoryReadPixel(94, 991, $GameHandle)
		Local $TrainCard = MemoryReadPixel(350, 932, $GameHandle)

		;look for card list
		If $CardList = 0x789CBD And $TrainingDone = False Then
			SetStatus("Card List")
			ControlClick($GameHandle,"","", "left", 1, 210, 976)
		;filter button
		ElseIf $FilterButton = 0xB2DDFF And $TrainingDone = False Then
			SetStatus("Filtering to Trainable")
			ControlClick($GameHandle,"","", "left", 1, 406, 137)
		;filter list
		ElseIf $Filters = 0xFAEBFA And $TrainingDone = False Then
			SetStatus("Filtering")
			ControlClick($GameHandle,"","", "left", 1, 341, 389)
			Sleep(1000)
			;look for trainable -> all
			Local $TrainableAll = MemoryReadPixel(47, 488, $GameHandle)
			;all already selected
			If $TrainableAll = 0x4AB8F9 And $TrainingDone = False Then
				ControlClick($GameHandle,"","", "left", 1, 387, 859)
				Sleep(1000)
				ControlClick($GameHandle,"","", "left", 1, 78, 252)
				Sleep(1000)
			;select all in trainable
			Else
				ControlClick($GameHandle,"","", "left", 1, 85, 484)
				Sleep(1000)
				ControlClick($GameHandle,"","", "left", 1, 387, 859)
				Sleep(1000)
				ControlClick($GameHandle,"","", "left", 1, 78, 252)
				Sleep(1000)
			EndIf
		;improve card
		ElseIf $Improve = 0xBAE0FF And $TrainingDone = False Then
			SetStatus("Train Card")
			ControlClick($GameHandle,"","", "left", 1, 97, 979)
			Sleep(1000)
		;train button
		ElseIf $TrainCard = 0xBCE7FF And $TrainingDone = False Then
			SetStatus("Training Card")
			ControlClick($GameHandle,"","", "left", 1, 350, 922)
			Sleep(1000)
			;filter button in train menu
			Local $FilterTrain = MemoryReadPixel(335, 240, $GameHandle)

			If $FilterTrain = 0xB2DDFF And $TrainingDone = False Then
				;click filter
				SetStatus("Filtering to Feed")
				ControlClick($GameHandle,"","", "left", 1, 326, 231)
				Sleep(1000)
				;click clear all
				ControlClick($GameHandle,"","", "left", 1, 176, 863)
				Sleep(1000)
				;click cards to train (hardened to ss17)
				ControlClick($GameHandle,"","", "left", 1, 476, 593)
				Sleep(500)
				ControlClick($GameHandle,"","", "left", 1, 383, 593)
				Sleep(500)
				ControlClick($GameHandle,"","", "left", 1, 283, 593)
				Sleep(500)
				ControlClick($GameHandle,"","", "left", 1, 187, 593)
				Sleep(500)
				ControlClick($GameHandle,"","", "left", 1, 90, 593)
				Sleep(1000)
				;click done
				ControlClick($GameHandle,"","", "left", 1, 387, 865)
				Sleep(1000)
				;select all
				SetStatus("Selecting All")
				ControlClick($GameHandle,"","", "left", 1, 153, 226)
				Sleep(1000)
				;done
				SetStatus("Training...")
				ControlClick($GameHandle,"","", "left", 1, 288, 922)
				Sleep(1000)
				Local $UltimateHigher = MemoryReadPixel(144, 481, $GameHandle)
				If $UltimateHigher = 0xB34A13 Then
					ControlClick($GameHandle,"","", "left", 1, 171, 613)
					Sleep(1000)
				EndIf
			EndIf

			Local $DoneTraining = MemoryReadPixel(222, 45, $GameHandle)
			If $DoneTraining = 0xFAEBFA Then
				;tapping to speed up training
				ControlClick($GameHandle,"","", "left", 1, 520, 168)
				Sleep(1000)
				ControlClick($GameHandle,"","", "left", 1, 520, 168)
				SetStatus("Training Done!")
				$TrainingDone = True
				Sleep(2500)
			EndIf
		ElseIf $TrainingDone = True Then
			Local $CloseButton = MemoryReadPixel(521, 173, $GameHandle)
			Local $GameButton = MemoryReadPixel(352, 967, $GameHandle)

			If $CloseButton = 0x383F3F Then
				ControlClick($GameHandle,"","", "left", 1, 522, 169)
				Sleep(1000)
			ElseIf $GameButton = 0x5C7E9A Then
				ControlClick($GameHandle,"","", "left", 1, 352, 967)
				Sleep(1000)
				$GameMode = GUICtrlRead($cboMode)
				If $GameMode = "Wild Mode" Then
					SetStatus("Going Back to Wild")
					$StartWild = True
					WildMode()
				ElseIf $GameMode = "Road to Glory" Then
					SetStatus("Going Back to RTG")
					$StartRTG = True
					RoadToGlory()
				EndIf
			Else
				ControlClick($GameHandle,"","", "left", 1, 522, 169)
				SetStatus("Error Mode")
			EndIf
		Else
			Local $BackButton = MemoryReadPixel(38, 57, $GameHandle)
			If $BackButton = 0x7896AC Then
				ControlClick($GameHandle,"","", "left", 1, 38, 57)
				SetStatus("Going Back to Menu")
			Else
				ControlClick($GameHandle,"","", "left", 1, 522, 169)
				SetStatus("Error!")
			EndIf
		EndIf
		Sleep(1000)
	WEnd
EndFunc
#EndRegion

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
		$Training = False
		$State = False
		GUICtrlSetData($btnStart, "START")
		GUICtrlSetState($btnStart, $GUI_ENABLE)
		GUICtrlSetState($cboMode, $GUI_ENABLE)
		GUICtrlSetState($cboDifficulty, $GUI_ENABLE)
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