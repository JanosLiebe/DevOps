*** Settings ***
Resource                    resource.robot
#Test Teardown               Close Browser

Suite Setup                 Open Login Page
Suite Teardown              Close Browser
Test Setup                  Go Login Page
Test Template               Login should fail

*** Test cases ***                          #   USERNAME        PASSWORD
Login fails - Invalid username                  invalid         mode
Login fails - Invalid password                  demo            invalid
Login fails - Invalid username and password     invalid         invalid
Login fails - Empty username                    ${EMPTY}        mode
Login fails - Empty password                    demo            ${EMPTY}
Login fails - Empty username and password       ${EMPTY}        ${EMPTY}
    
*** Keywords ***
Login should fail
    [Arguments]         ${user}     ${password}
    #Run Keyword If      '${LOGIN PAGE OPEN}'=='True'      Go Login Page
    #Run Keyword If      '${LOGIN PAGE OPEN}'=='False'     Open Login Page
    Give username               demo
    Give username               ${user}
    Give password               ${password}
    Click Login button
    #Page Should Contain        Login succeeded
    Check Page location         ${ERROR URL}
    Check Page Title            Error Page
