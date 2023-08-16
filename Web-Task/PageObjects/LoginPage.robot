*** Settings ***
Documentation   To validate the login form
Library         SeleniumLibrary

*** Variables ***
${BROWSER}              chrome
${user_name}            css:[name='username']
${user_password}        css:[name='password']
${login_button}         css:[type='submit']
${user_dropdown}        css:.oxd-userdropdown-tab
${logout_button}        xpath:(//*[@class='oxd-userdropdown-link'])[4]
${url}                  https://opensource-demo.orangehrmlive.com

*** Keywords ***
Open the Browser
#    Create webdriver    Chrome
#   GO TO               ${url}

        #Humanly its not possibly to run test case this fast also because of very fast processing we can't track/see the test case selenium running on frontend so to mimic real user experience added this line
        Set Selenium Speed  0.2
        Open Browser        ${url}      ${BROWSER}
        Maximize Browser Window

Fill the Login Form
    Wait Until Page Contains Element    ${user_name}        30s
    Input Text              ${user_name}            admin
    Input Password          ${user_password}        admin123
    Click Element           ${login_button}

Click on Dropdown and Then Click Logout
    Wait Until Page Contains Element    ${user_dropdown}        20s
    Click Element       ${user_dropdown}
    Wait Until Page Contains Element    ${logout_button}    20s
    Click Element       ${logout_button}
    Wait Until Page Contains Element    ${login_button}        30s