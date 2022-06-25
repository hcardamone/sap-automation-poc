
### SAP Gui Resource resource ###
## This resource provide actions:
#   * Open/Close SAP Gui application.
#   * Check Connection between SAP X Cloud.
#   * Get billing document status bar from SOVOSO QA Automation Scenarios Program resource
#   * Find and Select the document created from sovosexeqaauto resource on the MX SD Monitor resource.
#   * Find and Select the processed document on the MX SD Monitor resource.

*** Settings ***
Library         ./customlib/SapGuiLibraryExtended.py  screenshot_directory=${OUTPUTDIR}
Library         AutoItLibrary
Library         String
Library         Process
Library         Collections
Variables       ./robot-variables/robot-variables-transactions.yaml
Variables       ./ui-elements/sd-elements.yaml
Variables       ./input-data/input-data-cocd.yaml
Variables       ./input-data/input-data-canc-mx.yaml
Variables       ./input-data/input-data-sovosomx.yaml
Variables       ./input-data/input-data-sovosoqaautoreadsci.yaml
Variables       ./input-dictionary/input-dict-sci.yaml
Variables       ./input-dictionary/intput-dict-scenario.yaml

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


####                                      ####
####  Mexico SD Monitor Resources  ####
####                                      ####

# KW to open SOVOSO MX Outbound Monitor.
Open MX Outbound Monitor
    Run Transaction        ${sovosomx.monitorsd}


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

####                                               ####
####  Standard billing document actions Resources  ####
####                                               ####

# KW to find and selected the document that will created by sovosexeqaautomation
Find and select created billing document row to perform actions
    ${rows}    Get Row Count    ${sovosomxid.srow}
    Run Keyword If      '${rows}'== 0    Fail    No invoices were found available in the grid.
    FOR    ${index}    IN RANGE    ${rows}
        ${created_doc_num}    Get Cell Value    ${sovosomxid.srow}    ${index}     VBELN
        Run Keyword If    '${created_doc_num}' == '${STD_BILDOC}'    Run Keywords
        ...               Select Table Row    ${sovosomxid.srow}    ${index}
        ...               AND    Set Suite Variable    ${STD_BILDOC_CURRENT_ROW}    ${index}
        ...               AND    Return from Keyword  
    END
    Fail    Document ${STD_BILDOC} was not found in document listing

# KW to process selected billing document by sovosexeqaautomation
Process selected standard billing document
    Click Toolbar Context Button    table_id=${sovosomxid.actn}        button_id=ACTIONS
    Select Context Menu Item    element_id=${sovosomxid.actn}          menu_or_button_id=ACTIONS    item_id=ACT__SEND

# KW to find and select the processed document by sovosexeqaautomation
Find and select processed standard billing document row  
    ${rows}    Get Row Count    ${sovosomxid.statusbar}
    Run Keyword If      '${rows}' == 0    Fail    No invoices were found available in the grid.
    FOR    ${index}    IN RANGE    ${rows}
        ${stdprocessed_doc_num}    Get Cell Value    ${sovosomxid.statusbar}    ${index}     VBELN
        Run Keyword If    '${stdprocessed_doc_num}' == '${STD_BILDOC}'    Run Keywords
        ...               Select Table Row    ${sovosomxid.statusbar}    ${index}
        ...               AND    Set Suite Variable   ${STD_BILDOC_CURRENT_ROW}     ${index}
        ...               AND    Return from Keyword  
    END
    Fail    Document ${STD_BILDOC} was not found in document listing

Get status return standard billing document scenario to cancel
    Click Element       ${sovosomxid.getreturn}
    Click Element       ${sovosomxid.contgret}

# KW to get the processed status of the standard billing document by sovosexeqaautomation
Get the status processed standard billing document scenario
    Click Element       ${sovosomxid.getreturn}
    Click Element       ${sovosomxid.contgret}
    ${statusBarcode}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${STD_BILDOC_CURRENT_ROW}     col_id=STATUS
    ${statusBardesc}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${STD_BILDOC_CURRENT_ROW}    col_id=TSTATUS
    Log     Document ${STD_BILDOC} Status: ${statusBarcode} - ${statusBardesc}       WARN


Download XML SCI of the created standard billing document 
    FOR    ${index_download_docnum}    IN     ${STD_BILDOC_CURRENT_ROW}
      Select Table Row    ${sovosomxid.statusbar}    ${index_download_docnum}
      Click Toolbar Context Button    table_id=${sovosomxid.statusbar}        button_id=ACTIONS
      Select Context Menu Item    element_id=${sovosomxid.statusbar}           menu_or_button_id=ACTIONS    item_id=ACT__SSCI
      Click Element       ${sovosomxid.downloadsci}
      Input Text          ${sovosomxid.downloadpath}    ${downloadsci.path} 
      SendVKey    Enter   
      SendVKey    Enter  
      Set explicit wait      15
      Log    ${STD_BILDOC} XML SCI document was download on ${downloadsci.path}       WARN
    END


####                                      ####
####  Read SCI actions Resources  ####
####                                      ####

# KW Sovoso Auto Read SCI find and select the created billing document number by sovosexeqaautomation
Sovoso Auto Read SCI find and select created billing document row  
    ${rows}    Get Row Count    ${sovosomxid.srow}
    Run Keyword If      '${rows}'== 0    Fail    No invoices were found available in the grid.
    FOR    ${index}    IN RANGE    ${rows}
        ${readsci_doc_num}    Get Cell Value    ${sovosomxid.srow}    ${index}     VBELN
        Run Keyword If    '${readsci_doc_num}' == '${STD_BILDOC}'    Run Keywords
        ...               Select Table Row    ${sovosomxid.srow}    ${index}
        ...               AND    Set Suite Variable    ${READSCI_CURRENT_ROW}    ${index}
        ...               AND    Return from Keyword  
    END
    Fail    Document ${STD_BILDOC} was not found in document listing

# KW Sovoso Auto Read SCI find and select the processed document    
Sovoso Auto Read SCI get processed sovos document number column
    ${rows}    Get Row Count    ${sovosomxid.statusbar}
    Run Keyword If      '${rows}'== 0    Fail    No invoices were found available in the grid.
    FOR    ${index}    IN RANGE    ${rows}
        ${sovos_doc_num}   Get Cell Value     ${sovosomxid.statusbar}    ${index}     DOCNUM
        ${readsci_doc_num}    Get Cell Value    ${sovosomxid.statusbar}    ${index}     VBELN
        Run Keyword If    '${readsci_doc_num}' == '${STD_BILDOC}'    Run Keywords
        ...               Select Table Row    ${sovosomxid.statusbar}    ${index}
        ...               AND    Log    Sovos Document Number ${sovos_doc_num}   WARN
        ...               AND    Set Global Variable   ${sovos_doc_num}
        ...               AND    Return from Keyword  
    END

####                                                   ####
####  Sovos QA Automation Scenarios Program Resources  ####
####                                                   ####
# KW to open Sovos QA Automation Scenarios Program.
Open QA Automation Scenarios Program  
    Run Transaction   ${sovosz.exescenarios}

####                                                   ####
####  Sovos QA Automation Read SCI Values Program Resources  ####
####                                                   ####
# KW to open Sovos QA Automation Read SCI Values Program.
Open QA Automation Read SCI Values 
    Run Transaction   ${sovosz.qaautoreadsci}