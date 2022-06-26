*** Settings ***
Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Create a Sales Order by Sovos QA Automation Scenarios Program resource.
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

Resource            ../../../../resources/generaltabledisplay.resource
Resource            ../../../../resources/sapgui.resource
Resource            ../../../../resources/saplogon.resource
Suite Setup         Login in SAP NetWeaver
Force Tags          sapguitests    outbound
Test Teardown       Run Keyword If Test Failed    Take Screenshot
Suite Teardown      Close SAP NetWeaver

*** Test Cases ***

SAP Execution QA Automation - Create Material Z Program
    [Documentation]   Test case - Create
    ...               standard_doc    create_doc    send_doc    get_return    mockdata
    Open "Cadastro de Material" Program