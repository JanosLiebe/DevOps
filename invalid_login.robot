*** Settings ***
Resource                    resource.robot

Suite Setup                 Open Login Page
Suite Teardown              Close Browser
Test Setup                  Go Login Page
#Test Template               Login should fail

*** Test cases ***
Login fails - Invalid username
    Login should fail           invalid         mode

Login fails - Invalid password
    Login should fail           demo            invalid
    
Login fails - Invalid username and password
    Login should fail           invalid         invalid
    
Login fails - Empty username
    Login should fail           ${EMPTY}        mode

Login fails - Empty password
    Login should fail           demo            ${EMPTY}
    
Login fails - Empty username and password
    Login should fail           ${EMPTY}        ${EMPTY}
    
*** Keywords ***
Login should fail
    [Arguments]         ${user}     ${password}
    Give username               ${user}
    Give password               ${password}
    Click Login button
    #Page Should Contain        Login succeeded
    Check Page location         ${ERROR URL}
    Check Page Title            Error Page
