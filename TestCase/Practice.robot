*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://www.saucedemo.com/
${BROWSER}  chrome
&{usr}  u=standard_user   p=secret_sauce
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
#    input text  //input[@id='user-name']  ${usr}[u]
    input text  css:input[name=user-name]  ${usr}[u]
#    input text  //input[@id='password']  ${usr}[p]
    input text  css:input[name=password]  ${usr}[p]
    click button  id:login-button
#    @{elems}  get webelements  //div[@id='']
    ${title}  get text  class:title
    log to console  ${title}
    sleep  3
    close browser