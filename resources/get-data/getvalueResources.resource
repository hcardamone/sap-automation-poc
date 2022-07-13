# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Library                 AutoItLibrary
Variables               ./getvalue_variables.py

*** Variables ***
@{WIN1_WIN2}    f8dae41e-1a49-4cbd-abc8-9a07e39630a2 
...             886555b8-2789-4ed4-a162-c0f64e648217

*** Keywords ***
Get the "game" data information    
    Page Should Contain                  ${XBOX_GC_TITLE}
    Set Focus To Element                 ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element        ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element        ${XBOX_ACT_ADV}
    Set Focus To Element                 ${XBOX_SEARCH_BAR}
    #SeleniumLibrary.Click Element        ${XBOX_SEARCH_BAR}
    #SeleniumLibrary.Input Text           ${XBOX_SEARCH_BAR}  ${XBOX_GAME_NAME}
    Set Selenium Implicit Wait            ${EXPLICIT_WAIT}
    Page Should Contain                       Action & adventure    15
    #SeleniumLibrary.Click Element           //*[@id="searchcontainer"]/div/div[1]/form/button                   
    #SeleniumLibrary.Click Image         //img[@src='//store-images.s-microsoft.com/image/apps.8135.66515090704019777.7fa547c1-c211-4229-a4d3-3ceef762e0a4.0bb0ac0a-9d63-4d91-8e53-f2e39a040bcd?w=200']
    SeleniumLibrary.Click Element         //img[@src='//store-images.s-microsoft.com/image/apps.8135.66515090704019777.7fa547c1-c211-4229-a4d3-3ceef762e0a4.0bb0ac0a-9d63-4d91-8e53-f2e39a040bcd?w=200']
    Execute Javascript                     window.scrollTo(0,559)
    Wait Until Element Is Visible        //a[@data-bi-name='grand theft auto v: premium edition']      40
    ${handles}  Get Window Handles                  browser=ALL
    Switch Window   ${handles}[1]
    Set Selenium Implicit Wait            ${EXPLICIT_WAIT}
    Wait Until Element Is Visible         //*[@id="hero-10"]/div/div/h1   
    Execute Javascript                     window.scrollTo(0,31)
    Capture Page Screenshot         


#After get the "game" data information save on file
    #Create File         ./my_files/data_information_${XBOX_GAME_TITLE}.txt     ${XBOX_GAME_VALUE}

Close My Browser
    Close All Browsers
    