
### SAP Gui Resource resource ###
## This resource provide actions:
#   * Open/Close SAP Gui application.

*** Settings ***
Library         ./customlib/SapGuiLibraryExtended.py  screenshot_directory=${OUTPUTDIR}
Library         AutoItLibrary
Library         String
Library         Process
Library         Collections
Variables       ./robot-variables/robot-variables-transactions.yaml
Variables       ./ui-elements/sd-elements.yaml
Variables       ./input-data/input-data-cocd.yaml
Variables       ./environments.yaml

*** Variables ***
${SAPGUIPROCESSID}

*** Keywords ***
####                                      ####
####  Open SAP Gui application Resources  ####
####                                      ####
# KW to Open SAP Gui application
Open SAP GUI application
    ${SAPGUIPROCESSID}    Run   ${PATH_TO_SAPLOGON}
    Set Global Variable    ${SAPGUIPROCESSID}
    Sleep    3s    reason=Waiting the splash screen to disappear

# KW to close SAP Gui application
Close SAP GUI
    Process Close    ${SAPGUIPROCESSID}

# KW to actions about multiple logon warning
Dismiss Multiple Logon warning dialog if needed
    ${is_popupdisplayed}    Run Keyword And Return Status    Element Should Be Present    ${saplogon.multipleLogonWarning_dlg}
    ${dialogTitle}      Run Keyword If      '${is_popupdisplayed}' == '${TRUE}'    Run Keyword
    ...                 Get Window Title    ${saplogon.multipleLogonWarning_dlg}
    Run Keyword If    '${dialogTitle}' == '${saplogon.multipleLogonTitle_dlg}'    Run Keywords
    ...                Select Radio Button    ${saplogon.${MULTIPLE_LOGON_ACTION}}   AND
    ...                Click Element    ${sapmain.confirmPopup_btn}
    ...                ELSE    Return From Keyword


Exit case test
    Run Exit Transaction    ${standard.exittrans}


# KW to actions about copyright popup
Dismiss copyright popup
    ${is_popupdisplayed}    Run Keyword And Return Status    Element Should Be Present    ${sapmain.copyrightPopup}
    Run Keyword If    '${is_popupdisplayed}' == ${TRUE}   Click Element    ${sapmain.confirmPopup_btn}


# KW to check integration connection 
Check connection error
    ${is_popupoffdisplayed}    Run Keyword And Return Status    Element Should Be Present    ${sapmain.connectionoffline_TXT}
    ${connectionoffline_TXT}   Run Keyword If      '${is_popupoffdisplayed}' == '${TRUE}'   Run Keyword    
    ...                        Get Value     ${sapmain.connectionoffline_TXT}
    Run Keyword If            '${connectionoffline_TXT}' !='None'    Run Keywords  
    ...                        Log    ${connectionoffline_TXT}   WARN   AND
    ...                        Click Element    ${sapmain.confirmPopup_btn}
    ...                        ELSE     Log    Connection Successefuly   WARN
    Set Explicit Wait   3 seconds