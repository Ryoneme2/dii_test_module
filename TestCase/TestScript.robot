*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${URL}  https://theautomationzone.blogspot.com/2020/07/mix-of-basic-webelements.html
${BROWSER}  chrome
${locateP3}  //p[@id='p3']
*** Test Cases ***
TC1: Demo
    open browser  ${URL}  ${BROWSER}
    maximize browser window
    ${h1}     get text  //h3[@id='h1']
    ${attrTextContent}  get element attribute    ${locateP3}     textContent
    ${attrInnerText}  get element attribute    ${locateP3}     innerText
    ${attrInnerHTML}  get element attribute    ${locateP3}    innerHTML
    input text  //input[@id='input1']   IndyTest
    ${attrValueInput}  get element attribute    //input[@id='input1']    value
    log to console  ${attrValueInput} and ${h1} and ${attrTextContent} and ${attrInnerText} and ${attrInnerHTML}
    sleep  1
    close browser