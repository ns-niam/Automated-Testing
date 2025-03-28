*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://www.demoblaze.com/
${BROWSER}     chrome
${USERNAME}    Xylo_93Tron
${PASSWORD}    @Secure#Pass_879!

*** Keywords ***
Open DemoBlaze
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--incognito")
    Maximize Browser Window

Close DemoBlaze
    Sleep    2s
    Close Browser

*** Test Cases ***

Sign Up Test
    Open DemoBlaze
    Click Element    xpath=//a[text()='Sign up']
    Sleep    2s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    2s
    Handle Alert    ACCEPT
    Close DemoBlaze

Login Test
    Open DemoBlaze
    Click Element    xpath=//a[text()='Log in']
    Sleep    2s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Sleep    3s
    Page Should Contain    Welcome ${USERNAME}
    Close DemoBlaze

Logout Test
    Open DemoBlaze
    Click Element    xpath=//a[text()='Log in']
    Sleep    2s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Sleep    3s
    Click Element    xpath=//a[text()='Log out']
    Sleep    2s
    Close DemoBlaze
