*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the img transform data Keywords implementation resources


*** Settings ***
Library         OperatingSystem
Library         Collections
Library         json
Library         JSONLibrary
Library         XML
Library         String
Library         ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


*** Keywords ***
Get the game data information to create the xml/json file
    [Arguments]    @{args}
    ${get_binfile}    Get Binary File    ${ECTDIR}data-gamectg-extract.xml
    Save Xml    ${get_binfile}    ${MOCKDIR}data-gamectg-mock.xml
    Elements Should Match    ${ECTDIR}data-gamectg-extract.xml    ${MOCKDIR}data-gamectg-mock.xml
    ${parse_gmcnt}    Parse XML    ${ECTDIR}data-gamectg-extract.xml
    Save Xml    ${parse_gmcnt}    ${MOCKDIR}data-gamectg-atual.xml
    Elements Should Match    ${ECTDIR}data-gamectg-extract.xml    ${MOCKDIR}data-gamectg-mock.xml
    ${gname_gmcnt}    Get Substring    ${xboxpage.gelmock}    -77    -42
    ${value_gmcnt}    Get Substring    ${xboxpage.gelmock}    92    -3
    ${ggndr_gmcnt}    Get Substring    ${xboxpage.acadelm}    16    -3
    ${json_obj_gm}    Get Binary File    ${ECTDIR}data-gamectg-extract.json
    ${crt_jsn_obj}    Create Binary File    ${TRFDIR}data-gamectg-new.json    ${json_obj_gm}
    ${get_new_jsn}    Get Binary File    ${TRFDIR}data-gamectg-new.json
    &{load_jsn_ob}    Load JSON From File    ${TRFDIR}data-gamectg-new.json
    &{dct_jsn_obj}    Create Dictionary    &{load_jsn_ob}
    ${jsn_obj_upd}    Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.gamname    ${gname_gmcnt}
    ${jsn_obj_upd}    Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.gvalue    ${value_gmcnt}
    ${jsn_obj_upd}    Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.ggender    ${ggndr_gmcnt}
    ${dct_nw_json}    Create Dictionary    &{jsn_obj_upd}
    ${eval_jsn_ob}    Evaluate    json.dumps(&{dct_nw_json})    json
    ${lnth_jsn_ob}    Get Length    ${eval_jsn_ob}
    Log To Console    ${eval_jsn_ob}
    FOR    ${lnth_jsn_ob}    IN    ${eval_jsn_ob}
    ...    ${jsn_obj_upd}    Split String    ${lnth_jsn_ob}    =
    ...    Set To Dictionary    ${dct_nw_json}    ${jsn_obj_upd}
        ${eval_jsn_ob}    Json.Dumps    ${dct_nw_json}
    END
    Create File    ${TRFDIR}data-gamectg-new.json    ${eval_jsn_ob}
    Move File    ${TRFDIR}data-gamectg-new.json    ${MOCKDIR}
    ${rspns_nw_js}    Get Binary File    ${MOCKDIR}data-gamectg-new.json
    ${EXPECTED_RESPONSE}    Get Binary File    ${MOCKDIR}data-gamectg-mock.json
    &{evl_rpns_js}    Evaluate    json.loads('''${rspns_nw_js}''')    json
    &{evl_expc_js}    Evaluate    json.loads('''${EXPECTED_RESPONSE}''')    json
    JSONLibraryExtended.Dictionaries Should Be Equal    ${evl_rpns_js}
    ...    ${evl_expc_js}
    Log Dictionary    ${evl_rpns_js}
    Log Dictionary    ${evl_expc_js}
    Set Global Variable    ${evl_rpns_js}
    RETURN    ${eval_jsn_ob}
