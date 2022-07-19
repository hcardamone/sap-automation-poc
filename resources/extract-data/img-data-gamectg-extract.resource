# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the img extract data Keywords implementation resources

*** Settings ***
Library                 OCRLibrary
Library                 String
Library                 ../../resources/customlib/StringExtended/StringExtended.py
Variables               ../common/selenium-resources/web-elements/extract-web-elements.yaml

*** Keywords ***
Get the game data detail information on img screenshot
    ${IMG_PROCESSED}    Read Image    ${TESSERACT_IMAGE_PATH}
    ${IMG_CONTENT}   Get Image Content   ${IMG_PROCESSED}  -l ${TESSERACT_MULT_LNG} --psm 1 -c ${TESSERACT_CHAR_WHITLT} ${TESSERACT_CHAR_BLKTLT}
    Set Global Variable     ${IMG_CONTENT}