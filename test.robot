*** Settings ***
Documentation    Run on pixel_3a device
Library           AppiumLibrary

# Suite Teardown    Close Application

*** Variables ***
${appium_server}    http://localhost:4723/wd/hub
${packageName} =    com.zotiger.accountbook
${appActivity} =    com.zotiger.accountbook.MainActivity

*** Test cases ***
Test
    Open Account Bank

*** Keywords ***
Open Account Bank
    Open Application    remote_url=${appium_server}    platformName=android    udid=emulator-5554    appPackage=${packageName}    appActivity=${appActivity}