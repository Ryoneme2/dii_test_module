*** Settings ***
Library  SeleniumLibrary
Library           String
*** Variables ***
${URL}  https://demo.nopcommerce.com/register
${BROWSER}  chrome
&{user}  fname=Theerakarn  lname=Maiwong  mail=@mail.com  comName=eieiza  pass=123456
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    select radio button  Gender  M
    input text  name:FirstName  ${user}[fname]
    input text  name:LastName  ${user}[lname]
    select from list by value  name:DateOfBirthDay  2
    select from list by value  name:DateOfBirthMonth  2
    select from list by value  name:DateOfBirthYear  2002
    ${numbers}=    Generate Random String
    ${string}  set variable  ${numbers}${user}[mail]
    input text  name:Email   ${string}
    scroll element into view  id:Password
    input text  id:Company  ${user}[comName]
    input password  id:Password  ${user}[pass]
    input password  id:ConfirmPassword  ${user}[pass]
    click button  id:register-button

    sleep  1
    ${result}  get text  class:result
    should contain  ${result}  Your registration completed
    close browser