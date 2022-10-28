*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://th.indeed.com/
${BROWSER}  chrome
*** Test Cases ***
TC1 : Find job
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium speed  -100

    input text  id:text-input-what  Software Tester
    press keys  id:text-input-what  COMMAND+A+COMMAND+X
    input text  id:text-input-what  Robot Framework

    input text  id:text-input-where  Bangkok

    click button  css:button.yosegi-InlineWhatWhere-primaryButton

    ${rawJobCount}  get text  //div[@class='jobsearch-JobCountAndSortPane-jobCount']/span[1]

    ${jobCount}  get substring  ${rawJobCount}  10

    log to console  ${jobCount}

    should contain  ${jobCount}  75 jobs

    close browser


