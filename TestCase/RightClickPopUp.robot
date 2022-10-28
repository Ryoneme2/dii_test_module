*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://swisnl.github.io/jQuery-contextMenu/demo.html
${BROWSER}  chrome
*** Test Cases ***
TC1 : Right Click to open context menu
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3s

    open context menu  //span[text()='right click me']
    click element  //span[text()='Delete']

    ${msg}  handle alert  accept

    log to console  ${msg}

    should contain  ${msg}  clicked: delete

    close browser