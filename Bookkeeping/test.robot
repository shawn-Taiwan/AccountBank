*** Settings ***
Library    AppiumLibrary
Resource    ../keywords/common.txt

Suite Setup    Open Account Bank
Suite Teardown    Close Application

*** Variables ***
${addNewItemButton} =    xpath=//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.widget.ImageView

*** Test cases ***
Add A New Expense Transaction
    Click Element On Page    ${addNewItemButton}    #TODO Wrap L13.14?
    Wait Until Add New Transaction View Is Visible
    Choose Type On New Transaction View    type=pet
    Input Amount On New Transaction View    amount=56123
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=pet    amount=-$56,123

Add A New Income Transaction
    Click Element On Page    ${addNewItemButton}
    Wait Until Add New Transaction View Is Visible
    Select Income On New Transaction View
    Choose Type On New Transaction View    type=parttime job
    Input Amount On New Transaction View    amount=551234
    Click OK Button On New Transaction View
    Wait Until Default View Is Visible
    Transaction Should Be Visible On Default View    type=parttime job    amount=+$551,234