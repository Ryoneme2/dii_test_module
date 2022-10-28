*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://the-internet.herokuapp.com/checkboxes
${BROWSER}  chrome
*** Test Cases ***
TC1 : Condition check box
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3

    ${status}  run keyword and return status  checkbox should not be selected  //form[@id='checkboxes']/input[1]
    run keyword if  ${status}
    ...     click element  //form[@id='checkboxes']/input[1]

    ${status2}  run keyword and return status  checkbox should be selected  //form[@id='checkboxes']/input[2]
    run keyword if  ${status2}
    ...     click element  //form[@id='checkboxes']/input[2]

    checkbox should be selected  //form[@id='checkboxes']/input[1]
    checkbox should not be selected  //form[@id='checkboxes']/input[2]

    sleep  2

    close browser