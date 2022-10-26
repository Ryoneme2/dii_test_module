*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://www.calculatestuff.com/health/bmi-calculator.html
${BROWSER}  chrome
&{body}  h=175  w=62
@{status}  (Normal)  (Overweight)  (Underweight)
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    click element  id:units_metric
    input text  id:height   ${body}[h]
    input text  id:weight   ${body}[w]
    click button  id:calculate-button
    sleep  2
    ${bmi}  get text  //span[@class='big-bold']
    ${bmiStatus}  get text  //span[@class='bmi-normal']
    should contain  ${status}  ${bmiStatus}
    log to console  ${bmi}
    close browser