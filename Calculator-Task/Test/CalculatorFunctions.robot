*** Settings ***
Library         AppiumLibrary
Resource            ../PO/Resources.robot

*** Test Cases ***

Open Application
    Open Calculator Application
Validate Division
    Validate Division
Validate Multiplication
    Validate Multiplication
Validate Addition
    Validate Addition
Validate Subtraction
    Validate Subtraction
