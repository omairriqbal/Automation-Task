*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource        ../PageObjects/LoginPage.robot
Resource        ../PageObjects/MyInfoPage.robot

*** Test Cases ***
Validate Sucessful Login
    Open the Browser
    Fill the Login Form

Open MyInfo and Update DOB
    Verify the My Info page is fully loaded
    Verify “Date of Birth” field is filled in
    Update the Date of Birth

Validate Successful Logout
    Click on Dropdown and Then Click Logout