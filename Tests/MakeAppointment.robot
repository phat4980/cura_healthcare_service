*** Settings ***
Documentation    Make appointment test cases
Resource    ../Resources/Base.resource
Suite Setup     Open Appointment Page
Suite Teardown      Close chrome client
Test Template    Verify make appointment successfully

*** Variables ***

*** Test Cases ***       facility        readmission             program        visit_date                    comment
Appointment with Tokyo Facility with readmission
...                      ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Tokyo Facility without readmission
...                      ${TOKYO}        ${WITHOUT_READMISSION}  ${MEDICAID}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Hongkong Facility with readmission
...                      ${HONGKONG}     ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Hongkong Facility without readmission
...                      ${HONGKONG}     ${WITHOUT_READMISSION}  ${MEDICAID}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Seoul Facility with readmission
...                      ${SEOUL}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Seoul Facility without readmission
...                      ${SEOUL}        ${WITHOUT_READMISSION}  ${MEDICAID}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Medicare Program
...                      ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Medicaid Program
...                      ${HONGKONG}     ${WITHOUT_READMISSION}  ${MEDICAID}    ${VALID_VISIT_DATE}           ${SPECIAL_CHAR_COMMENT}
Appointment with None Program
...                      ${SEOUL}        ${WITH_READMISSION}     ${NONE}        ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Valid visit date
...                      ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Normal comment
...                      ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${NORMAL_COMMENT}
Appointment with Special character comment
...                      ${TOKYO}        ${WITHOUT_READMISSION}  ${MEDICARE}    ${VALID_VISIT_DATE}           ${SPECIAL_CHAR_COMMENT}
Appointment with Empty comment
...                      ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}    ${VALID_VISIT_DATE}           ${EMPTY_COMMENT}
Appointment with Empty visit date        [Template]      Verify make appointment unsuccessfully with empty visit date
                         ${TOKYO}        ${WITH_READMISSION}     ${MEDICARE}     ${EMPTY}                      ${NORMAL_COMMENT}


*** Keywords ***
Verify make appointment successfully
    [Arguments]    ${facility}    ${hospital_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Given Open Appointment form
    When Submit Make Appoiment form   ${facility}    ${hospital_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Then Check submit form successfully
    and Check appointment information correctly    ${facility}    ${hospital_readmission}    ${healthcare_program}    ${visit_date}    ${comment}

Verify make appointment unsuccessfully with empty visit date
    [Arguments]    ${facility}    ${hospital_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Given Open Appointment form
    When Submit Make Appoiment form   ${facility}    ${hospital_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Then Check submit form unsuccessfully
