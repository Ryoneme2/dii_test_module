
*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://www.way2automation.com/angularjs-protractor/webtables/
${BROWSER}  chrome
${TABLE}  //table/tbody
${keyword}  testadmin2
*** Test Cases ***
TC1 : Table
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3s

    ${row}  get element count  ${TABLE}/tr

    ${isFound}  set variable   ${False}

    FOR  ${i}  IN RANGE  2  ${row}+1
        ${rowElem}  get webelement  ${TABLE}/tr[${i}]/td[1]
        ${txt}  get text  ${rowElem}
        log to console  ${txt}
        ${isFound}  set variable if  '${txt}'=='${keyword}'  ${True}  ${False}
        exit for loop if  ${isFound}
    END

#    log to console  ${i}
#    log to console  ${row}
    ${key}  get text  ${TABLE}/tr[${i}]/td[1]
    should contain  ${key}  testadmin

    click element   ${TABLE}/tr[${i}]/td[9]/input
    click button   ${TABLE}/tr[${i}]/td[11]/button

    wait until element is visible  //div[@class='modal ng-scope']
    sleep  2

    click button  //div[@class='modal-footer']/button[@class='btn ng-scope ng-binding']
    sleep  2

    close browser