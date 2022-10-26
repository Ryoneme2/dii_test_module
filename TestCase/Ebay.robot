*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://www.ebay.com
${BROWSER}  chrome
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    input text  name:_nkw  knife
    click button  id:gh-btn
    ${aText}  get text  //span[@role='heading']
    ${resultNum}  get text  //h1[@class='srp-controls__count-heading']/span[1]
    should contain  knife  ${aText}
    should be equal  270,000  ${resultNum}
    close browser