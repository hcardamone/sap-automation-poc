# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

***Variables***
${KEY_ENTER}    ENTER

*** Settings ***
Library                 SeleniumLibrary
Variables               ./getvalue_variables.py


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
    Wait Until Page Contains              Action & adventure    15
    #SeleniumLibrary.Click Element           //*[@id="searchcontainer"]/div/div[1]/form/button
    Execute Javascript                     window.scrollTo(0,559)
    Wait Until Page Contains Element      //a[@data-bi-name='grand theft auto v: premium edition']      60
    Capture Page Screenshot


#After get the "game" data information save on file
    #Create File         ./my_files/data_information_${XBOX_GAME_TITLE}.txt     ${XBOX_GAME_VALUE}

# Close My Browser
#     Close Browser
    