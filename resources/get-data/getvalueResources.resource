# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Variables               ./getvalue_variables.py

*** Keywords ***
Validate the "game" data information    
    Page Should Contain                     ${XBOX_GC_TITLE}
    Set Focus To Element                    ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element           ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element           ${XBOX_ACT_ADV}
    Page Should Contain                     ${IS_XBOX_GEN_DISPLAYED}    10
    Execute Javascript                      window.scrollTo(0,559)
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    SeleniumLibrary.Click Element           ${XBOX_GAME_ID}
    Capture Page Screenshot
    Wait Until Element Is Visible           ${XBOX_GAME_ELEMENT}        15
    ${handles}  Get Window Handles          browser=ALL
    Switch Window   ${handles}[1]
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    Wait Until Element Is Visible           ${IS_XBOX_GAME_DISPLAYED}
    Repeat Keyword   4                      Execute Javascript          window.scrollTo(0,208)
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    Capture Page Screenshot         


#After get the "game" data information save on file
    #Create File         ./my_files/data_information_${XBOX_GAME_TITLE}.txt     ${XBOX_GAME_VALUE}

Close My Browser
    Close All Browsers
    