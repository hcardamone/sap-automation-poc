# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the img transform data Keywords implementation resources

*** Variables ***
${MOCKDIR}          ../../../../resources/mock/
${ECTDIR}           ../../../../resources/extract-data/
${TRFDIR}           ../../../../resources/transform-data/
${expected_json}    ../../../../resources/mock/data-gamectg-mock.json


*** Settings ***
Library         OperatingSystem
Library         Collections
Library         json
Library         JSONLibrary
Library         XML
Library         String
Library         ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


***Keywords***

Get the game data variable to create the xml/json file
    [Arguments]    @{args}
    ${is_getbinaryfile}         Get Binary File     ${ECTDIR}data-gamectg-extract.xml
    ${is_savebinaryfile}        Save Xml            ${is_getbinaryfile}     ${MOCKDIR}data-gamectg-mock.xml
    Elements Should Match       ${ECTDIR}data-gamectg-extract.xml           ${MOCKDIR}data-gamectg-mock.xml
    ${is_gameparsecontent}      Parse XML          ${ECTDIR}data-gamectg-extract.xml
    Save Xml                    ${is_gameparsecontent}        ${MOCKDIR}data-gamectg-atual.xml  
    Elements Should Match      ${ECTDIR}data-gamectg-extract.xml            ${MOCKDIR}data-gamectg-mock.xml
    ${is_gamenamecontent}       Get Substring               ${xboxpage.gelemnt}     -77  -42
    ${is_gamevaluecntnt}        Get Substring               ${xboxpage.gelemnt}      92   -3
    ${is_gamegendercntnt}       Get Substring               ${xboxpage.acadelm}      16   -3
    ${is_gamejsonobj}           Get Binary File              ${ECTDIR}data-gamectg-extract.json
    ${is_gamecreatecontent}     Create Binary File           ${TRFDIR}data-gamectg-new.json     ${is_gamejsonobj}
    ${is_tonewcontent}          Get Binary File              ${TRFDIR}data-gamectg-new.json
    &{evaljson}=                Load JSON From File        ${TRFDIR}data-gamectg-new.json
    &{json}                     Create Dictionary         &{evaljson}
    ${is_gamejsonobjupd}        Update Value To Json       ${json}    $..xboxctnt.gamname     ${is_gamenamecontent} 
    ${is_gamejsonobjupd}        Update Value To Json       ${json}    $..xboxctnt.gvalue      ${is_gamevaluecntnt} 
    ${is_gamejsonobjupd}        Update Value To Json       ${json}    $..xboxctnt.ggender     ${is_gamegendercntnt} 
    ${new_json}                 Create Dictionary         &{is_gamejsonobjupd}
    ${req_json}                 Evaluate        json.dumps(&{new_json})                 json
    ${pair}                     Get Length   ${req_json}
    Log To Console        ${req_json}
    FOR     ${pair}    IN     ${req_json}
    ...     ${is_gamejsonobjupd}     Split String    ${pair}    =
    ...     Set To Dictionary    ${new_json}    ${is_gamejsonobjupd}
    ${req_json}    Json.Dumps    ${new_json}
    END
    [Return]    ${req_json}
    Create File         ${TRFDIR}data-gamectg-new.json    ${req_json}
    Move File           ${TRFDIR}data-gamectg-new.json    ${MOCKDIR}
    ${response_json}            Get Binary File        ${MOCKDIR}data-gamectg-new.json
    ${expected_json}            Get Binary File        ${MOCKDIR}data-gamectg-mock.json
    &{eval_response_json}    Evaluate    json.loads('''${response_json}''')   json    
    &{eval_expected_json}    Evaluate    json.loads('''${expected_json}''')   json    
    JSONLibraryExtended.Dictionaries Should Be Equal      ${eval_response_json}
    ...                                                   ${eval_expected_json}
    Log Dictionary    ${eval_response_json}
    Log Dictionary    ${eval_expected_json}