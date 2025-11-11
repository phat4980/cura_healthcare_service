*** Settings ***
Documentation   Login test cases
Resource    ../Resources/Base.resource
Suite Setup      Initialize Chrome Client
Suite Teardown   Close Chrome Client
Test Template    Verify login unsuccessfully

*** Test Cases ***                              Username               Password
Login with Valid username, invalid password     ${VALID_USERNAME}      ${INVALID_PASSWORD}
Login with Valid username, empty password       ${VALID_USERNAME}      ${EMPTY}
Login with Invalid username, valid password     ${INVALID_USERNAME}    ${VALID_PASSWORD}
Login with Empty username, valid password       ${EMPTY}               ${VALID_PASSWORD}
Login with uppercase username, valid password   ${UPPERCASE_USERNAME}  ${VALID_PASSWORD}
Login with valid username, uppercase password   ${VALID_USERNAME}      ${UPPERCASE_PASSWORD}
Login with Valid username, valid password       [Template]      Verify login successfully
                                                ${VALID_USERNAME}      ${VALID_PASSWORD}


*** Keywords ***
Verify login successfully
    [Arguments]   ${username}   ${password}
    Given Open CURA Health Service Page
    When Navigate to Login Page
    and Submit Login Form   ${username}   ${password}
    Then Check login successfully
    [Teardown]   Logout account

Verify login unsuccessfully
    [Arguments]   ${username}   ${password}
    Given Open CURA Health Service Page
    When Navigate to Login Page
    and Submit Login Form   ${username}   ${password}
    Then Check login successfully
