*** Comments ***
### SAP Logon Reosurce ###
## This is the Suite Setup resource, provides actions:
#    * Open SAP GUI applicaiton


*** Settings ***
Library     ../../customlib/SapGuiLibraryExtended/SapGuiLibraryExtended.py
Resource    sapgui.resource


*** Keywords ***
Login in SAP NetWeaver
    Open SAP NetWeaver application
    Wait Until Keyword Succeeds    10s    2s    SapGuiLibraryExtended.Connect To Session
    SapGuiLibraryExtended.Open Connection    ${SAP_ENV}
    SapGuiLibraryExtended.Input Text    ${saplogon.usr}    ${USER_NAME}
    SapGuiLibraryExtended.Input Password    ${saplogon.pwd}    ${PWD}
    SapGuiLibraryExtended.Input Text    ${saplogon.lng}    ${LANGUAGE}
    SapGuiLibraryExtended.Send Vkey    Enter
    Dismiss Multiple Logon warning dialog if needed
    SapGuiLibraryExtended.Set Explicit Wait    ${EXPLICIT_WAIT}
