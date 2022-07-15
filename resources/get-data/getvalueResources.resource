# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Library                 OCRLibrary
Library                 String
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
    ${is_XBOX_GAME_SBS}     Get Substring       ${is_XBOX_GAME_NAME}    0 
    #${is_Split_String}	        Split String    ${is_XBOX_GAME_SBS} 	,${SPACE}   2