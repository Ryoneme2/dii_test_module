*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}  chrome
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    select radio button  radioButton  radio2
    select from list by value  name:dropdown-class-example  option2

    ${radio}  get element attribute  //input[@value='radio2']  checked
    ${radio}  convert to boolean  ${radio}
    ${dd}  get element attribute  name:dropdown-class-example  value

    log to console  ${radio} and ${dd}

    should be true  ${radio}
    should contain  ${dd}  option2


    sleep  1
    close browser