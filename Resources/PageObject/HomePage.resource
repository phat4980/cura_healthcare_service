*** Settings ***
Library     SeleniumLibrary
Resource    Locators/HomePageLocators.resource
*** Keywords ***
Click Make Appointment Button
    Wait Until Element Is Visible    ${elem_make_appointment}   2s
    Click Element    ${elem_make_appointment}

Click menu toggle
    Wait Until Element Is Visible    ${elem_menu_toggle}   2s
    Click Element    ${elem_menu_toggle}

Click Home menu item
    Wait Until Element Is Visible    ${elem_home_item}   2s
    Click Element    ${elem_home_item}

Click Login menu item
    Wait Until Element Is Visible    ${elem_login_item}   2s
    Click Element    ${elem_login_item}

Click History menu item
    Wait Until Element Is Visible    ${elem_history_item}   2s
    Click Element    ${elem_history_item}

Click Profile menu item
    Wait Until Element Is Visible    ${elem_profile_item}   2s
    Click Element    ${elem_profile_item}

Click Logout account menu item
    Wait Until Element Is Visible    ${elem_logout_item}   2s
    Click Element    ${elem_logout_item}
