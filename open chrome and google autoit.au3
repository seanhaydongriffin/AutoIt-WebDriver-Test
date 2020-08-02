;#include "wd_core.au3"
;#include "wd_helper.au3"
#include "BrowserTestObject.au3"
#include "WebTestObject.au3"
#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>

; Google Search
_BrowserTestObject_Start("chrome")
_BrowserTestObject_Navigate("http://google.com")

WebTestObject_FindUntilExistent_SetText("//input[@name='q']", "autoit")
WebTestObject_FindUntilExistent_Click("//input[@value='Google Search']")
WebTestObject_FindUntilExistent("//div[@id='result-stats']")

_BrowserTestObject_CloseAll()
