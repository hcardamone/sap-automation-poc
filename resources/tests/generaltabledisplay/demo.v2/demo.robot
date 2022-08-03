*** Comments ***
Documentation    This resource provides some tests, this is a POC project.
...    This resource provides actions:
...    - Check and validate the game information on Xbox.com
...    - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.


*** Settings ***
Resource            ../../../../resources/bdd-resources/gamectg-BDD.resource
Resource            ../../../../resources/extract-data/web-gamectg-extract.resource
Resource            ../../../../resources/extract-data/img-data-gamectg-extract.resource
Resource            ../../../../resources/transform-data/web-gamectg-transform.resource
Resource            ../../../../resources/transform-data/xml-json-data-gamectg-transform.resource
Variables           ../../../../resources/input-data/input-data-variables.py
Variables           ../../../../resources/input-data/input-data-xboxctg.yaml

*** Test Cases ***
SAP GUI NetWeaver Automation - Extract data information details
    [Documentation]    Test case - Extract data information details
    [Tags]    extract_transform_game_info
    Given that local firefox brownser was open
    When extract the game data information on xbox game catalog title
    Then close my current browser
    And transform the game data information