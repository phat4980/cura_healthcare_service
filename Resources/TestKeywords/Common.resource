*** Settings ***
Documentation   Common keywords
Resource    ../Utils/WebUtils.resource
Resource    ../../RunConfig.resource
Resource    HomeKeywords.resource
Resource    LoginKeywords.resource
Resource    ../TestData/LoginData.resource

*** Keywords ***
Open Chrome client
    ${result} =    Web Open Chrome Client    ${chrome_path}    ${chrome_debug_port}    ${chrome_test_profile_folder}
    Set Suite Variable    ${chrome_process}    ${result}
    Should Be True    ${result}     Cannot start Chrome test client; path:${chrome_path}; port:${chrome_debug_port}; profileFolder:${chrome_test_profile_folder}

Close Chrome Client
    Terminate Process   ${chrome_process}   kill=True

Initialize Chrome Client
    Open Chrome client
    Web Connect To Chrome Client    ${chrome_debug_port}

Open CURA Health Service Page
    Go To    ${home_page_url}

Open Appointment Page
    Initialize Chrome Client
    Open CURA Health Service Page
    Navigate to Login Page
    Submit Login Form   ${VALID_USERNAME}   ${VALID_PASSWORD}



