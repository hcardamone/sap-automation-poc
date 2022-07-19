# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the transform data Keywords implementation resources

*** Settings ***
Library                 OCRLibrary
Library                 String
Library                 ../../resources/customlib/StringExtended/StringExtended.py
Variables               ../web-elements/extract-web-elements.yaml

*** Keywords ***
Get the game extraction file to match with the game data input      
    ${is_XBOX_GAME_MATCH}   Get Regexp Matches      ${IMG_CONTENT}  ${xboxctnt.gamname}
    ${xboxctnt.gamname}    Catenate    SEPARATOR=${EMPTY}    ${is_XBOX_GAME_MATCH}
    @{is_STRING_SPLIT}    Split List Custom     ${xboxctnt.gamname}  10
    ${is_STRING_LIST}     Get Line Count Custom   ${is_STRING_SPLIT}
    ${is_convert_list}    Convert To List     ${is_STRING_SPLIT}
    FOR     ${index}    IN    ${is_convert_list}
        ${is_LIST_INICIO}    Get Slice From List     ${is_convert_list}  2  7
        ${is_LIST_MEIO}    Get Slice From List     ${is_convert_list}  7  11
        ${is_LIST_FINAL}    Get Slice From List     ${is_convert_list}  -6  -2
        ${is_JOINWORDS_INC}     Evaluate       "".join(${is_LIST_INICIO})
        ${is_JOINWORDS_MEO}     Evaluate       "".join(${is_LIST_MEIO}) 
        ${is_JOINWORDS_FIN}     Evaluate       "".join(${is_LIST_FINAL})
        ${is_SPACE_BTW_JOINWRDS}       Catenate Custom    SEPARATOR=${EMPTY}   ${is_JOINWORDS_INC}   ${is_JOINWORDS_MEO}   ${is_JOINWORDS_FIN}
        Set Global Variable     ${is_SPACE_BTW_JOINWRDS}
        
    END