*** Settings ***
Library                 Selenium2Library
Library                 XvfbRobot

*** Variables ***
${SERVER}                          localhost:7272
${USERNAME}                        demo
${PASSWORD}                        mode
${DELAY}                           0
${BROWSER}                         Firefox
${LOGIN URL}                       http://${SERVER}/
${WELCOME URL}                     http://${SERVER}/welcome.html
${ERROR URL}                       http://${SERVER}/error.html
${HEADLESS}                        ${False}
${RESOURCE}                        ${RESOURCE}.robot

*** Keywords ***
Open Login Page
    Run Keyword If      '${HEADLESS}'=='True'    Start Virtual Display    1920    1080  
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open
    
Login Page Should Be Open
    Title Should Be    Login Page

#Open login page
 #   Open browser            ${URL}   #browser=gc
  #  Set Selenium Speed      ${DELAY}

Give username
    [Arguments]             ${USERNAME}
    Input text              username_field      ${USERNAME}
    
Give password
    [Arguments]             ${PASSWORD}
    Input text              password_field      ${PASSWORD}

Click Login button
    Click Button            login_button
    
Check Page title
    [Arguments]             ${PAGE_TITLE}
    Title Should Be         ${PAGE_TITLE}

Check Page location
    [Arguments]             ${SERVER ADDRESS}
    Location Should Be      ${SERVER ADDRESS}

Go login page
    Go To                   ${SERVER ADDRESS}   #browser=gc
    Set Selenium Speed      ${DELAY}