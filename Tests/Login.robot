*** Settings ***
Resource    ../Resources/Base.resource
Suite Setup      Initialize Chrome Client
Suite Teardown   Close Chrome Client
Test Template    Verify login unsuccessfully

*** Test Cases ***                  Username               Password
Valid username, invalid password    ${VALID_USERNAME}      ${INVALID_PASSWORD}
Valid username, empty password      ${VALID_USERNAME}      ${EMPTY}
Invalid username, valid password    ${INVALID_USERNAME}    ${VALID_PASSWORD}
Empty username, valid password      ${EMPTY}               ${VALID_PASSWORD}
uppercase username, valid password  ${UPPERCASE_USERNAME}  ${VALID_PASSWORD}
valid username, uppercase password  ${VALID_USERNAME}      ${UPPERCASE_PASSWORD}
Valid username, valid password      [Template]      Verify login successfully
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
