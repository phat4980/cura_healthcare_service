*** Settings ***
Resource    Locators/HomePageLocators.resource
Resource    Locators/LoginPageLocators.resource
Library    SeleniumLibrary

*** Keywords ***
Fill Username
    [Arguments]     ${username}
    Wait Until Element Is Visible   ${txt_username}     2s
    Input Text    ${txt_username}    ${username}

Fill Password
    [Arguments]     ${password}
    Wait Until Element Is Visible   ${txt_password}     2s
    Input Text    ${txt_password}    ${password}

Click login button
    Wait Until Element Is Visible   ${btn_login_button}     2s
    Click Button    ${btn_login_button}

Is in Appointment Page
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${elem_make_appointment}  2s
    RETURN   ${status}

Is error message displayed
    ${status}   Run Keyword And Return Status    Wait Until Element Is Visible    ${elem_error_message}   2s
    RETURN   ${status}