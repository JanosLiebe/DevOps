*** Settings ***
Resource                    resource.robot

Suite Setup                 Open Login Page
Suite Teardown              Close Browser
Test Setup                  Go Login Page
Test Template               Login should pass

*** Test cases ***
Login should pass
    Give username               demo
    Give password               mode
    Click Login button
    #Page Should Contain        Login succeeded
    Check Page location         ${WELCOME URL}
    Check Page Title            Welcome Page
    [Teardown]                  Close Browser
