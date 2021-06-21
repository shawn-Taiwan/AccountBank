*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt
Resource    ../keywords/analytics.txt
Resource    ../keywords/accountBook.txt
Resource    ../keywords/settings.txt

Suite Setup    Open Account Bank
Suite Teardown    Close Application

*** Test Cases ***
Change language
    [Tags]    TC-4-01
    [Setup]    Go To Settings View
    Change Language    繁體中文
    Language Should Be Changed
    [Teardown]    Run Keyword    Change Language    Auto

Change theme color
    [Tags]    TC-4-02
    [Setup]    Go To Settings View
    Click Theme Settings
    Theme Should Be Changed
    [Teardown]    Go Back To Settings Page

Create income category
    [Tags]    TC-4-03
    [Setup]    Go To Settings View
    Go To Category View
    Click Income On Category View
    Create Category    newItem
    Category Should Be Created    newItem
    [Teardown]    Go Back To Settings Page

Create outcome category
    [Tags]    TC-4-04
    [Setup]    Go To Settings View
    Go To Category View
    Create Category    newItem
    Category Should Be Created    newItem
    [Teardown]    Go Back To Settings Page

Create member
    [Tags]    TC-4-05
    [Setup]    Go To Settings View
    Go To Member View
    Create Member    hook
    Member Should Be Created    hook
    [Teardown]    Go Back To Settings Page

# Estmate annual budget
    # [Tags]    TC-4-06
    # [Setup]    Go To Settings View
    # [Teardown]    Go Back To Settings Page

# Estmate weekly budget
    # [Tags]    TC-4-07
    # [Setup]    Go To Settings View
    # [Teardown]    Go Back To Settings Page

Estmate monthly budget
    [Tags]    TC-4-08
    [Setup]    Go To Settings View
    Go To Budget Setting View
    Click Default Book Label
    Input Budget    10000
    Save Budget
    [Teardown]    Go Back To Settings Page