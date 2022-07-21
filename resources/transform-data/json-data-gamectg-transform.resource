# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the img transform data Keywords implementation resources

*** Variables ***
${MOCKDIR}          ../../../../resources/mock/
${ECTDIR}           ../../../../resources/extract-data/
${XMLATGAMENAME}    xpath:/root/gamestore/gamectg/gamename


*** Settings ***
Library         OperatingSystem
Library         JSONLibrary
Library         XML
Library         String
Variables               ../common/selenium-resources/web-elements/extract-web-elements.yaml

***Keywords***

Get the game data variable to create the json file
    ${is_gamenamecontent}       Get Substring               ${xboxpage.gelemnt}     19  54
    #Set XML element attribute value
    ${is_gameparseset}      Parse XML          ${MOCKDIR}data-gamectg-setdata.xml
    ${element}=    Get Element    ${is_gameparseset}    gamename
    Set Element Attribute    ${element}    gamename    ${is_gamenamecontent}
    ${attribute}=    Get Element Attribute    ${element}    gamename
    Log    ${attribute}    # New-Value
    ${is_getelmgm}         Get Element      ${MOCKDIR}data-gamectg-setdata.xml      ${XMLATGAMENAME}     
    ${is_gamenameset}      Set Suite Metadata      ${MOCKDIR}data-gamectg-setdata.xml       ${is_gamenamecontent}    ${XMLATGAMENAME}
    #${is_gamenameset}      Set Element Attribute       ${MOCKDIR}data-gamectg-setdata.xml      ${XMLATGAMENAME}    ${is_gamenamecontent}
    
    ${is_gamexmlset}        Save Xml       ${is_gameparseset}       ${MOCKDIR}data-gamectg-setdata-new.xml  
    ${is_gameparsecontent}      Parse XML          ${ECTDIR}data-gamectg-extract.xml
    ${is_gamexmlcontent}        Save Xml      ${is_gameparsecontent}     ${MOCKDIR}data-gamectg-atual.xml  
    Elements Should Match      ${ECTDIR}data-gamectg-extract.xml     ${MOCKDIR}data-gamectg-old.xml
    #Set Element Text           ${MOCKDIR}data-gamectg-old.xml      
    ${is_gamedatacontent}      Get Binary File      ${ECTDIR}data-gamectg-extract.json
    Create Binary File         ${MOCKDIR}data-gamectg-atual.json     ${is_gamedatacontent}