*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      Chrome
${valid_email}     testmail11223@gmail.com
${valid_password}     123456
${url}      http://prestashop.qatestlab.com.ua/uk/
${login_url}    http://prestashop.qatestlab.com.ua/uk/my-account

*** Keywords ***
Open browser to login page
    open browser    ${url}  ${browser}
    Maximize Browser Window

Navigate to login page
    click link      xpath://a[@class='login']

Input Username
    [Arguments]    ${username}
    Input Text    id:email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:passwd    ${password}

Submit Credentials
    Click Button    id:SubmitLogin

Login Should Have Failed
    Element Should Be Visible       css:#center_column > div.alert

Login Should not Have Failed
    Location Should Be      ${login_url}

Welcome Page Should Be Open
    Location Should Be    ${url}
    Title Should Be    http://prestashop.qatestlab.com.ua/