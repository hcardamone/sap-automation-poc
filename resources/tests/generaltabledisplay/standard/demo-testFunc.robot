Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Check and validate the game information on Xbox.com
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

*** Settings ***
Library     OCRLibrary
Library     SeleniumLibrary

*** Variables ***
${img_path}     ../../../../resources/results

*** Test Cases ***
KW Exemplo
    Test Get Content Image
        
*** Keywords ***
Test Get Content Image
    ${img_path}     Capture Page Screenshot
    ${processed_img}    Read Image    ${img_path}
    #${content}   Get Image Content   ${processed_img}    --psm 6 -c tessedit_char_whitelist=0123456789   eng 