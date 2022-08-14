*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the web transform data Keywords implementation resources


*** Settings ***
Library         String
Library         Collections
Library         ../resources/customlib/StringExtended/StringExtended.py

Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


*** Keywords ***
Transform the game data extraction to save
    ${get_game_rgx}    String.Get Regexp Matches   ${game_img_cnt}    ${xboxctnt.gamname}
    ${xboxctnt.gamname}    Catenate    SEPARATOR=${EMPTY}    ${get_game_rgx}
    @{spt_game_ctt}    StringExtended.Split List Custom   ${xboxctnt.gamname} 10
    ${lst_game_cnt}    StringExtended.Get Line Count Custom    ${spt_game_ctt}
    ${is_convert_list}    Convert To List    ${spt_game_ctt}

    FOR    ${index}    IN    ${is_convert_list}
        ${get_lst_bgn}    Collections.Get Slice From List    ${is_convert_list}    2    7
        ${get_lst_mdw}    Collections.Get Slice From List    ${is_convert_list}    7    11
        ${get_lst_fnl}    Collections.Get Slice From List    ${is_convert_list}    -6    -2
        ${join_wd_bgn}    Evaluate    "".join(${get_lst_bgn})
        ${join_wd_mdw}    Evaluate    "".join(${get_lst_mdw})
        ${join_wd_fnl}    Evaluate    "".join(${get_lst_fnl})
        ${ctn_wd_spce}    Catenate Custom    SEPARATOR=${EMPTY}
        ...    ${join_wd_mdw}    ${join_wd_bgn}
        ...    ${join_wd_fnl}
        Set Global Variable    ${ctn_wd_spce}
    END
