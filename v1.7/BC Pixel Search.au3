; #FUNCTION# ====================================================================================================================
; Name ..........: BC Pixel Search
; Description ...: Library of Pixels to be obtained and their coordinates
; Author ........: Ezz Redfox
; Modified ......: 03/20/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
#include-once
#include "BC Include.au3"

Func _WildModePixels()
	Global $WildSearch = _MemoryReadPixel(161, 815, $GameHandle)
	Global $OnWild = _MemoryReadPixel(387, 424, $GameHandle)
	Global $PlaySearch = _MemoryReadPixel(387, 424, $GameHandle)
	Global $StillLoading = _MemoryReadPixel(195, 547, $GameHandle)
	Global $StillWild = _MemoryReadPixel(256, 44, $GameHandle)
	Global $StillWild2 = _MemoryReadPixel(303, 1015, $GameHandle)
	Global $CardSearch = _MemoryReadPixel(268, 961, $GameHandle)
	Global $TapSearch = _MemoryReadPixel(285, 888, $GameHandle)
	Global $DoneSearch = _MemoryReadPixel(386, 990, $GameHandle)
EndFunc   ;==>_WildModePixels

Func _WarModePixels()
	Global $WarSearch = _MemoryReadPixel(89, 806, $GameHandle)
	Global $WarSearch2 = _MemoryReadPixel(239, 806, $GameHandle)
	Global $OnWar = _MemoryReadPixel(101, 408, $GameHandle)
	Global $OnWar2 = _MemoryReadPixel(464, 408, $GameHandle)
	Global $PlaySearch = _MemoryReadPixel(443, 861, $GameHandle)
	Global $StillLoading = _MemoryReadPixel(195, 547, $GameHandle)
	Global $StillWar = _MemoryReadPixel(256, 44, $GameHandle)
	Global $StillWar2 = _MemoryReadPixel(139, 843, $GameHandle)
	Global $Result = _MemoryReadPixel(254, 823, $GameHandle)
	Global $Result2 = _MemoryReadPixel(285, 980, $GameHandle)
	Global $CardSearch = _MemoryReadPixel(268, 961, $GameHandle)
	Global $TapSearch = _MemoryReadPixel(285, 888, $GameHandle)
	Global $DoneButton = _MemoryReadPixel(206, 968, $GameHandle)
	Global $BackToMenu = _MemoryReadPixel(388, 922, $GameHandle)
EndFunc   ;==>_WarModePixels

Func _RingDominationPixels()
	Global $RDSearch = _MemoryReadPixel(199, 565, $GameHandle)
	Global $OnRD = _MemoryReadPixel(368, 692, $GameHandle)
	Global $PlaySearch = _MemoryReadPixel(394, 645, $GameHandle)
	Global $StillLoading = _MemoryReadPixel(307, 302, $GameHandle)
	Global $StillRD = _MemoryReadPixel(215, 59, $GameHandle)
	Global $StillRD2 = _MemoryReadPixel(375, 898, $GameHandle)
	Global $CardSearch = _MemoryReadPixel(331, 185, $GameHandle)
	Global $TapSearch = _MemoryReadPixel(367, 863, $GameHandle)
	Global $DoneSearch = _MemoryReadPixel(248, 969, $GameHandle)
EndFunc   ;==>_RingDominationPixels

Func _RoadToGloryPixels($dX, $dY)
	Global $RTGSearch = _MemoryReadPixel(152, 564, $GameHandle)
	Global $OnRTG = _MemoryReadPixel(309, 873, $GameHandle)
	Global $PlaySearch = _MemoryReadPixel(303, 811, $GameHandle)
	Global $Difficulty = _MemoryReadPixel($dX, $dY, $GameHandle)
	Global $StillLoading = _MemoryReadPixel(233, 510, $GameHandle)
	Global $StillRTG = _MemoryReadPixel(194, 47, $GameHandle)
	Global $StillRTG2 = _MemoryReadPixel(45, 796, $GameHandle)
	Global $TapFromPoints = _MemoryReadPixel(427, 816, $GameHandle)
	Global $CardSearch = _MemoryReadPixel(311, 933, $GameHandle)
	Global $TapSearch = _MemoryReadPixel(175, 907, $GameHandle)
	Global $DoneSearch = _MemoryReadPixel(271, 873, $GameHandle)
EndFunc   ;==>_RoadToGloryPixels

Func _TeamRingDominationPixels()
	Global $TRDSearch = _MemoryReadPixel(183, 504, $GameHandle)
	Global $TRDSearch2 = _MemoryReadPixel(232, 462, $GameHandle)
	Global $OnTRD = _MemoryReadPixel(287, 875, $GameHandle)
	Global $PlaySearch = _MemoryReadPixel(304, 815, $GameHandle)
	Global $StillLoading = _MemoryReadPixel(281, 487, $GameHandle)
	Global $StillTRD = _MemoryReadPixel(151, 45, $GameHandle)
	Global $StillTRD2 = _MemoryReadPixel(172, 912, $GameHandle)
	Global $CardSearch = _MemoryReadPixel(433, 946, $GameHandle)
	Global $TapSearch = _MemoryReadPixel(175, 913, $GameHandle)
	Global $DoneSearch = _MemoryReadPixel(287, 875, $GameHandle)
EndFunc   ;==>_TeamRingDominationPixels

Func _TrainingCardPixels()
	Global $CardList = _MemoryReadPixel(198, 993, $GameHandle)
	Global $FilterButton = _MemoryReadPixel(406, 137, $GameHandle)
	Global $Filters = _MemoryReadPixel(286, 239, $GameHandle)
	Global $Improve = _MemoryReadPixel(94, 991, $GameHandle)
	Global $TrainCard = _MemoryReadPixel(350, 932, $GameHandle)
	Global $TrainableAll = _MemoryReadPixel(47, 488, $GameHandle)
	Global $FilterTrain = _MemoryReadPixel(335, 240, $GameHandle)
	Global $UltimateHigher = _MemoryReadPixel(144, 481, $GameHandle)
	Global $DoneTraining = _MemoryReadPixel(222, 45, $GameHandle)
	Global $CloseButton = _MemoryReadPixel(521, 173, $GameHandle)
	Global $RingIcon = _MemoryReadPixel(352, 967, $GameHandle)
	Global $BackButton = _MemoryReadPixel(38, 57, $GameHandle)

EndFunc   ;==>_TrainingCardPixels

Func _GeneralPixels()
	Global $MaxCards = _MemoryReadPixel(72, 358, $GameHandle)
	Global $MaxCards2 = _MemoryReadPixel(484, 356, $GameHandle)
	Global $MaxEnergy = _MemoryReadPixel(167, 455, $GameHandle)
EndFunc   ;==>_GeneralPixels

; #FUNCTION# ====================================================================================================================
; Name ..........: BC Memory Read Pixel Function
; Description ...: Will return the color of the pixel on a set x and y coordinate
; Author ........: Ezz Redfox
; Modified ......: 03/20/2019
; Remarks .......: WWE Supercard Auto Clicking Bot AKA 'The Bot Club'
; ===============================================================================================================================
Func _MemoryReadPixel($x, $y, $handle)
	Local $hDC
	Local $iColor
	Local $sColor

	$hDC = _WinAPI_GetWindowDC($handle)
	$iColor = DllCall("gdi32.dll", "int", "GetPixel", _
			"int", $hDC, _
			"int", $x, _
			"int", $y)
	$sColor = Hex($iColor[0], 6)
	$rsColor = "0x" & Hex("0x" & StringRight($sColor, 2) & StringMid($sColor, 3, 2) & StringLeft($sColor, 2), 6)
	_WinAPI_ReleaseDC($handle, $hDC)
	Return $rsColor
EndFunc   ;==>_MemoryReadPixel
