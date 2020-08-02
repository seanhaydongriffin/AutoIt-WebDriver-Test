#include-once
#include "wd_core.au3"
#include "wd_helper.au3"
#Region Header
#cs
	Title:   		BrowserTestObject UDF Library for AutoIt3
	Filename:  		BrowserTestObject
	Description:
	Author:   		seangriffin
	Version:  		V0.1
	Last Update: 	02/08/20
	Requirements: 	AutoIt3 3.2 or higher,
	Changelog:		---------02/08/20---------- v0.1
					Initial release.
#ce
#EndRegion Header
#Region Global Variables and Constants
#EndRegion Global Variables and Constants
#Region Core functions
; #FUNCTION# ;===============================================================================
;
; Name...........:	_InsightsSetup()
; Description ...:	Setup activities including cURL initialization.
; Syntax.........:	_InsightsSetup()
; Parameters ....:
; Return values .: 	On Success			- Returns True.
;                 	On Failure			- Returns False, and:
;											sets @ERROR = 1 if unable to find an active SAP session.
;												This means the SAP GUI Scripting interface is not enabled.
;												Refer to the "Requirements" section at the top of this file.
;											sets @ERROR = 2 if unable to find the SAP window to attach to.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:	A prerequisite is that the SAP GUI Scripting interface is enabled,
;					and the SAP user is already logged in (ie. The "SAP Easy Access" window is displayed).
;					Refer to the "Requirements" section at the top of this file for information
;					on enabling the SAP GUI Scripting interface.
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
func WebTestObject_FindUntilExistent($xpath)

	Local $hTimer = TimerInit()

	While TimerDiff($hTimer) < 60000

		Local $test_object = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, $xpath)

		If @error = $_WD_ERROR_Success Then

			Return $test_object
		EndIf

		ConsoleWrite("Failed to find test object " & $xpath & @CRLF)
		Sleep(500)
	WEnd

	Return Null
EndFunc


func WebTestObject_Click($test_object)

	Local $hTimer = TimerInit()

	While TimerDiff($hTimer) < 60000

		_WD_ElementAction($sSession, $test_object, 'click')

		If @error = $_WD_ERROR_Success Then

			ExitLoop
		EndIf

		ConsoleWrite("Failed to click test object" & @CRLF)
		Sleep(500)
	WEnd
EndFunc



func WebTestObject_FindUntilExistent_Click($xpath)

	Local $test_object = WebTestObject_FindUntilExistent($xpath)
	WebTestObject_Click($test_object)
EndFunc





func WebTestObject_SetText($test_object, $text)

	Local $hTimer = TimerInit()

	While TimerDiff($hTimer) < 60000

		_WD_ElementAction($sSession, $test_object, 'value', $text)

		If @error = $_WD_ERROR_Success Then

			ExitLoop
		EndIf

		ConsoleWrite("Failed to click test object" & @CRLF)
		Sleep(500)
	WEnd
EndFunc


func WebTestObject_FindUntilExistent_SetText($xpath, $text)

	Local $test_object = WebTestObject_FindUntilExistent($xpath)
	WebTestObject_SetText($test_object, $text)
EndFunc



