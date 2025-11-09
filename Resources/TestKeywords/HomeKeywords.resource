*** Settings ***
Resource    ../PageObject/HomePage.resource
Resource    Common.resource
Resource    ../PageObject/LoginPage.resource

*** Keywords ***
Navigate to Home Page
    Click menu toggle
    Click Home menu item

Navigate to Login Page
    Click menu toggle
    Click Login menu item

Navigate to History Page
    Click menu toggle
    Click History menu item

Navigate to Profile Page
    Click menu toggle
    Click Profile menu item

Logout account
    Click menu toggle
    Click Logout account menu item