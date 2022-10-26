*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://demo.seleniumeasy.com/basic-radiobutton-demo.html
${BROWSER}  chrome
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    scroll element into view  css:.groupradiobutton
    select radio button  gender  Male
    select radio button  ageGroup  0 - 5
    click button  //button[contains(text(),'Get values')]
    ${result}  get element attribute  css:.groupradiobutton  textContent
    should contain  ${result}  Sex : Male Age group: 0 - 5

    log to console  ${result}
    sleep  1
    close browser