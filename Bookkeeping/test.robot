*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt
Resource    ../keywords/accountBook.txt

# Suite Setup    Open Account Bank
# Suite Teardown    Close Application

*** Test cases ***
Add a new expense transaction on default view
    [Tags]    TC-1-01    TC-1-05
    [Setup]    Open Account Bank
    Open New Transaction View
    Choose Type On New Transaction View    type=pet
    Input Amount On New Transaction View    amount=56123
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123
    [Teardown]    Close Application

Add a new income transaction on default view
    [Tags]    TC-1-02    TC-1-06
    [Setup]    Open Account Bank
    Open New Transaction View
    Select Income On New Transaction View
    Choose Type On New Transaction View    type=parttime job
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=parttime job    amount=+$551,234
    [Teardown]    Close Application

Add a new expense with different member
    [Tags]    TC-1-03
    [Setup]    Open Account Bank
    Open New Transaction View
    Change Member    member=wife
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$551,234    from=wife
    [Teardown]    Close Application

Add a new income transaction with different member
    [Tags]    TC-1-04
    [Setup]    Open Account Bank
    Open New Transaction View
    Select Income On New Transaction View
    Choose Type On New Transaction View    type=bonus
    Change Member    member=wife
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=bonus    amount=+$551,234    from=wife
    [Teardown]    Close Application

Add a new expense with different date
    [Tags]    TC-1-07
    [Setup]    Open Account Bank
    Open New Transaction View
    Change Date
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$551,234
    [Teardown]    Close Application

Add a new income with different date
    [Tags]    TC-1-08
    [Setup]    Open Account Bank
    Open New Transaction View
    Select Income On New Transaction View
    Change Date
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=wage    amount=+$551,234
    [Teardown]    Close Application

Add a new expense with different calculation
    [Tags]    TC-1-09
    [Setup]    Open Account Bank
    Open New Transaction View
    Input Amount On New Transaction View    amount=23x11
    Click Equal Button On Transaction View
    Number On View Should Be    253
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$253
    [Teardown]    Close Application

Add a new income with different calculation
    [Tags]    TC-1-10
    [Setup]    Open Account Bank
    Open New Transaction View
    Select Income On New Transaction View
    Input Amount On New Transaction View    amount=23/23
    Click Equal Button On Transaction View
    Number On View Should Be    1
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=wage    amount=+$1
    [Teardown]    Close Application

Watch information with month, 2week, and week
    [Tags]    TC-1-11
    [Setup]    Open Account Bank
    Default View Should Be Visible
    Switch To Calendar View
    Change View To Week, 2Weeks, Month
    [Teardown]    Close Application

Edit a expense transaction on default view
    [Tags]    TC-1-12
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=diet    amount=-$56,123
    Edit Transaction Type    newType=gift    type=diet    amount=-$56,123
    Transaction Should Be Visible On Default View    type=gift    amount=-$56,123
    [Teardown]    Close Application

Edit a income transaction on default view
    [Tags]    TC-1-13
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Select Income On New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=wage    amount=+$56,123
    Edit Transaction Type    newType=investment    type=wage    amount=+$56,123
    Transaction Should Be Visible On Default View    type=investment    amount=+$56,123
    [Teardown]    Close Application

Watch expense analysis
    [Tags]    TC-1-14
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=77777
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=diet    amount=-$77,777
    Click Expense Analysis On Default View
    Expense Analysis Should Be Visible
    [Teardown]    Close Application

Watch income analysis
    [Tags]    TC-1-15
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Open New Transaction View
    ...                 AND    Select Income On New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=66666
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=wage    amount=+$66,666
    Click Income Analysis
    Income Analysis Should Be Visible
    [Teardown]    Close Application

Add a new expense with different account
    [Tags]    TC-1-16
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Go To Settings View
    ...                 AND    Click Accounts On Settings View
    ...                 AND    Add A New Account    name=NewAccount
    ...                 AND    Save Accounts
    ...                 AND    Go To Books View
    Open New Transaction View
    Choose Type On New Transaction View    type=pet
    Choose Account On New Transactin View    account=NewAccount
    Input Amount On New Transaction View    amount=56123
    Click OK Button On New Transaction View
    Default View Should Be Visible
    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123    account=NewAccount
    [Teardown]    Close Application

Change currency from USD to NTD
    [Setup]    Run Keywords    Open Account Bank
    ...                 AND    Go To Settings View
    Click Accounts On Settings View
    Select Account On Accounts View    default account
    Change Currency    Taiwan Dollar
    Currency Should Be    currency=Taiwan Dollar(TWD)
    [Teardown]    Close Application