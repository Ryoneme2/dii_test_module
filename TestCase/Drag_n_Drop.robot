*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${URL}  https://demos.telerik.com/kendo-ui/dragdrop/index
${BROWSER}  chrome
*** Test Cases ***
TC1 : Drag and drop
    open browser  ${URL}  ${BROWSER}
    maximize browser window

    set selenium timeout  3s

    ${status}  run keyword and return status  element should be visible  id:onetrust-banner-sdk
    run keyword if  ${status}
    ...     click button  id:onetrust-accept-btn-handler

    wait until element is visible  id:demo-runner  5s

    execute javascript  window.scrollTo(0,200)

    drag and drop  id:draggable  id:droptarget

    sleep  1

    ${text}  get text  id:droptarget

    should contain  ${text}  You did great!

    close browser