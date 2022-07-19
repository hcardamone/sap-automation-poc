# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the Keywords implementation resources

*** Settings ***
Library                 SeleniumLibrary
Library                 OCRLibrary
Library                 String
Library                 ../../resources/customlib/StringExtended/StringExtended.py
Variables               ../web-elements/extract-web-elements.yaml


*** Keywords ***
Get the game data detail information on xbox game catalog    
    Page Should Contain                     ${xboxpage.cttitle}
    Set Focus To Element                    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element           ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element           ${xboxpage.acadvid}
    Page Should Contain                     ${xboxpage.acaddsp}     20
    Execute Javascript                      window.scrollTo(0,559)
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    Set Focus To Element                    ${xboxpage.gmimgid}
    SeleniumLibrary.Click Element           ${xboxpage.gmimgid}
    Capture Page Screenshot
    #Wait Until Element Is Visible           ${XBOX_GAME_ELEMENT}        20
    #${handles}  Get Window Handles          browser=ALL
    #Switch Window   ${handles}[1]
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Wait Until Element Is Visible           ${IS_XBOX_GAME_DISPLAYED}   20
    #Repeat Keyword   4                      Execute Javascript          window.scrollTo(0,208)
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Capture Page Screenshot         


Extract the game data detail information on img screenshot
    ${IMG_PROCESSED}    Read Image    ${TESSERACT_IMAGE_PATH}
    ${IMG_CONTENT}   Get Image Content   ${IMG_PROCESSED}  -l ${TESSERACT_MULT_LNG} --psm 1 -c ${TESSERACT_CHAR_WHITLT} ${TESSERACT_CHAR_BLKTLT}
    Set Global Variable     ${IMG_CONTENT}