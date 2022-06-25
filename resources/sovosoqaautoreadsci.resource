### Sovos QA Automation Read SCI Values Program resource ###
## This resource provides actions:
#  * Open Sovos QA Automation Read SCI Values.
#  * Select the execution radio button, fill the scenario fiedl and execute the scenario.
#  * Get the date value External Value 1
#  * Get the created billing document number.

*** Keywords ***

Read sci values standard billing document scenario
    Input Text          ${sovosqardsci.trnscode}     ${sovosoqaautoreadsci.transactioncode}
    Input Text          ${sovosqardsci.svdocnum}     ${sovos_doc_num}
    Input Text          ${sovosqardsci.tbnameft}     ${invoiceline.tgitem}
    Input Text          ${sovosqardsci.fdnameft}     ${invoiceline.flddesc}
    Send Vkey             F8
    Set Explicit Wait    5 seconds


Get qa automation read sci values program value sbar
    ${GuiStatusbar}    Get Value     ${sovosqascn.guistbar}


Get sci tag value column
    ${vartbnameft}       Get Cell Value   ${sovosqardsci.scitagvalue}    row_num=0     col_id=FIELDNAME
    ${varfdnameft}       Get Cell Value   ${sovosqardsci.scitagvalue}    row_num=0     col_id=TABLENAME
    ${varscitagvalue}    Get Cell Value   ${sovosqardsci.scitagvalue}    row_num=0     col_id=VALUE
    Log     Document ${sovos_doc_num} Tab Name: ${vartbnameft} - Field Name: ${varfdnameft} - Tag Vallue: ${varscitagvalue}       WARN


Get sci tag value column more_than_one_qtd
    ${rows}    Get Row Count    ${sovosqardsci.scitagvalue}
    Run Keyword If      '${rows}' == 0    Fail    No values were found available in the grid.
    Set Test Variable      ${isFound}    ${FALSE}
    FOR    ${index}    IN RANGE    ${rows} 
      ${is_gettabname}       Get Cell Value     ${sovosqardsci.scitagvalue}    ${index}    TABLENAME
      ${is_getfieldname}     Get Cell Value     ${sovosqardsci.scitagvalue}    ${index}    FIELDNAME
      ${is_getvaluetab}      Get Cell Value     ${sovosqardsci.scitagvalue}    ${index}    VALUE
      Run Keyword If    '${is_getvaluetab}' != '${None}'    Run Keywords  
      ...               Set Suite Variable    ${VALUE_ROW}    ${index}
      ...               AND    Set Test Variable      ${isFound}    ${TRUE}
      ...               AND    Log     Document ${sovos_doc_num} - Tab Name: ${is_gettabname} - Field Name: ${is_getfieldname} - Tag Value: ${is_getvaluetab}       WARN
    END
    Run Keyword If    '${isFound}' == ${FALSE}    Fail    Event ${expectedEvent} was not found in the selected invoice