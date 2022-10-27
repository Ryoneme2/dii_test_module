*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://www.calculatestuff.com/miscellaneous/tip-calculator
${BROWSER}  chrome
*** Test Cases ***
TC1 : Alert Box
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  5

    input text  id:bill_amount  250
    input text  id:tip_percent  15
    click element  id:split_bill
    click button  id:calculate-button
    wait until element is visible  id:split_between
    input text  id:split_between  3

    wait until element is visible  //div[@class='grey-box']/div[3]/div[2]

    ${tipAmount}  get text  //div[@class='grey-box']/div[3]/div[2]
    ${totalPrice}  get text  //div[@class='grey-box']/div[4]/div[2]

    should contain  ${tipAmount}  $18.75
    should contain  ${totalPrice}  $143.75

    close browser
