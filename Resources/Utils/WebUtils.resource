*** Settings ***
Documentation   Web Utils for all general web test actions
Library    Process
Library    SeleniumLibrary

*** Keywords ***
Web Open Chrome Client
    [Documentation]    Open a chrome client that can be connect repeatedly via specified debug port
    [Arguments]    ${chromeExecPath}    ${chrome_debug_port}  ${chrome_test_profile_folder}
    ${result} =    Start Process    ${chromeExecPath}    --remote-debugging-port\=${chrome_debug_port}    --user-data-dir\=${chrome_test_profile_folder}    --start-maximized    --disable-popup-blocking
    RETURN    ${result}

Web Connect To Chrome Client
    [Documentation]    Connect to a Chrome client if it is open (using Web Open Chrome Client)
    [Arguments]    ${chrome_debug_port}
    ${ChromeOptions}=     Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()  sys,selenium.webdriver
    Evaluate    $ChromeOptions.add_experimental_option("""debuggerAddress""", """127.0.0.1:${chrome_debug_port}""")
    ${result} =     Create Webdriver    Chrome    options=${ChromeOptions}
    RETURN    ${result}