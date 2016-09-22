*** Settings ***
Library                 Selenium2Library

*** Variables ***
${HOST}                 localhost:7272
${URL}                  http://${HOST}
${USERNAME}             demo
${PASSWORD}             mode
${DELAY}                0

*** Keywords ***
Open login page
    Open browser            ${URL}   #browser=gc
    Set Selenium Speed      ${DELAY}

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
    [Arguments]             ${URL}
    Location Should Be      ${URL}

Go login page
    Go To                   ${URL}   #browser=gc
    Set Selenium Speed      ${DELAY}