*** Comments ***
[Documentation]    GUI Tests - this resource provides some tests, this is a POC project.
...    This resource provides actions:
...    - Check and validate the game information on Xbox.com
...    - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.


*** Settings ***
Resource            ../../../common/sapgui-resources/sapgui.resource
Resource            ../../../common/sapgui-resources/saplogon.resource
Resource            ../../../common/selenium-resources/firefoxbrowser.resource
Resource            ../../../extract-data/web-gamectg-extract.resource
Resource            ../../../load-data/game-table-load-data.resource
Resource            ../../../transform-data/xml-json-data-gamectg-transform.resource

Test Teardown       Run Keyword If Test Failed    SapGuiLibraryExtended.Take Screenshot


*** Test Cases ***
GUI NetWeaver Automation - Extract data information details
    [Documentation]    Test case - Extract data information details
    [Tags]    extract_transform_game_info
    Given that local firefox brownser was open
    When extract the game data information on xbox game catalog title
    Then close my current browser
    And transform the game data information

GUI NetWeaver Automation - Transform data information details
    [Documentation]    Test case - Transform data information details
    [Tags]    load_game_info
    Given that the NetWeaver application was open
    When load the game data information
    Then access the ZXGCTG01 transaction to take a screenshot
    And close the NetWeaver application
