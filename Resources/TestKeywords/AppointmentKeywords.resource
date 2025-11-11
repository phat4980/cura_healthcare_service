*** Settings ***
Resource    ../PageObject/AppointmentPage.resource
Resource    ../PageObject/HomePage.resource
Resource    ../PageObject/AppointmentConfirmationPage.resource
Resource    ../PageObject/AppointmentConfirmationPage.resource

*** Keywords ***
Open Appointment form
    Click Make Appointment Button

Submit Make Appoiment form
    [Arguments]    ${facilityItem}  ${hospital_readmission}   ${healcare_program}    ${visit_date}   ${comment}
    Select Facility dropdown items    ${facilityItem}
    Click Apply for hospital readmission checkbox    ${hospital_readmission}
    Select Healthcare program    ${healcare_program}
    Fill visit date    ${visit_date}
    Fill comment    ${comment}
    Click Book Appointment button

Check submit form successfully
    ${is_in_appointment_confirmation_page}=     Is in Appointment Confirmation Page
    Should Be True    ${is_in_appointment_confirmation_page}   Submit successfully -> Expected: 'True', Observed: '${is_in_appointment_confirmation_page}'
    Set Test Message    Submit appointment form successfully

Check appointment information correctly
    [Arguments]     ${facility}     ${hospital_readmission}      ${healthcare_program}       ${visit_date}       ${comment}
    ${appointment_info}=    Get appointment Confirmation info
    Should Be Equal As Strings    ${facility}    ${appointment_info.facility}   Facility incorrectly -> Expected: '${facility}', Observed: '${appointment_info.facility}'
    Should Be Equal As Strings    ${hospital_readmission}    ${appointment_info.hospital_readmission}   Hospital readmission incorrectly -> Expected: '${hospital_readmission}', Observed: '${appointment_info.hospital_readmission}'
    Should Be Equal As Strings    ${healthcare_program}    ${appointment_info.healthcare_prog}   Healthcare program incorrectly -> Expected: '${healthcare_program}', Observed: '${appointment_info.healthcare_prog}'
    Should Be Equal As Strings    ${visit_date}    ${appointment_info.visit_date}   Visit date incorrectly -> Expected: '${visit_date}', Observed: '${appointment_info.visit_date}'
    Should Be Equal As Strings    ${comment}    ${appointment_info.comment}   Comment incorrectly -> Expected: '${comment}', Observed: '${appointment_info.comment}'
    Set Test Message    Appointment confirmation is correct with: '${appointment_info}'

Check submit form unsuccessfully
    ${is_valid}=    Execute JavaScript    return !document.querySelector('#txt_visit_date').checkValidity();
    Should Be True    ${is_valid}