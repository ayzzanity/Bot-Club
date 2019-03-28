; #FUNCTION# ====================================================================================================================
; Name ..........: BC Global Variables
; Description ...: Global Variables will be stored here
; Author ........: Ezz Redfox
; Modified ......: 03/20/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================

; /Emulator
Global $GameHandle
Global $GameHandle2 = WinGetHandle("[CLASS:Qt5QWindowToolSaveBits]")
; /Wild Game
Global $StartWild = False
Global $OnMenuWild = False
Global $PlayingWild = False
; /War Game
Global $StartWar = False
Global $OnMenuWar = False
Global $PlayingWar = False
; /Road to Glory
Global $StartRTG = False
Global $OnMenuRTG = False
Global $PlayingRTG = False
; /Ring Domination
Global $StartRD = False
Global $OnMenuRD = False
Global $PlayingRD = False
; /Team Ring Domination
Global $StartTRD = False
Global $OnMenuTRD = False
Global $PlayingTRD = False
; /Etc
Global $Drafting = False
Global $HideStatus = False
Global $Training = False
Global $State = False