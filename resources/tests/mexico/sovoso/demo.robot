*** Settings ***
Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Create a Sales Order by Sovos QA Automation Scenarios Program resource.
...                  - run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

Resource            ../../../../resources/generaltabledisplay.resource
Resource            ../../../../resources/saplogon.resource
Suite Setup         Login in SAP GUI
Force Tags          sapguitests    outbound
Test Teardown       Run Keyword If Test Failed    Take Screenshot
Suite Teardown      Close SAP GUI

*** Test Cases ***

SAP Execution QA Automation - standard
    [Documentation]   Test case - Create, process, send and get return invoice
    ...               standard_doc    create_doc    send_doc    get_return    mockdata
    Open QA Automation Scenarios Program      
    Execute standard billing document scenario
    Get the standard billing document number status bar       
    Get and set number of created standard billing document scenario
    Open MX Outbound Monitor                  
    MEX Monitor SD Fill filtering fields and execute standard scenario  
    Check connection error                    
    Find and select created billing document row to perform actions
    Process selected standard billing document
    Find and select processed standard billing document row                           
    Get the status processed standard billing document scenario
    Exit case test