*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://www.calculatestuff.com/miscellaneous/gpa-calculator
${BROWSER}  chrome
*** Test Cases ***
TC1 : Alert Box
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  5

    input text  id:courses_1_name  Math
    input text  id:courses_1_credit_hours  3
    select from list by label  id:courses_1_grade  B

    input text  id:courses_2_name  English
    input text  id:courses_2_credit_hours  3
    select from list by label  id:courses_2_grade  A

    input text  id:courses_3_name  Music
    input text  id:courses_3_credit_hours  2
    select from list by label  id:courses_3_grade  C

    click button  id:calculate-button

    wait until element contains  id:results  Your GPA

    ${gpa}  get text  id:results

    should contain  ${gpa}  Your GPA: 3.12

    log to console  ${gpa}

    close browser
