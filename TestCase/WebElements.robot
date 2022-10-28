*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://jqueryui.com/autocomplete/
${BROWSER}  chrome
${keyword}  JavaScript
*** Test Cases ***
TC1 : Auto complete
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3s

    select frame  css:.demo-frame
    input text  id:tags  a

    wait until element is visible  id:ui-id-1
    @{elems}  get webelements  css:.ui-menu-item

    FOR  ${elem}  IN  @{elems}
        ${key}  get text  ${elem}
        ${isFound}  set variable if   '${key}'=='${keyword}'   ${True}   ${False}
        log to console  ${isFound}
        exit for loop if  ${isFound}
    END

    run keyword if  ${isFound}  click element  ${elem}
    ${resultTags}  get element attribute  id:tags  value
    run keyword and continue on failure  should contain  ${resultTags}  ${keyword}

    close browser