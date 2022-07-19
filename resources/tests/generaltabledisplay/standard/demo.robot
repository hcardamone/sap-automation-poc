Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Check and validate the game information on Xbox.com
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

*** Settings ***
Resource            ../../../../resources/generaltabledisplay.resource
Resource            ../../../../resources/sapgui.resource
Resource            ../../../../resources/saplogon.resource
Resource            ../../../../resources/firefoxbrowser.resource
Resource            ../../../../resources/zcategmaterial.resource    
Resource            ../../../../resources/zcadastromat.resource
Resource            ../../../../resources/bdd-resources/web-gamectg-BDD.resource
Resource            ../../../../resources/extract-data/web-gamectg-extract.resource
Resource            ../../../../resources/transform-data/web-gamectg-transform.resource

#Suite Setup         Login in SAP NetWeaver       
#Force Tags          validate_game_info    add_val_sapguitests
Test Teardown       Run Keyword If Test Failed    Take Screenshot
#Suite Teardown      Close SAP NetWeaver

*** Test Cases ***
SAP GUI NetWeaver Automation - Check external Value
    [Documentation]  Test case - Check
    [Tags]              validate_game_info
    Given that local firefox brownser was open
    When extract the game data information on xbox game catalog title
    Then close my current browser
    When extract the game data information by screenshot
    And transform the game data extraction to save
    #When load the game data information
    #And check the "game" data information by screenshot
    
    

SAP GUI NetWeaver Automation - Create Category Material and Register Material Z Programs
    [Documentation]   Test case - Create
    [Tags]               add_val_sapguitests
    Open "Categoria Material" Program
    Fill fields and adding category
    Open "Cadastro de Material" Program
    Fill fields and save