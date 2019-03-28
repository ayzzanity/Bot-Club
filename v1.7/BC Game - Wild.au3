; #FUNCTION# ====================================================================================================================
; Name ..........: BC Game - Wild
; Description ...: Wild Mode Script
; Author ........: Ezz Redfox
; Modified ......: 03/26/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include "BC Include.au3"

#Region =====Wild Mode=====
Func _WildMode()
	While ($StartWild)
		_WildModePixels()
		_GeneralPixels()

		;find wild menu
		If $OnMenuWild = False And $PlayingWild = False Then
			If $WildSearch = 0xEBA80F Then
				;click wild
				ControlClick($GameHandle, "", "", "left", 1, 161, 815)
				$OnMenuWild = True
				SetStatus("Wild Menu")
				Sleep(1000)
			ElseIf $OnWild = 0xCFF0FF Then
				$OnMenuWild = True
				SetStatus("Wild Menu")
				Sleep(1000)
			ElseIf $StillWild = 0xFAEBFA And $StillWild2 = 0xFDCE2B Then
				$PlayingWild = True
				SetStatus("Playing Wild Mode")
				Sleep(1000)
			Else
				_ControlDrag($GameHandle, "left", 250, 800, 450, 800)
				Sleep(1000)
			EndIf
		EndIf

		If $OnMenuWild Then
			;find play button
			If $PlaySearch = 0xCFF0FF Then
				;click play
				ControlClick($GameHandle, "", "", "left", 1, 387, 424)
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
				$OnMenuWild = False
				$StartWild = False
				$Training = True
				;TrainCards()
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
			;still playing?
			If $StillWild = 0xFAEBFA Then
				_PlayWildMode()
			ElseIf $StillLoading = 0xEFBE55 Then
				Sleep(2500)
				SetStatus("Loading...")
			ElseIf $CardSearch = 0xF58931 Then
				$Drafting = True
				$PlayingWild = False
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
;~ 				;cards maxed limit
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
			ElseIf $DoneSearch = 0xECFFFF Then
				Sleep(1000)
				$Drafting = False
				$OnMenuWild = True
				SetStatus("Wild Menu")
			Else
				SetStatus("Working...")
				Sleep(1000)
				ControlClick($GameHandle, "", "", "left", 1, 330, 960)
			EndIf
		EndIf     ;=>PlayingWild
	WEnd     ;=>MainLoop
EndFunc   ;==>WildMode
#EndRegion =====Wild Mode=====