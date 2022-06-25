*** Settings ***
Documentation       SAP GUI Tests - this resource provides some tests, this is a POC project.
...                 This resource provides actions:
...                  - Create a Sales Order by Sovos QA Automation Scenarios Program resource.
...                  - Open the SOVOSO MX Outbound Monitor Demonstration Test Case reosurce.
...                  - Cancel an billing document
...                  - Read SCI Structure
...                  - Download XML SCI 
...                  -  run this resource to test the automation. Obs: check the reame.md # Running a Test Suite session, step 3.

Resource            ../../../../resources/sovosomx.resource
Resource            ../../../../resources/sovosexeqaauto.resource
Resource            ../../../../resources/sovoscancelmx.resource
Resource            ../../../../resources/sovosoqaautoreadsci.resource
Resource            ../../../../resources/saplogon.resource
Suite Setup         Login in SAP GUI
Force Tags          sapguitests    outbound
Test Teardown       Run Keyword If Test Failed    Take Screenshot
Suite Teardown      Close SAP GUI

*** Test Cases ***

Sovos Execution QA Automation Scenarios - standard
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

Sovos Execution QA Automation Scenarios - external_value
    [Documentation]   Test case - Create, process, send invoice and get return
    ...               EXTERNAL_VALUE_1 Date scenario
    ...               standard_doc    create_doc    send_doc    get_return    
    ...               external_value_1_date    mockdata
    Open QA Automation Scenarios Program      
    Execute external_value_1 date scenario
    Get the standard billing document number status bar 
    Get and set number of created standard billing document scenario
    Open MX Outbound Monitor                  
    MEX Monitor SD Fill filtering fileds and execute external_value_1 date scenario  
    Check connection error                    
    Find and select created billing document row to perform actions
    Process selected standard billing document
    Find and select processed standard billing document row
    Get the status processed standard billing document scenario
    Exit case test

Sovos Execution QA Automation Scenarios - read output sci
    [Documentation]   Test case - Create standard billing document and read the sci output
    ...               standard_doc    create_doc    send_doc    read_output_sci   mockdata
    Open QA Automation Scenarios Program
    Execute standard billing document scenario
    Get the standard billing document number status bar       
    Get and set number of created standard billing document scenario
    Open MX Outbound Monitor                  
    MEX Monitor SD Fill filtering fields and execute standard scenario  
    Check connection error                    
    Sovoso Auto Read SCI find and select created billing document row
    Process selected standard billing document
    Sovoso Auto Read SCI get processed sovos document number column
    Open QA Automation Read SCI Values
    Read sci values standard billing document scenario
    Get qa automation read sci values program value sbar
    Get sci tag value column
    Exit case test

Sovos Execution QA Automation Scenarios - read output sci more than one item
    [Documentation]   Test case - Create standard billing document and read the sci output 
    ...               standard_doc    create_doc    send_doc    more_than_one_qtd-item    
    ...               read_output_sci   mockdata
    Open QA Automation Scenarios Program
    Execute standard billing document scenario more_than_one_qtd
    Get the standard billing document number status bar       
    Get and set number of created standard billing document scenario
    Open MX Outbound Monitor                  
    MEX Monitor SD Fill filtering fields and execute standard scenario  
    Check connection error                    
    Sovoso Auto Read SCI find and select created billing document row
    Process selected standard billing document
    Sovoso Auto Read SCI get processed sovos document number column
    Open QA Automation Read SCI Values
    Read sci values standard billing document scenario
    Get qa automation read sci values program value sbar
    Get sci tag value column more_than_one_qtd
    Exit case test

Sovos Execution QA Automation Scenarios - download sci standard billing document
    [Documentation]   Test case - Select billing document to cancel
    ...               standard_doc    create_doc    send_doc   get_return_doc   
    ...               get_sci_dowload_doc    send_docmockdata
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
    Download XML SCI of the created standard billing document
    Exit case test

Sovos Execution QA Automation Scenarios - cancel billing document
    [Documentation]   Test case - Select billing document to cancel
    ...               standard_doc    cancel_created_doc_num   get_return    mockdata
    Open QA Automation Scenarios Program
    Execute standard billing document scenario
    Get the standard billing document number status bar       
    Get and set number of created standard billing document scenario
    Open MX Outbound Monitor                  
    MEX Monitor SD Fill filtering fields and execute standard scenario  
    Check connection error
    Select billing document row to perform cancel action
    Process selected standard billing document
    Get status return standard billing document scenario to cancel
    Find and select billing document row to cancel
    Cancel selected billing document
    Get the canceled status processed standard billing document scenario
    Exit case test

Sovos Execution QA Automation Scenarios - cancel specific billing document
    [Documentation]   Test case - Select billing document to cancel
    ...               standard_doc    cancel_created_doc_num   get_return    mockdata
    Open MX Outbound Monitor
    MEX Monitor SD Fill filtering fields and execute standard scenario
    Check connection error
    Select specific billing document row to perform cancel actions
    Cancel selected specific billing document row to perform actions
    Get the canceled status processed standard specific billing document scenario
    Exit case test
