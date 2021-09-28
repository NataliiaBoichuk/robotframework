*** Settings ***
Suite Setup     Open browser to login page
Suite Teardown  Close Browser
Test Setup  Navigate to login page
Test Template  Login With Invalid Credentials Should Fail
Resource  resourse.resource

*** Test Cases ***
Invalid Username    invalid     ${valid_password}
Invalid Password    ${valid_email}  invalid
Invalid Username And Password    invalid    whatever
Empty Username      ${EMPTY}    ${valid_password}
Empty Password      ${valid_email}  ${EMPTY}
Empty Username And Password     ${EMPTY}    ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed
