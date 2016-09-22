*** Settings ***
Resource                    resource.robot

*** Test cases ***
Login should pass
    Open login page
    Give username               demo
    Give password               mode
    Click Login button
    #Page Should Contain        Login succeeded
    Check Page location         http://localhost:7272/welcome.html
    Check Page Title            Welcome Page
    [Teardown]                  Close Browser
