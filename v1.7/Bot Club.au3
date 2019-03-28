#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Resources\images\gui\sc.ico
#AutoIt3Wrapper_Res_Description=WWE SC Auto Clicking Bot
#AutoIt3Wrapper_Res_Fileversion=1.7.0.0
#AutoIt3Wrapper_Res_ProductName=The Bot Club
#AutoIt3Wrapper_Res_ProductVersion=1.7
#AutoIt3Wrapper_Res_CompanyName=Ezz Redfox
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; #FUNCTION# ====================================================================================================================
; Name ..........: Bot Club v1.7
; Description ...: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; Author ........: Ezz Redfox
; Modified ......: 03/23/2019
; Remarks .......: This is the main program and is in developtment
; ===============================================================================================================================

#include-once
#include "BC Include.au3"

#Region ===== Hotkeys =====
HotKeySet("{f1}", "StopBot")
;HotKeySet("{f2}", "PauseBot")
;HotKeySet("{f3}", "HideBot")
HotKeySet("{f4}", "BotExit")
#EndRegion ===== Hotkeys =====

#Region /========== GUI Design ==========/
CreateGUI()
#EndRegion /========== GUI Design ==========/

#Region //===== MAIN LOOP =====//
While 1
	Menu()
	_GetHandle()
WEnd
#EndRegion //===== MAIN LOOP =====//

#Region ====Main Menu====
Func Menu()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnStart
			$HandleItem = GUICtrlRead($cboHandle)
			$GameHandle = WinGetHandle($HandleItem)
			$GameMode = GUICtrlRead($cboMode)
			If $GameMode = "Wild Mode" Then
				BotStart($GameMode)
				$StartWild = True
				_WildMode()
			ElseIf $GameMode = "War Mode" Then
				BotStart($GameMode)
				$StartWar = True
				_WarMode()
			ElseIf $GameMode = "Road to Glory" Then
				BotStart($GameMode)
				$StartRTG = True
				RoadToGlory()
			ElseIf $GameMode = "Ring Domination" Then
				BotStart($GameMode)
				$StartRD = True
				RingDomination()
			ElseIf $GameMode = "[Team]Ring Domination" Then
				BotStart($GameMode)
				$StartTRD = True
				TeamRingDomination()
			Else
				MsgBox(0, "Error", "Game Mode not yet available...", 5, $GameHandle)
			EndIf
	EndSwitch
EndFunc   ;==>Menu
#EndRegion ====Main Menu====



#Region =====Road to Glory=====
Func RoadToGlory()
	Local $DCounter = 0
	Local $dX = 0
	Local $dY = 0

	While ($StartRTG)
		$SetDifficulty = GUICtrlRead($cboDifficulty)
		If $SetDifficulty = "+5" Then
			$dX = 486
			$dY = 796
		ElseIf $SetDifficulty = "+3" Then
			$dX = 507
			$dY = 643
		ElseIf $SetDifficulty = "+1" Then
			$dX = 484
			$dY = 498
		EndIf

		_RoadToGloryPixels($dX, $dY)
		_GeneralPixels()

		;find rtg menu
		If $OnMenuRTG = False And $PlayingRTG = False Then
			If $RTGSearch = 0xFFCE00 Then
				;click rtg
				ControlClick($GameHandle, "", "", "left", 1, 152, 564)
				$OnMenuRTG = True
				SetStatus("RTG Menu")
				$DCounter = 0
				Sleep(1000)
			ElseIf $OnRTG = 0x670000 Then
				$OnMenuRTG = True
				SetStatus("RTG Menu")
				$DCounter = 0
				Sleep(1000)
			Else
				If $DCounter < 4 Then
					_ControlDrag($GameHandle, "left", 30, 400, 530, 400)
				ElseIf $DCounter > 3 Then
					_ControlDrag($GameHandle, "left", 530, 400, 30, 400)
				EndIf
				Sleep(1000)
				$DCounter = $DCounter + 1
			EndIf
		EndIf

		;find play button
		If $OnMenuRTG Then
			If $PlaySearch = 0xFFD445 Then
				;click play
				ControlClick($GameHandle, "", "", "left", 1, 303, 811)
				SetStatus("Choosing difficulty")
			ElseIf $PlaySearch = 0x768797 And $State = False Then
				SetStatus("Waiting for free bouts")
				Delay(60, True)
				;choose difficulty
			ElseIf $Difficulty = 0xFCF8FF Or $Difficulty = 0xFFFF7D Then
				ControlClick($GameHandle, "", "", "left", 1, $dX, $dY)
				SetStatus("Loading")
				;if cards are full
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				Sleep(1000)
				;go back to main menu
				ControlClick($GameHandle, "", "", "left", 1, 34, 60)
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
			;still playing?
			If $StillRTG = 0xFAEBFA Then
				_PlayRoadToGlory()
			ElseIf $StillLoading = 0xFFBB00 Then
				Sleep(2500)
				SetStatus("Loading...")
			ElseIf $TapFromPoints = 0x8DAFFF Then
				ControlClick($GameHandle, "", "", "left", 1, 427, 816)
				SetStatus("Points Received")
			ElseIf $CardSearch = 0xAA1813 Then
				SetStatus("Drafting...")
				_DraftClicks()
				;tap to continue
			ElseIf $TapSearch = 0xFAEBFA Then
				ControlClick($GameHandle, "", "", "left", 1, 175, 907)
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;done button
			ElseIf $DoneSearch = 0x670000 Then
				Sleep(1000)
				$PlayingRTG = False
				$OnMenuRTG = True
				SetStatus("RTG Menu")
			Else
				SetStatus("Working...")
				Sleep(2500)
				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			EndIf
		EndIf     ;=>PlayingRTG
	WEnd     ;=>MainLoop
EndFunc   ;==>RoadToGlory
#EndRegion =====Road to Glory=====

#Region =====Ring Domination=====
Func RingDomination()
	While ($StartRD)
		_RingDominationPixels()
		_GeneralPixels()

		;find wild menu
		If $OnMenuRD = False And $PlayingRD = False Then
			If $RDSearch = 0xFFC911 Then
				;click RD
				ControlClick($GameHandle, "", "", "left", 1, 197, 574)
				$OnMenuRD = True
				SetStatus("Ring Domination Menu")
				Sleep(1000)
			ElseIf $OnRD = 0x7A0303 Then
				$OnMenuRD = True
				SetStatus("Ring Domination Menu")
				Sleep(1000)
			Else
				_ControlDrag($GameHandle, "left", 250, 800, 450, 800)
				Sleep(1000)
			EndIf
		EndIf

		If $OnMenuRD Then
			;find play button
			If $PlaySearch = 0xFFC440 Then
				;click play
				ControlClick($GameHandle, "", "", "left", 1, 394, 642)
				SetStatus("Ring Domination Menu")
				Sleep(1000)
			ElseIf $PlaySearch = 0x768797 And $State = False Then
				SetStatus("Waiting for free bouts")
				Delay(60, True)
				;if cards are full
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				Sleep(1000)
				;go back to main menu
				ControlClick($GameHandle, "", "", "left", 1, 34, 60)
				;Go to training
				$OnMenuRD = False
				$StartRD = False
				$Training = True
				TrainCards()
				;wait for loading
			ElseIf $StillLoading = 0x265879 Then
				Sleep(3500)
				;check if ingame already
			ElseIf $StillRD = 0xFAEBFA And $StillRD2 = 0x445455 Then
				$PlayingRD = True
				$OnMenuRD = False
				SetStatus("Playing Ring Domination Mode")
			EndIf
		EndIf

		;playing rd mode
		If $PlayingRD Then
			;still playing?
			If $StillRD = 0xFAEBFA Then
				ControlClick($GameHandle, "", "", "left", 1, 425, 900)
				_RDControlDrag()
			ElseIf $StillLoading = 0x265879 Then
				Sleep(2500)
				SetStatus("Loading...")
			ElseIf $CardSearch = 0xFAEBFA Then
				SetStatus("Drafting...")
				_DraftClicks()
				;tap to continue
			ElseIf $TapSearch = 0xFAEBFA Then
				;click tap to continue
				ControlClick($GameHandle, "", "", "left", 1, 175, 907)
				;cards maxed limit
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;energy maxed limit
			ElseIf $MaxEnergy = 0x095500 Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;done button
			ElseIf $DoneSearch = 0xC4E7FF Then
				Sleep(1000)
				$PlayingRD = False
				$OnMenuRD = True
				SetStatus("RD Menu")
			Else
				SetStatus("Working...")
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			EndIf
		EndIf         ;=>PlayingRD
	WEnd         ;=>MainLoop
EndFunc   ;==>RingDomination
#EndRegion =====Ring Domination=====

#Region =====Team Ring Domination=====
Func TeamRingDomination()
	Local $DCounter = 0
	While ($StartTRD)
		_TeamRingDominationPixels()
		_GeneralPixels()

		;find TRD menu
		If $OnMenuTRD = False And $PlayingTRD = False Then
			If $TRDSearch = 0x8D4405 And $TRDSearch2 = 0x33DFE6 Then
				;click RD
				ControlClick($GameHandle, "", "", "left", 1, 285, 437)
				$OnMenuTRD = True
				SetStatus("Ring Domination Menu")
				$DCounter = 0
				Sleep(1000)
			ElseIf $OnTRD = 0x740000 Then
				$OnMenuTRD = True
				SetStatus("Ring Domination Menu")
				$DCounter = 0
				Sleep(1000)
			ElseIf $StillTRD = 0xFAEBFA And $StillTRD2 = 0x15BDF4 Then
				$PlayingTRD = True
				SetStatus("Playing Team Ring Domination Mode")
			Else
				If $DCounter < 4 Then
					_ControlDrag($GameHandle, "left", 30, 400, 530, 400)
				ElseIf $DCounter > 3 Then
					_ControlDrag($GameHandle, "left", 530, 400, 30, 400)
				EndIf
				Sleep(1000)
				$DCounter = $DCounter + 1
			EndIf
		EndIf

		If $OnMenuTRD Then

			;find play button
			If $PlaySearch = 0xFFD142 Then
				;click play
				ControlClick($GameHandle, "", "", "left", 1, 303, 816)
				SetStatus("Ring Domination Menu")
				Sleep(1000)
				;if cards are full
			ElseIf $PlaySearch = 0x758696 And $State = False Then
				SetStatus("Waiting for free bouts")
				Delay(60, True)
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				Sleep(1000)
				;go back to main menu
				ControlClick($GameHandle, "", "", "left", 1, 34, 60)
				;Go to training
				$OnMenuTRD = False
				$StartTRD = False
				$Training = True
				TrainCards()
				;wait for loading
			ElseIf $StillLoading = 0xB99F1C Then
				Sleep(3500)
				;check if ingame already
			ElseIf $StillTRD = 0xFAEBFA And $StillTRD2 = 0x15BDF4 Then
				$PlayingTRD = True
				$OnMenuTRD = False
				SetStatus("Playing Team Ring Domination Mode")
			EndIf
		EndIf

		;playing TRD mode
		If $PlayingTRD Then
			;still playing?
			If $StillTRD = 0xFAEBFA Then
				;ControlClick($GameHandle, "", "", "left", 1, 425, 900)
				_RDControlDrag()
			ElseIf $StillLoading = 0xB99F1C Then
				Sleep(2500)
				SetStatus("Loading...")
			ElseIf $CardSearch = 0xD5B900 Then
				SetStatus("Drafting...")
				$PlayingTRD = False
				$Drafting = True
			EndIf
		EndIf

		If $Drafting = True Then
			If $CardSearch = 0xD5B900 Then
				_DraftClicks()
				;tap to continue
			ElseIf $TapSearch = 0xFAEBFA Then
				;click tap to continue
				ControlClick($GameHandle, "", "", "left", 1, 175, 907)
				;cards maxed limit
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;energy maxed limit
			ElseIf $MaxEnergy = 0x095500 Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;done button
			ElseIf $DoneSearch = 0x740000 Then
				Sleep(1000)
				$Drafting = False
				$OnMenuTRD = True
				SetStatus("RD Menu")
			Else
				SetStatus("Working...")
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			EndIf
		EndIf         ;=>Drafting
	WEnd         ;=>MainLoop
EndFunc   ;==>TeamRingDomination
#EndRegion =====Team Ring Domination=====

#Region =====Train Cards=====
Func TrainCards()
	SetStatus("Training Cards")
	Local $TrainingDone = False
	While ($Training)
		_TrainingCardPixels()
		;look for card list
		If $CardList = 0x789CBD And $TrainingDone = False Then
			SetStatus("Card List")
			ControlClick($GameHandle, "", "", "left", 1, 210, 976)
			;filter button
		ElseIf $FilterButton = 0xB2DDFF And $TrainingDone = False Then
			SetStatus("Filtering to Trainable")
			ControlClick($GameHandle, "", "", "left", 1, 406, 137)
			;filter list
		ElseIf $Filters = 0xFAEBFA And $TrainingDone = False Then
			SetStatus("Filtering")
			ControlClick($GameHandle, "", "", "left", 1, 341, 389)
			Sleep(1000)
			;all already selected
			If $TrainableAll = 0x4AB8F9 And $TrainingDone = False Then
				ControlClick($GameHandle, "", "", "left", 1, 387, 859)
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 78, 252)
				Sleep(1000)
				;select all in trainable
			Else
				ControlClick($GameHandle, "", "", "left", 1, 85, 484)
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 387, 859)
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 78, 252)
				Sleep(1000)
			EndIf
			;improve card
		ElseIf $Improve = 0xBAE0FF And $TrainingDone = False Then
			SetStatus("Train Card")
			ControlClick($GameHandle, "", "", "left", 1, 97, 979)
			Sleep(1000)
			;train button
		ElseIf $TrainCard = 0xBCE7FF And $TrainingDone = False Then
			SetStatus("Training Card")
			ControlClick($GameHandle, "", "", "left", 1, 350, 922)
			Sleep(1000)
			If $FilterTrain = 0xB2DDFF And $TrainingDone = False Then
				;click filter
				SetStatus("Filtering to Feed")
				ControlClick($GameHandle, "", "", "left", 1, 326, 231)
				Sleep(1000)
				;click clear all
				ControlClick($GameHandle, "", "", "left", 1, 176, 863)
				Sleep(1000)
				;click cards to train (hardened to ss17)
				ControlClick($GameHandle, "", "", "left", 1, 476, 593)
				Sleep(500)
				ControlClick($GameHandle, "", "", "left", 1, 383, 593)
				Sleep(500)
				ControlClick($GameHandle, "", "", "left", 1, 283, 593)
				Sleep(500)
				ControlClick($GameHandle, "", "", "left", 1, 187, 593)
				Sleep(500)
				ControlClick($GameHandle, "", "", "left", 1, 90, 593)
				Sleep(1000)
				;click done
				ControlClick($GameHandle, "", "", "left", 1, 387, 865)
				Sleep(1000)
				;select all
				SetStatus("Selecting All")
				ControlClick($GameHandle, "", "", "left", 1, 153, 226)
				Sleep(1000)
				;done
				SetStatus("Training...")
				ControlClick($GameHandle, "", "", "left", 1, 288, 922)
				Sleep(1000)

				If $UltimateHigher = 0xB34A13 Then
					ControlClick($GameHandle, "", "", "left", 1, 171, 613)
					Sleep(1000)
				EndIf
			EndIf

			If $DoneTraining = 0xFAEBFA Then
				;tapping to speed up training
				ControlClick($GameHandle, "", "", "left", 1, 520, 168)
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 520, 168)
				SetStatus("Training Done!")
				$TrainingDone = True
				Sleep(2500)
			EndIf

		ElseIf $TrainingDone = True Then
			If $CloseButton = 0x383F3F Then
				ControlClick($GameHandle, "", "", "left", 1, 522, 169)
				Sleep(1000)
			ElseIf $RingIcon = 0x5C7E9A Then
				ControlClick($GameHandle, "", "", "left", 1, 352, 967)
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
				ControlClick($GameHandle, "", "", "left", 1, 522, 169)
				SetStatus("Error Mode")
			EndIf
		Else
			If $BackButton = 0x7896AC Then
				ControlClick($GameHandle, "", "", "left", 1, 38, 57)
				SetStatus("Going Back to Menu")
			Else
				ControlClick($GameHandle, "", "", "left", 1, 522, 169)
				SetStatus("Error!")
			EndIf
		EndIf
		Sleep(1000)
	WEnd
EndFunc   ;==>TrainCards
#EndRegion =====Train Cards=====
