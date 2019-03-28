; #FUNCTION# ====================================================================================================================
; Name ..........: BC Game - War
; Description ...: War Mode Script
; Author ........: Ezz Redfox
; Modified ......: 03/23/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include "BC Include.au3"

#Region =====War Mode=====
Func _WarMode()
	While ($StartWar)
		_WarModePixels()
		_GeneralPixels()

		;find wild menu
		If $OnMenuWar = False And $PlayingWar = False Then
			If $WarSearch = 0xDD300C And $WarSearch2 = 0xE83F1D Then
				;click wild
				ControlClick($GameHandle, "", "", "left", 1, 166, 805)
				$OnMenuWar = True
				SetStatus("War Menu")
				Sleep(1000)
			ElseIf $OnWar = 0xDF2209 And $OnWar2 = 0xD12205 Then
				$OnMenuWar = True
				SetStatus("War Menu")
				Sleep(1000)
			ElseIf $StillWar = 0xFAEBFA And $StillWar2 = 0xE82929 Then
				$PlayingWar = True
				SetStatus("Playing War Mode")
				Sleep(1000)
			Else
				_ControlDrag($GameHandle, "left", 250, 800, 450, 800)
				Sleep(1000)
			EndIf
		EndIf

		If $OnMenuWar Then
			;find play button
			If $PlaySearch = 0xFFD142 Then
				;click play
				ControlClick($GameHandle, "", "", "left", 1, 425, 862)
				SetStatus("Loading")
				Sleep(1000)
				;if cards are full
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				Sleep(1000)
				;go back to main menu
				ControlClick($GameHandle, "", "", "left", 1, 34, 60)
				;Go to training
				$OnMenuWar = False
				$StartWar = False
				$Training = True
				;TrainCards()
				;wait for loading
			ElseIf $StillLoading = 0xEFBE55 Then
				Sleep(3500)
				;check if ingame already
			ElseIf $StillWar = 0xFAEBFA And $StillWar2 = 0xE82929 Then
				$PlayingWar = True
				$OnMenuWar = False
				SetStatus("Playing War Mode")
			EndIf
		EndIf

		;playing War mode
		If $PlayingWar Then
			;still playing?
			If $StillWar = 0xFAEBFA Then
				_PlayWildMode()
			ElseIf $Result = 0xFDDF90 And $Result2 = 0xCEF5FF Then
				ControlClick($GameHandle, "", "", "left", 1, 285, 980)
			ElseIf $StillLoading = 0xEFBE55 Then
				Sleep(2500)
				SetStatus("Loading...")
			ElseIf $CardSearch = 0xF58931 Then
				$Drafting = True
				$PlayingWar = False
			EndIf
		EndIf

		If $Drafting Then
			If $CardSearch = 0xF58931 Then
				SetStatus("Drafting...")
				_DraftClicks()
				;tap to continue
;~ 			ElseIf $TapSearch = 0xFAEBFA Then
;~ 				;click tap to continue
;~ 				ControlClick($GameHandle, "", "", "left", 1, 175, 907)
				;cards maxed limit
			ElseIf $MaxCards = 0xFAEBFA And $MaxCards2 = 0xFAEBFA Then
				;click ok
				SetStatus("Max Cards...")
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;energy maxed limit
			ElseIf $MaxEnergy = 0x095500 Then
				;click ok
				SetStatus("Max Energy...")
				ControlClick($GameHandle, "", "", "left", 1, 278, 610)
				;done button
;~ 			ElseIf $DoneButton = 0x889DBB Then
;~ 				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			ElseIf $BackToMenu = 0x780000 Then
				Sleep(1000)
				$Drafting = False
				$OnMenuWar = True
				SetStatus("War Menu")
			Else
				SetStatus("Working...")
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			EndIf
		EndIf     ;=>PlayingWar
	WEnd     ;=>MainLoop
EndFunc   ;==>WarMode
#EndRegion =====War Mode=====