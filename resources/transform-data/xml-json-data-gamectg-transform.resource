# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the img transform data Keywords implementation resources

*** Variables ***
${MOCKDIR}          ../../../../resources/mock/
${ECTDIR}           ../../../../resources/extract-data/
${TRFDIR}           ../../../../resources/transform-data/
${expected_json}    ../../../../resources/mock/data-gamectg-mock.json


*** Settings ***
Library         OperatingSystem
Library         JSONLibrary
Library         XML
Library         String
Library         ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml

***Keywords***

Get the game data variable to create the xml/json file
    ${is_getbinaryfile}         Get Binary File     ${ECTDIR}data-gamectg-extract.xml
    ${is_savebinaryfile}        Save Xml            ${is_getbinaryfile}     ${MOCKDIR}data-gamectg-mock.xml
    Elements Should Match       ${ECTDIR}data-gamectg-extract.xml           ${MOCKDIR}data-gamectg-mock.xml
    ${is_gameparsecontent}      Parse XML          ${ECTDIR}data-gamectg-extract.xml
    Save Xml                    ${is_gameparsecontent}        ${MOCKDIR}data-gamectg-atual.xml  
    Elements Should Match      ${ECTDIR}data-gamectg-extract.xml            ${MOCKDIR}data-gamectg-old.xml
    
    ${is_gamedatacontent}       Get Binary File              ${ECTDIR}data-gamectg-extract.json
    ${is_gamecreatecontent}     Create Binary File           ${TRFDIR}data-gamectg-atual.json     ${is_gamedatacontent}
    Move File                   ${TRFDIR}data-gamectg-atual.json      ${MOCKDIR}data-gamectg-atual.json
    ${response_json}            Get Binary File        ${MOCKDIR}data-gamectg-atual.json
    ${expected_json}            Get Binary File        ${MOCKDIR}data-gamectg-mock.json
    &{eval_response_json}    Evaluate    json.loads('''${response_json}''')    
    &{eval_expected_json}    Evaluate    json.loads('''${expected_json}''')    
    JSONLibraryExtended.Dictionaries Should Be Equal      ${eval_response_json}
    ...                                                   ${eval_expected_json}
    Log Dictionary    ${eval_response_json}
    Log Dictionary    ${eval_expected_json}