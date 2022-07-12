*** Settings ***
Library         SeleniumLibrary


*** Variable ***
${FIREFOX_BROWSER}      firefox


*** Keywords ***
####                                            ####
####  Open local FireFox Brownser Resources     ####
####                                            ####
# KW to open local FireFox Brownser

That local firefox brownser was open
    Open Browser       ${XBOX_HOME}   ${FIREFOX_BROWSER}
    Wait Until Element Is Visible    ${XBOX_TOPMENU}
    Title Should Be     ${XBOX_GC_TITLE}

#Close My Browser
    #Process Close
