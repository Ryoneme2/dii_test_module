*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://the-internet.herokuapp.com/javascript_alerts
${BROWSER}  chrome
*** Test Cases ***
TC1 : Alert Box
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    click button  //button[text()='Click for JS Alert']
    ${msg1}  handle alert  accept
    should contain  ${msg1}  I am a JS Alert
    element should contain  id:result  You successfully clicked an alert

    click button  //button[text()='Click for JS Confirm']
    ${msg2}  handle alert  accept
    should contain  ${msg2}  I am a JS Confirm
    element should contain  id:result  You clicked: Ok

    click button  //button[text()='Click for JS Prompt']
    ${msg3}  input text into alert  GOGO  accept
    element should contain  id:result  You entered: GOGO

    close browser
