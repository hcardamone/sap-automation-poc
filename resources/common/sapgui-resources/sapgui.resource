*** Comments ***
### SAP Gui Resource resource ###
## This resource provide actions:
#    * Open/Close SAP Gui application.


*** Settings ***
Library         ../../customlib/SapGuiLibraryExtended/SapGuiLibraryExtended.py
Library         SapGuiLibrary
Library         AutoItLibrary    TimeOut=30    CaptureScreenOnError=true
Library         String
Library         Process
Library         Collections
Variables       ../../robot-variables/robot_variables.py
Variables       ./environments.yaml
Variables       ./ui-elements/sap-elements.yaml
Variables       ../../input-data/input-data-transactions.yaml


*** Variables ***
${SAPGUIPROCESSID}


*** Keywords ***
####    ####
####    Open SAP NetWeaver AS ABAP 7.52 SP04 Resources    ####
####    ####
# KW to Open SAP NetWeaver application
Open SAP NetWeaver application
    ${SAPGUIPROCESSID}    AutoItLibrary.Run    ${PATH_TO_SAPLOGON}
    Set Global Variable    ${SAPGUIPROCESSID}
    Sleep    3s    reason=Waiting the splash screen to disappear
    Dismiss Multiple Logon warning dialog if needed
    # Wait For Active Window    ${saplogon.windowtitle}${SAPGUI_VERSION}    TimeOut=15

# KW to close SAP Gui application

Close SAP NetWeaver
    SapGuiLibraryExtended.Run Exit Transaction    ${standard.exittrans}

# KW to actions about multiple logon warning

Dismiss Multiple Logon warning dialog if needed
    ${is_popupdisplayed}    Run Keyword And Return Status
    ...    SapGuiLibraryExtended.Element Should Be Present
    ...    ${saplogon.multipleLogonWarning_dlg}
    IF    '${is_popupdisplayed}' == '${TRUE}'
        ${dialogTitle}    Run Keyword    SapGuiLibraryExtended.Get Window Title    ${saplogon.multipleLogonWarning_dlg}
    ELSE
        ${dialogTitle}    Set Variable    ${None}
    END
    IF    '${dialogTitle}' == '${saplogon.multipleLogonTitle_dlg}'
        SapGuiLibraryExtended.Select Radio Button    ${saplogon.${MULTIPLE_LOGON_ACTION}}
        SapGuiLibraryExtended.Click Element    ${sapmain.confirmPopup_btn}
    ELSE
        RETURN
    END
