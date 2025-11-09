*** Settings ***
Documentation   Setup test environment for testing
Library    SeleniumLibrary
Resource    Resources/TestKeywords/Common.resource
Test Teardown   Close Chrome Client

*** Tasks ***
Open chrome client and go to page
    Open Chrome client
    Web Connect To Chrome Client    ${chrome_debug_port}
    Go To    ${home_page_url}