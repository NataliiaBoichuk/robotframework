*** Settings ***
Suite Setup     Open browser to login page
Suite Teardown  Close Browser
Test Setup  Navigate to login page
Test Template  Login With Valid Credentials Should Fail
Resource  resourse.resource

*** Test Cases ***
Valid data  ${valid_email}  ${valid_password}

*** Keywords ***
Login With Valid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should not Have Failed