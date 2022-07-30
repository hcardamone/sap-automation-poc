*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the img extract data Keywords implementation resources


*** Settings ***
Library         OCRLibrary
Library         String
Library         ../../resources/customlib/StringExtended/StringExtended.py
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


*** Keywords ***
Get the game data detail information on img screenshot
    ${game_img_prc}    Read Image    ${TESSERACT_IMAGE_PATH}
    ${game_img_cnt}    Get Image Content
    ...    ${game_img_prc} -l ${TESSERACT_MULT_LNG} --psm 1 -c ${TESSERACT_CHAR_WHITLT} ${TESSERACT_CHAR_BLKTLT}
    Set Global Variable    ${game_img_cnt}
