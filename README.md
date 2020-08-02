# AutoIt-WebDriver-Test

    #include "BrowserTestObject.au3"
    #include "WebTestObject.au3"
    
    _BrowserTestObject_Start("chrome")
    _BrowserTestObject_Navigate("http://google.com")
    
    WebTestObject_FindUntilExistent_SetText("//input[@name='q']", "autoit")
    WebTestObject_FindUntilExistent_Click("//input[@value='Google Search']")
    WebTestObject_FindUntilExistent("//div[@id='result-stats']")
    
    _BrowserTestObject_CloseAll()


https://youtu.be/p5r4M8M3b0Q
