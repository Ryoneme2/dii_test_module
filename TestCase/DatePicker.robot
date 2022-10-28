*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://demo.seleniumeasy.com/bootstrap-date-picker-demo.html
${BROWSER}  chrome
${TABLE}  //div[@class='datepicker-days']/table[@class='table-condensed']/tbody
${select}  13
*** Test Cases ***
TC1 : Table
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3s

    click element  //div[@id='sandbox-container1']/div[1]/input

    wait until element is visible  ${TABLE}

    ${rows}  get element count  ${TABLE}/tr
    ${cols}  get element count  ${TABLE}/tr[1]/td

    FOR  ${r}  IN RANGE  2  ${rows}+1
        FOR  ${c}  IN RANGE  2  ${cols}+1
            ${elm}  get webelement  ${TABLE}/tr[${r}]/td[${c}]
            ${txt}  get text  ${elm}
            log to console  ${txt}

            exit for loop if
        END
    END

    log to console  row:${rows}, col:${cols}

    close browser