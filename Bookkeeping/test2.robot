*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/wallet.txt
Resource    ../keywords/common.txt

Suite Setup    Open Account Bank
Suite Teardown    Close Application

*** Test Cases ***
Edit Account Information
    [Tags]    TC-2-01
    [Setup]    Go To Wallet View
    Click Account On Wallet View    default account
    Click Edit Button On Account Detail View
    Edit Account Name    changedAccount
    Account Name Should Be Edited

Edit Transaction Information
    [Tags]    TC-2-02
    [Setup]    Run Keywords    Open New Transaction View
    ...                 AND    Choose Type On New Transaction View    type=pet
    ...                 AND    Input Amount On New Transaction View    amount=56123
    ...                 AND    Click OK Button On New Transaction View
    ...                 AND    Default View Should Be Visible
    ...                 AND    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123
    ...                 AND    Go To Wallet View
    ...                 AND    Click Account On Wallet View    default account
    #TODO Click Transaction    type=pet    amount=-$56,123            refactor
    Edit Transaction Type    newType=gift    type=pet    amount=-$56,123
    Transaction Should Be Visible On Account Detail View    type=gift    amount=-$56,123