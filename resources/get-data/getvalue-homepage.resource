[Documentation]     Behavior Driven Development (BDD) and Functional Testing



*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***


*** Keywords ***
Given Xbox home page  
    Go To               ${HOME_URL}
    Wait Until Element Is Visible    ${HOME_TOPMENU}
    Title Should Be     ${HOME_TITLE}

When found the game


Then get the data information