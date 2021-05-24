*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt
Resource    ../keywords/analytics.txt

Suite Setup    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Choose Type On New Transaction View    type=pet
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123
    ...                 AND    Go To Analytics View
Suite Teardown    Close Application

*** Test cases ***
Check expense analysis chart by category
    [Tags]    TC-3-01
    Expense Analysis Label Is Visible
    Analysis Chart Is Visible

Check expense analysis chart by account
    [Tags]    TC-3-02
    Expense Analysis Label Is Visible
    Open Category Dropdown
    Select Category Option    Account
    Analysis Chart Is Visible

Check expense analysis chart by member
    [Tags]    TC-3-03
    Expense Analysis Label Is Visible
    Open Category Dropdown
    Select Category Option    Member
    Analysis Chart Is Visible
