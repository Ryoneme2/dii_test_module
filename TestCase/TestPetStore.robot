*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://petstore.octoperf.com/actions/Catalog.action
${BROWSER}  chrome
${usr}  j2ee
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    click element  //area[contains(@alt, 'Dogs')]
    click link  K9-RT-01
    click link  Add to Cart
    click link  Proceed to Checkout
    input text  name:username  ${usr}
    click element  name:signon
    sleep  3
    close browser