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