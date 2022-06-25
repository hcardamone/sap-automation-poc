### SOVOSO MX Outbound Monitor Demonstration Cancel Case reosurce ###
## This resource provides actions:
#  * Select invoice row to perform actions
#  * Cancel selected invoice
#  * Get the canceled status of processed standard billing document

*** Keywords ***

Select specific billing document row to perform cancel actions
    ${rows}    Get Row Count    ${sovosomxid.statusbar}
    Run Keyword If      '${rows}'== 0    Fail    No invoices were found available in the grid.
    FOR    ${index}    IN RANGE    ${rows}
        ${cancel_doc_num}    Get Cell Value    ${sovosomxid.statusbar}    ${index}     VBELN
        Run Keyword If    '${cancel_doc_num}' == '${bildocument.scnmxcan}'    Run Keywords
        ...               Select Table Row    ${sovosomxid.statusbar}    ${index}
        ...               AND    Set Global Variable    ${CANC_CURRENT_ROW}    ${index}
        ...               AND    Set Global Variable    ${cancel_doc_num}
        ...               AND    Return from Keyword  
    END
    Fail    Document ${bildocument.scnmxcan} was not found in document listing

#Cancel selected billing document
Cancel selected specific billing document row to perform actions
    Run Keyword If      '${CANC_CURRENT_ROW}' == 0    Fail    No invoices were found available in the grid.
    FOR    ${index_sovos_doc_num}    IN    ${CANC_CURRENT_ROW}
        Click Toolbar Context Button    table_id=${sovosomxid.statusbar}        button_id=ACTIONS
        Select Context Menu Item    element_id=${sovosomxid.statusbar}          menu_or_button_id=ACTIONS    item_id=ACT__CANCEL
        Send Key Property          ${sovosomxid.rsoncode}    ${key_id.rsncode}
        ${is_rsncode}          Get Value             ${sovosomxid.rsoncode}
        Run Keyword If        '${is_rsncode}' == '${resoncodetxt.rsncd1}'   Run Keywords
        ...                   Input Text      ${sovosomxid.fliosubs}   ${GV_REASON_TEXT}
        ...                   AND       Click Element               ${sapmain.confirmPopup_btn}
        ...                   AND       Log         Folio Substitution ${GV_REASON_TEXT} ${is_rsncode}       WARN                   
        ...                   ELSE      Click Element               ${sapmain.confirmPopup_btn}
    END

Find and select billing document row to cancel
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

# Get the canceled status of processed standard billing document
Get the canceled status processed standard specific billing document scenario
    Click Element       ${sovosomxid.getreturn}
    Click Element       ${sovosomxid.contgret}
    ${statusBarcode}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${CANC_CURRENT_ROW}     col_id=STATUS
    ${statusBardesc}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${CANC_CURRENT_ROW}    col_id=TSTATUS
    Log     Document ${cancel_doc_num} Status: ${statusBarcode} - ${statusBardesc}       WARN

Select billing document row to perform cancel action
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

Cancel selected billing document
    Run Keyword If      '${STD_BILDOC_CURRENT_ROW}' == 0    Fail    No invoices were found available in the grid.
    FOR    ${index_sovos_doc_num}    IN    ${STD_BILDOC_CURRENT_ROW}
      Click Toolbar Context Button    table_id=${sovosomxid.statusbar}        button_id=ACTIONS
      Select Context Menu Item    element_id=${sovosomxid.statusbar}          menu_or_button_id=ACTIONS    item_id=ACT__CANCEL
      Send Key Property          ${sovosomxid.rsoncode}    ${key_id.rsncode}
      ${is_rsncode}          Get Value             ${sovosomxid.rsoncode}
      Run Keyword If        '${is_rsncode}' == '${resoncodetxt.rsncd1}'   Run Keywords
      ...                   Input Text      ${sovosomxid.fliosubs}   ${GV_REASON_TEXT}
      ...                   AND       Click Element               ${sapmain.confirmPopup_btn}
      ...                   AND       Log         Folio Substitution ${GV_REASON_TEXT} ${is_rsncode}       WARN                   
      ...                   ELSE      Click Element               ${sapmain.confirmPopup_btn}
    END

Get the canceled status processed standard billing document scenario
    Click Element       ${sovosomxid.getreturn}
    Click Element       ${sovosomxid.contgret}
    ${statusBarcode}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${STD_BILDOC_CURRENT_ROW}     col_id=STATUS
    ${statusBardesc}    Get Cell Value   table_id=${sovosomxid.statusbar}    row_num=${STD_BILDOC_CURRENT_ROW}    col_id=TSTATUS
    Log     Document ${STD_BILDOC} Status: ${statusBarcode} - ${statusBardesc}       WARN