*** Settings ***
Library         AppiumLibrary

*** Variables ***
${first_number}             com.google.android.calculator:id/digit_8
${second_number}            com.google.android.calculator:id/digit_2
${operator_div}             com.google.android.calculator:id/op_div
${operator_mul}             com.google.android.calculator:id/op_mul
${operator_add}             com.google.android.calculator:id/op_add
${operator_sub}             com.google.android.calculator:id/op_sub
${Operator-Eql}             com.google.android.calculator:id/eq
${operator_clr}             com.google.android.calculator:id/clr
${result_field}             com.google.android.calculator:id/result_preview

*** Keywords ***
Open Calculator Application
# Kindly update the following configuration as per your device  
#platformName
#platformVersion
#deviceName

        Open Application              http://localhost:4723/wd/hub       platformName=Android        platformVersion=13       deviceName=RFCT41PV3EN        automationName=uiautomator2      appPackage=com.google.android.calculator       appActivity=com.android.calculator2.Calculator

Validate Division
        #wait for digit to be visible just to verify app is loaded completely and we can start our test
        Wait Until Element Is Visible              ${first_number}        timeout=10
        ClickElement                                ${first_number}
        ClickElement                                ${operator_div}
        ClickElement                                ${second_number}
        #verifying does test case succeed or not
        Element Should Contain Text     ${result_field}     4

Validate Multiplication
        #wait for digit to be visible just to verify app is loaded completely and we can start our test
        Wait Until Element Is Visible              ${first_number}        timeout=10
        ClickElement                                ${operator_clr}
        ClickElement                                ${first_number}
        ClickElement                                ${operator_mul}
        ClickElement                                ${second_number}
        #verifying does test case succeed or not
        Element Should Contain Text     ${result_field}     16

Validate Addition
        #wait for digit to be visible just to verify app is loaded completely and we can start our test
        Wait Until Element Is Visible              ${first_number}        timeout=10
        ClickElement                                ${operator_clr}
        ClickElement                                ${first_number}
        ClickElement                                ${operator_add}
        ClickElement                                ${second_number}
        #verifying does test case succeed or not
        Element Should Contain Text     ${result_field}     10

Validate Subtraction
        #wait for digit to be visible just to verify app is loaded completely and we can start our test
        Wait Until Element Is Visible              ${first_number}        timeout=10
        ClickElement                                ${operator_clr}
        ClickElement                                ${first_number}
        ClickElement                                ${operator_sub}
        ClickElement                                ${second_number}
        #verifying does test case succeed or not
        Element Should Contain Text     ${result_field}     6
