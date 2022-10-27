*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://demoqa.com/modal-dialogs
${BROWSER}  chrome
*** Test Cases ***
TC1 : Alert Box
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3

    click button  id:showSmallModal

    wait until element is visible  //div[@role='dialog']  10
    ${status}  run keyword and return status  element should contain  css:div.modal-body  This is a small modal. It has very less content

    sleep  1
    RUN KEYWORD IF  ${status}
    ...     click button  id:closeSmallModal
    sleep  1

    close browser
