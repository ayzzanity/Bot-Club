; #FUNCTION# ====================================================================================================================
; Name ..........: BC GUI Design
; Description ...: GUI Design for BC
; Author ........: Ezz Redfox
; Modified ......: 03/21/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIComboBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region /========== GUI Design ==========/
Func CreateGUI()
	Global $SCBot = GUICreate("The Bot Club v1.6", 281, 332, -1, -1)
	GUISetIcon("D:\AutoIt Project\WWE Superbot\images\gui\sc.ico", -1)
	GUISetBkColor(0x808080)
	Global $btnStart = GUICtrlCreateButton("START", 32, 248, 220, 40)
	GUICtrlSetColor(-1, 0x000000)
	Global $lblStatus = GUICtrlCreateLabel("Status:", 32, 296, 37, 17)
	GUICtrlSetColor(-1, 0x000000)
	Global $lblStatusHere = GUICtrlCreateLabel("Not Running...", 72, 296, 180, 17)
	GUICtrlSetColor(-1, 0x00FF00)
	Global $Menu = GUICtrlCreateGroup("Main Menu", 32, 16, 220, 225)
	GUICtrlSetColor(-1, 0x000000)
	Global $lblDifficulty = GUICtrlCreateLabel("Difficulty:", 48, 176, 47, 17)
	GUICtrlSetColor(-1, 0x000000)
	Global $cboDifficulty = GUICtrlCreateCombo("", 96, 168, 41, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "+5|+3|+1")
	Global $lblF1 = GUICtrlCreateLabel("[F1] - Stop Bot", 48, 216, 72, 17)
	Global $lblF4 = GUICtrlCreateLabel("[F4] - Exit Bot", 144, 216, 67, 17)
	Global $lblHotkeys = GUICtrlCreateLabel("==========Hotkeys==========", 48, 192, 194, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Global $lblMode = GUICtrlCreateLabel("=======GAME MODE========", 48, 120, 191, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Global $cboMode = GUICtrlCreateCombo("", 48, 144, 185, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "===SELECT MODE===|Training Test|Wild Mode|War Mode|Royal Rumble|Womens Royal Rumble|Elimination Chamber|Money in the Bank|Ring Domination|Road to Glory|Last Man Standing|[Team]Ring Domination|[Team]Road to Glory", "===SELECT MODE===")
	Global $imgLogo = GUICtrlCreatePic("D:\AutoIt Project\WWE Superbot\images\gui\sc.jpg", 48, 40, 188, 76)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUISetState(@SW_SHOW)
EndFunc   ;==>CreateGUI
#EndRegion /========== GUI Design ==========/
