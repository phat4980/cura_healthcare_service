*** Settings ***
Library     SeleniumLibrary
Resource    Locators/AppointmentConfirmationLocators.resource

*** Keywords ***
Is in Appointment Confirmation Page
    ${status}   Run Keyword And Return Status    Wait Until Element Is Visible   ${elem_appointment_conf_title}
    RETURN   ${status}

Get appointment Confirmation info
    ${facility_selected}=   Get Text    ${elem_facility_selected}
    ${hos_readmission_selected}=   Get Text    ${elem_readmission_selected}
    ${healthcare_prog_selected}=   Get Text    ${elem_healthcare_program_selected}
    ${visit_date_selected}=   Get Text    ${elem_visit_date_selected}
    ${comment_selected}=   Get Text    ${elem_comment_selected}

    ${appointment_confirmation_dict}    Create Dictionary
    ...   facility=${facility_selected}
    ...   hospital_readmission=${hos_readmission_selected}
    ...   healthcare_prog=${healthcare_prog_selected}
    ...   visit_date=${visit_date_selected}
    ...   comment=${comment_selected}
    RETURN  ${appointment_confirmation_dict}
    
Click Go To Homepage button
    Wait Until Element Is Visible    ${elem_go_to_homepage_btn}     2s
    Click Element    ${elem_go_to_homepage_btn}