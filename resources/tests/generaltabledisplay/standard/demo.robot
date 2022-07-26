Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Check and validate the game information on Xbox.com
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

*** Settings ***
Resource            ../../../../resources/common/sapgui-resources/sapgui.resource
Resource            ../../../../resources/common/sapgui-resources/saplogon.resource
Resource            ../../../../resources/common/selenium-resources/firefoxbrowser.resource
Resource            ../../../../resources/load-data/game-table-load-data.resource
Resource            ../../../../resources/bdd-resources/gamectg-BDD.resource
Resource            ../../../../resources/extract-data/web-gamectg-extract.resource
Resource            ../../../../resources/extract-data/img-data-gamectg-extract.resource
Resource            ../../../../resources/transform-data/web-gamectg-transform.resource
Resource            ../../../../resources/transform-data/xml-json-data-gamectg-transform.resource
Variables           ../../../../resources/input-data/input-data-transactions.yaml
Variables           ../../../../resources/input-data/input-data-variables.py
Variables           ../../../../resources/input-data/input-data-xboxctg.yaml

#Suite Setup         Login in SAP NetWeaver       
#Force Tags          validate_game_info    add_val_sapguitests
Test Teardown       Run Keyword If Test Failed    SapGuiLibraryExtended.Take Screenshot
#Suite Teardown      Close SAP NetWeaver

*** Test Cases ***
SAP GUI NetWeaver Automation - Extract data information details
    [Documentation]  Test case - Extract data information details
    [Tags]              extract_transform_game_info
    Given that local firefox brownser was open
    When extract the game data information on xbox game catalog title
    Then close my current browser
    And transform the game data information
    #And extract the game data information by screenshot
    
    
SAP GUI NetWeaver Automation - Transform data information details
    [Documentation]  Test case - Transform data information details
    [Tags]              load_game_info
    Given that the SAP NetWeaver application was open
    When load the game data information
    Then access the ZXGCTG01 transaction to take a screenshot
    And close the SAP NetWeaver application

SAP GUI NetWeaver Automation - Create Category Material and Register Material Z Programs
    [Documentation]   Test case - Create
    [Tags]               add_val_sapguitests
    Open "Categoria Material" Program
    Fill fields and adding category
    Open "Cadastro de Material" Program
    Fill fields and save

#robot --variablefile  ..\..\..\robot-variables\robot_variables.py --variablefile ..\..\..\..\resources\input-data\input-data-variables.py --loglevel TRACE --outputdir ..\..\..\results --include extract_transform_game_info --include load_game_info --exclude add_val_sapguitests .\demo.robot

# robot --variablefile  ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir ..\..\..\results --include extract_transform_game_info --exclude add_val_sapguitests --exclude transform_game_info  .\demo.robot

#robot --variablefile  ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir ..\..\..\results --include transform_game_info --exclude add_val_sapguitests --exclude extract_game_info  .\demo.robot

