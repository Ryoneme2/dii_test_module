*** Settings ***
Library     SeleniumLibrary
*** Test Cases ***
TC1
    ${options}=     evaluate  sys.modules['selenium.webdriver'].ChromeOptions()     sys
    ${options.binary_location}  set variable  /Applications/Brave\ Browser.app
    create webdriver  Chrome    my_alias    chrome_options=${options}
    open browser  http://www.example.com    chrome
    maximize browser window
    sleep  3
    close browser