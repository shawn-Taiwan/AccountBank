*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt

Suite Setup    Open Account Bank
Suite Teardown    Close Application

*** Variables ***
${addNewBookButton} =    xpath=//android.widget.ImageView[@content-desc="add Book"]

*** Test cases ***
Add a new expense transaction on default view
    Open New Transaction View
    Choose Type On New Transaction View    type=pet
    Input Amount On New Transaction View    amount=56123
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123

Add a new income transaction on default view
    Open New Transaction View
    Select Income On New Transaction View
    Choose Type On New Transaction View    type=parttime job
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=parttime job    amount=+$551,234

Add a new expense with different member
    Open New Transaction View
    Change Member    member=wife
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$551,234    from=wife

Add a new income transaction with different member
    Open New Transaction View
    Select Income On New Transaction View
    Choose Type On New Transaction View    type=bonus
    Change Member    member=wife
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=bonus    amount=+$551,234    from=wife

Add a new expense with different date
    Open New Transaction View
    Change Date
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$551,234

Add a new income with different date
    Open New Transaction View
    Select Income On New Transaction View
    Change Date
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=wage    amount=+$551,234

Add a new expense with different calculation
    Open New Transaction View
    Input Amount On New Transaction View    amount=23x11
    Click Equal Button
    Number On View Should Be    253
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=diet    amount=-$253

Add a new income with different calculation
    Open New Transaction View
    Select Income On New Transaction View
    Input Amount On New Transaction View    amount=23/23
    Click Equal Button
    Number On View Should Be    1
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=wage    amount=+$1

Watch information with month, 2week, and week
    Wait Until Default View Is Visible
    Switch To Calendar View
    Change View To Week, 2Weeks, Month

Edit a expense transaction on default view
    [setup]    Run Keywords    Open New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Wait Until Default View Is Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=diet    amount=-$56,123
    Edit Transaction Type    newType=gift    type=diet    amount=-$56,123
    Transaction Should Be Visible On Default View    type=gift    amount=-$56,123

Edit a income transaction on default view
    [setup]    Run Keywords    Open New Transaction View
    ...                 AND    Select Income On New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Wait Until Default View Is Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=wage    amount=+$56,123
    Edit Transaction Type    newType=investment    type=wage    amount=+$56,123
    Transaction Should Be Visible On Default View    type=investment    amount=+$56,123

Watch expense analysis
    [setup]    Run Keywords    Open New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=77777
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Wait Until Default View Is Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=diet    amount=-$77,777
    Click Expense Analysis
    Expense Analysis Should Be Visible

Watch income analysis
    [setup]    Run Keywords    Open New Transaction View
    ...                 AND    Select Income On New Transaction View
    ...                 AND    Input Amount On New Transaction View    amount=66666
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Wait Until Default View Is Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=wage    amount=+$66,666
    Click Income Analysis
    Income Analysis Should Be Visible

Add a new book on default view
    Click Element On Page    ${addNewBookButton}
    Wait Until Add New Book View Is Visible
    #FIXME The payment page will open after click add book button

Open wallet view
    Open Wallet View

Open analytics view
    Open Analytics View

Open settings view
    Open Settings View

Change currency from USD to NTD
    [Setup]    Run Keywords    Open Settings View
    Click Account To Edit Page
    Change Currency
    Currency Should Be TWD