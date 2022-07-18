# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Library                 OCRLibrary
Library                 String
Library                 ../../resources/customlib/StringExtended/StringExtended.py
Variables               ./getvalue_variables.py

*** Keywords ***
Get the game data information    
    Page Should Contain                     ${XBOX_GC_TITLE}
    Set Focus To Element                    ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element           ${XBOX_GENRE_FTR}
    SeleniumLibrary.Click Element           ${XBOX_ACT_ADV}
    Page Should Contain                     ${IS_XBOX_GEN_DISPLAYED}    20
    Execute Javascript                      window.scrollTo(0,559)
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    Set Focus To Element                    ${XBOX_GAME_ID}
    SeleniumLibrary.Click Element           ${XBOX_GAME_ID}
    Capture Page Screenshot
    #Wait Until Element Is Visible           ${XBOX_GAME_ELEMENT}        20
    #${handles}  Get Window Handles          browser=ALL
    #Switch Window   ${handles}[1]
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Wait Until Element Is Visible           ${IS_XBOX_GAME_DISPLAYED}   20
    #Repeat Keyword   4                      Execute Javascript          window.scrollTo(0,208)
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Capture Page Screenshot         


Read and extract the game data information
    ${IMG_PROCESSED}    Read Image    ${TESSERACT_IMAGE_PATH}
    ${IMG_CONTENT}   Get Image Content   ${IMG_PROCESSED}  -l ${TESSERACT_MULT_LNG} --psm 1 -c ${TESSERACT_CHAR_WHITLT} ${TESSERACT_CHAR_BLKTLT}
    Set Global Variable     ${IMG_CONTENT}
    Log To Console          ${IMG_CONTENT}

Get the game extraction file to match with the game data input      
    ${is_XBOX_GAME_MATCH}   Get Regexp Matches      ${IMG_CONTENT}  ${XBOX_GAME_NAME}
    Log To Console      ${is_XBOX_GAME_MATCH}
    ${is_XBOX_GAME_NAME}    Catenate    SEPARATOR=${EMPTY}    ${is_XBOX_GAME_MATCH}
    @{is_STRING_SPLIT}    Split List Custom     ${is_XBOX_GAME_NAME}  10
    #Remove List Using Regexp      ${is_STRING_SPLIT}
    Log To Console     ${is_STRING_SPLIT}
    ${is_STRING_LIST}     Get Line Count Custom   ${is_STRING_SPLIT}
    ${is_convert_list}    Convert To List     ${is_STRING_SPLIT}
    FOR     ${index}    IN    ${is_convert_list}
        ${is_LIST_INICIO}    Get Slice From List     ${is_convert_list}  2  7
        Log To Console    ${is_LIST_INICIO}
        ${is_LIST_MEIO}    Get Slice From List     ${is_convert_list}  7  11
        Log To Console    ${is_LIST_MEIO}
        ${is_LIST_FINAL}    Get Slice From List     ${is_convert_list}  -6  -2
        Log To Console    ${is_LIST_FINAL}
        ${is_converted_string_inc}      Convert To String       ${is_LIST_INICIO}
        ${is_removed_s_inc}     Remove String      ${is_converted_string_inc}    \s' '  ,
        Catenate        ${is_removed_s_inc} 
    END