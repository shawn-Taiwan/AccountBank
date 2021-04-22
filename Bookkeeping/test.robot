*** Settings ***
Library    AppiumLibrary
Resource    ../commonVariable.txt

Suite Setup    Open Account Bank
Suite Teardown    Close Application

*** Variables ***
${addNewItemButton} =    xpath=//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.widget.ImageView

*** Test cases ***
Click add new item button
    Click Elment After It Is Visible    ${addNewItemButton}