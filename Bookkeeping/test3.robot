*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt
Resource    ../keywords/analytics.txt
Resource    ../keywords/accountBook.txt

Suite Setup    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Choose Type On New Transaction View    type=pet
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123
    ...                 AND    Open New Transaction View
    ...                 AND    Select Income On New Transaction View
    ...                 AND    Choose Type On New Transaction View    type=parttime job
    ...                 AND    Input Amount On New Transaction View    amount=57234
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=parttime job    amount=+$57,234
    ...                 AND    Go To Analytics View
Suite Teardown    Close Application

*** Test cases ***
Check expense analysis chart by category
    [Tags]    TC-3-01
    Expense Analysis Label Should Be Visible
    Analysis Chart Should Be Visible

Check expense analysis chart by account
    [Tags]    TC-3-02
    Expense Analysis Label Should Be Visible
    Open Category Dropdown
    Select Category Option    Account
    Analysis Chart Should Be Visible

Check expense analysis chart by member
    [Tags]    TC-3-03
    Expense Analysis Label Should Be Visible
    Open Category Dropdown
    Select Category Option    Member
    Analysis Chart Should Be Visible

Check income analysis chart by category
    [Tags]    TC-3-04
    Click Income Analysis Label
    Income Analysis Label Should Be Visible
    Analysis Chart Should Be Visible

Check income analysis chart by account
    [Tags]    TC-3-05
    Click Income Analysis Label
    Income Analysis Label Should Be Visible
    Open Category Dropdown
    Select Category Option    Account
    Analysis Chart Should Be Visible

Check income analysis chart by member
    [Tags]    TC-3-06
    Click Income Analysis Label
    Income Analysis Label Should Be Visible
    Open Category Dropdown
    Select Category Option    Member
    Analysis Chart Should Be Visible

Check budget chart
    [Tags]    TC-3-07
    [Setup]    Run Keywords    Click Budget Analysis Label
    ...                 AND    Budget Analysis Label Should Be Visible
    ...                 AND    Go To Budget Settings
    ...                 AND    Set Monthly Budget    1000
    ...                 AND    Set Annual Budget    12000
    ...                 AND    Set Weekly Budget    250
    ...                 AND    Go Back To Analysis View
    Select Budget Dropdown    Weekly
    Budget Chart Should Be Visible    Weekly    250
    Select Budget Dropdown    Monthly
    Budget Chart Should Be Visible    Monthly    1,000
    Select Budget Dropdown    Annual
    Budget Chart Should Be Visible    Annual    12,000

Check income and expenses trends chart
    [Tags]    TC-3-08
    Click Trends Label
    Trends Analysis Label Should Be Visible
    Trends Chart Should Be Visible    maxValue=60000
    Trends Transaction Should Be Visible    income=$57,234    expenses=$56,123    total=$1,111

Check assets trends chart
    [Tags]    TC-3-09
    Click Assets Label
    Assets Analysis Label Should Be Visible
    Select Assets Dropdown    default account
    Trends Chart Should Be Visible    maxValue=1200
    Assets Transaction Should Be Visible    expensesIncome=$1,111    balance=$1,111

Check other account assets trends chart
    [Tags]    TC-3-10
    [Setup]    Run Keywords    Go To Settings View
    ...                 AND    Click Accounts On Settings View
    ...                 AND    Add A New Account    name=NewAccount
    ...                 AND    Save Accounts
    ...                 AND    Go To Books View
    ...                 AND    Open New Transaction View
    ...                 AND    Choose Type On New Transaction View    type=pet
    ...                 AND    Choose Account On New Transactin View    account=NewAccount
    ...                 AND    Input Amount On New Transaction View    amount=45678
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=pet    amount=-$45,678    account=NewAccount
    ...                 AND    Go To Analytics View
    Click Assets Label
    Assets Analysis Label Should Be Visible
    Select Assets Dropdown    NewAccount
    Trends Chart Should Be Visible    maxValue=-40000
    #FIXME Unstable
    Assets Transaction Should Be Visible    expensesIncome=$44,678    balance=$44,678