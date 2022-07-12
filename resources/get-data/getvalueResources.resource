# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources


*** Settings ***
Library                 SeleniumLibrary
Variables               ./getvalue_variables.py


*** Keywords ***
Get the "game" data information
    #[Arguments]     ${XBOX_GAME_TITLE}
    
    SeleniumLibrary.Click Element   ${XBOX_SEARCH_BAR}
    SeleniumLibrary.Input Text      ${XBOX_SEARCH_BAR}  ${XBOX_GAME_NAME}
    Set Focus To Element            ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element   ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element   ${XBOX_ACT_ADV}
    Set Focus To Element            ${XBOX_SEARCH_BTN}
    SeleniumLibrary.Click Element    ${XBOX_SEARCH_BTN}
    # Set Focus To Element            ${XBOX_GAME_ID}
    # Page Should Contain             ${XBOX_GAME_ID}


After get the "game" data information save on file
    Create File         ./my_files/data_information_${XBOX_GAME_TITLE}.txt     ${XBOX_GAME_VALUE}

# Close My Browser
#     Close Browser
    