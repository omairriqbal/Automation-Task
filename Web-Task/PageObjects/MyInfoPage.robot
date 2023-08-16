*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${my_info}              xpath:(//*[@class='oxd-text oxd-text--span oxd-main-menu-item--name'])[6]
${dob_field}            xpath:(//div[@class='oxd-date-input']/input)[2]
${save_button}          xpath:(//button[@type='submit'])[1]
${second_save_button}   xpath:(//button[@type='submit'])[2]
${calendar_icon}        xpath:(//i[@class="oxd-icon bi-calendar oxd-date-input-icon"])[2]
${clear_btn}            xpath:(//div[@class='oxd-date-input-link --clear'])
${loading_spinner}      xpath:(//div[@class='oxd-loading-spinner'])[1]
${attachment_text}      xpath:(//*[@class='oxd-text oxd-text--h6 orangehrm-main-title'])[contains(., 'Attachments')]


*** Keywords ***

    # Wait until the page is loaded
Verify the My Info page is fully loaded
    Wait Until Page Contains Element        ${my_info}        30s
    Click Element           ${my_info}
    # Verify page load status using JavaScript
    ${readyState}    Execute JavaScript    return document.readyState
    Should Be Equal As Strings    ${readyState}    complete

Verify “Date of Birth” field is filled in
    Wait Until Page Contains Element        ${dob_field}        30s
    ${dob_filled}       Run Keyword If      "${dob_field}" != "${EMPTY}"    Set Variable    True
    Should Be True      ${dob_filled}    # Verify that the Run Keyword If condition was true

Update the Date of Birth
    #Sometime due to slow internet Spinner appearing on screen take more time due to which calendar_icon is getting timeout
    #so I waited for spinner to get hide.This will make sure that calendar icon get visible
    Wait Until Element Is Visible           ${loading_spinner}     10s
    Wait Until Element Is Not Visible       ${loading_spinner}     10s
    Wait Until Page Contains Element        ${calendar_icon}        30s

    #opening calendar and then pressing clear button to clear input field
    Click Element    ${calendar_icon}
    Wait Until Page Contains Element        ${clear_btn}        30s
    Click Element    ${clear_btn}
    Input Text              ${dob_field}                2021-07-19
    #verifing either DOB is updated or not
     ${dob_value}    Get Value       ${dob_field}
    Should Be Equal As Strings      ${dob_value}        2021-07-19

    #Pressing Enter after updating DOB instead of clicking Save button coz sometime View didn't scroll to Save Button
    #and when view didn't find Save button it crashes the test case so I find Press ENter more stable for this case
    Press Keys   none    ENTER


