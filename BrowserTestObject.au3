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
Global $sSession = Null
Global $sDesiredCapabilities
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
func _BrowserTestObject_Start($browser_name)

	; Kill all chromedrivers
	While ProcessExists("chromedriver.exe") = True

		ProcessClose("chromedriver.exe")
	WEnd

	; Setup Chrome
	_WD_Option('Driver', 'chromedriver.exe')
	_WD_Option('Port', 9515)
	;_WD_Option('DriverParams', '--verbose --log-path="' & @ScriptDir & '\chrome.log"')
	Local $sDesiredCapabilities = '{"capabilities": {"alwaysMatch": {"goog:chromeOptions": {"w3c": true, "excludeSwitches": [ "enable-automation"], "useAutomationExtension": false }}}}'

	; Startup WebDriver
	$_WD_DEBUG = $_WD_DEBUG_None
	;$_WD_DEBUG = $_WD_DEBUG_Info
	_WD_Startup()

	If @error <> $_WD_ERROR_Success Then

		ConsoleWrite("Error starting the WebDriver." & @CRLF)
		Return @error
	EndIf

	; Create Session
	$sSession = _WD_CreateSession($sDesiredCapabilities)

	If @error <> $_WD_ERROR_Success Then

		ConsoleWrite("Error creating a WebDriver session." & @CRLF)
		Return @error
	EndIf


EndFunc

func _BrowserTestObject_Navigate($url)

	_WD_Navigate($sSession, $url)
EndFunc

func _BrowserTestObject_CloseAll()

	_WD_DeleteSession($sSession)
	_WD_Shutdown()

	; Kill all chromedrivers
	While ProcessExists("chromedriver.exe") = True

		ProcessClose("chromedriver.exe")
	WEnd

EndFunc



