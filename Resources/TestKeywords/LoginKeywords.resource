*** Settings ***
Resource    ../PageObject/LoginPage.resource

*** Keywords ***
Submit Login Form
    [Arguments]     ${username}     ${password}
    Set Test Variable    ${USERNAME}    ${username}
    Set Test Variable    ${PASSWORD}    ${password}
    Fill Username    ${username}
    Fill Password    ${password}
    Click login button

Check login successfully
    ${is_in_appointment_page}=   Is in Appointment Page
    Should Be True    ${is_in_appointment_page}    Login successfully -> Expected: 'True', Observed: '${is_in_appointment_page}'
    Set Test Message    Login successfully with '${username}' and '${password}'

Check Login unsuccessfully
    ${is_error_message_displayed}=   Is error message displayed
    Should Be True    ${is_error_message_displayed}   Login unsuccessfully -> Expected: 'True', Observed: '${is_error_message_displayed}'
    Set Test Message    Login unsuccessfully with '${username}' and '${password}'