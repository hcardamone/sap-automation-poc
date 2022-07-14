Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Check and validate the game information on Xbox.com
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

*** Settings ***
Library     OCRLibrary
Library     SeleniumLibrary

*** Test Cases ***
KW Exemplo
    Test Get Content Image
        
*** Keywords ***
Test Get Content Image
    ${processed_img}    Read Image    ${IMAGE_PATH}
    #${content}   Get Image Content   ${processed_img}    --psm 12 -c tessedit_char_whitelist=abcdefghijklmnopqrstuvwxyz   eng
    ${content}   Get Image Content   ${processed_img}    --psm 4 -c tessedit_char_whitelist=abcdefghijklmnopqrstuvwxyz   eng
    #${content}   Get Image Content   ${processed_img}    --psm 1 -c tessedit_char_whitelist=abcdefghijklmnopqrstuvwxyz   eng
    #${content}   Get Image Content   ${processed_img}    --psm 6 -c tessedit_char_whitelist=0123456789   eng 