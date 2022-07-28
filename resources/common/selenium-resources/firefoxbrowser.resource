*** Settings ***
Library         SeleniumLibrary
Variables       ./web-elements/extract-web-elements.yaml


*** Variables ***
${FIREFOX_BROWSER}      firefox
${firefox_headless}     headlessfirefox


*** Keywords ***
####                                            ####
####  Open local FireFox Brownser Resources     ####
####                                            ####
# KW to open local FireFox Brownser

That local firefox brownser was open
    Open browser                        ${xboxpage.allgmes}   ${firefox_headless}
    Maximize Browser Window
    Wait Until Element Is Visible       ${xboxpage.ctpmenu}
    Title Should Be                     ${xboxpage.cttitle}

Close my current browser
    Close All Browsers