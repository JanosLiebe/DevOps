*** Settings ***
Resource                    resource.robot

*** Test cases ***
Login should pass
    Go login page
    Give username               demo
    Give password               mode
    Click Login button
    #Page Should Contain        Login succeeded
    Check Page location         ${WELCOME URL}
    Check Page Title            Welcome Page
    [Teardown]                  Close Browser
