# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Library                 OperatingSystem
Variables               ./getvalue_variables.yaml

*** Variables ***
{FIREFOX_BROWSER}       firefox


*** Keywords ***
Open xbox page
    Go To               ${XBOX_HOME}    {FIREFOX_BROWSER}
    Wait Until Element Is Visible    ${XBOX_TOPMENU}
    Title Should Be     ${XBOX_GC_TITLE}


Search and get ${XBOX_GAME_TITLE} information
    [Arguments]         ${XBOX_GAME_TITLE}
    Page Should Contain ${XBOX_GAME_TITLE}
    ${XBOX_GAME_VALUE}      Get Value         ${XBOX_GAME_TITLE}  
    Log                 ${XBOX_GAME_VALUE} 


Ater get the ${XBOX_GAME_VALUE} information save on file
    Create File         ./my_files/data_information_${XBOX_GAME_TITLE}.txt     ${XBOX_GAME_VALUE}


Close My Browser
    Close Browser