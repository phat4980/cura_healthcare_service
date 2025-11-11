*** Settings ***
Library     SeleniumLibrary
Resource    Locators/AppointmentPageLocators.resource

*** Keywords ***
Open Facility dropdown menu
    Wait Until Element Is Visible    ${elem_facility_dropdown}   2s
    Click Element    ${elem_facility_dropdown}

Select Facility dropdown items
    [Arguments]    ${facility}
    Wait Until Element Is Visible    ${elem_facility_dropdown}      2s
    ${facility_item} =      Get List Items    ${elem_facility_dropdown}
    Log    ${facility_item}
    FOR    ${item}    IN    @{facility_item}
        Run Keyword If    '${item}' == '${facility}'    Select From List By Label    ${elem_facility_dropdown}    ${item}
    END

Click Apply for hospital readmission checkbox
    [Arguments]     ${apply_hospital_readmission}
    Wait Until Element Is Visible    ${elem_hospital_readmission_checkbox}    2s
    IF    "${apply_hospital_readmission}" == "Yes"
        Select Checkbox    ${elem_hospital_readmission_checkbox}
    ELSE
        Unselect Checkbox    ${elem_hospital_readmission_checkbox}
    END

Select Healthcare program
    [Arguments]   ${healcare_program}
    IF    "${healcare_program}" == "Medicare"
        Wait Until Element Is Visible    ${elem_prog_medicare_radiobtn}   2s
        Click Element    ${elem_prog_medicare_radiobtn}
    ELSE IF    "${healcare_program}" == "Medicaid"
        Wait Until Element Is Visible    ${elem_prog_medicaid_radiobtn}   2s
        Click Element    ${elem_prog_medicaid_radiobtn}
    ELSE
        Wait Until Element Is Visible    ${elem_prog_none_radiobtn}   2s
        Click Element    ${elem_prog_none_radiobtn}
    END

Fill visit date
    [Arguments]   ${visit_date}
    Wait Until Element Is Visible    ${txt_visit_date}   2s
    Input Text    ${txt_visit_date}    ${visit_date}

Fill comment
    [Arguments]   ${comment}
    Wait Until Element Is Visible    ${txt_comment}   2s
    Input Text    ${txt_comment}    ${comment}

Click Book Appointment button
    Wait Until Element Is Visible    ${btn_book_appointment}   2s
    Click Button    ${btn_book_appointment}

