### Sovos QA Automation Scenarios Program resource ###
## This resource provides actions:
#  * Open Sovos QA Automation Scenarios Program.
#  * Select the execution radio button, fill the scenario fiedl and execute the scenario.
#  * Get the date value External Value 1
#  * Get the created billing document number.

*** Keywords ***

# KW to select the execution radio button, fill the scenario fiel and execute EXTERNAL_VALUE_1 date scenario.    
Execute external_value_1 date scenario
    Select Radio Button     ${sovosqascn.slctrb}
    Input Text          ${sovosqascn.execode}         ${SCN_MX.SCNENARIO_NAME}
    Input Text          ${sovosqascn.extvalue_1}     ${SCN_MX.EXTERNAL_VALUE_1}
    Send Vkey             F8
    Set Explicit Wait    5 seconds

# KW to get the standard billing document number of status bar
Get the standard billing document number status bar
    ${GuiStatusbar}    Get Value     ${sovosqascn.guistbar}
    Run Keyword If     '${GuiStatusbar}' == 'Scenario ${SCN_MX.SCNENARIO_NAME} not found'    Run Keyword
    ...                 Fail    'Scenario ${SCN_MX.SCNENARIO_NAME} not found'
    ...                 ELSE    Log    ${GuiStatusbar}   WARN

# KW to select the execution radio button, fill the scenario fiel and execute standard billing document scenario. 
Execute standard billing document scenario
    Select Radio Button     ${sovosqascn.slctrb}
    Input Text              ${sovosqascn.execode}         ${SCN_MX.SCNENARIO_NAME}
    Send Vkey             F8
    Set Explicit Wait    5 seconds

# KW to get the created billing document number.
Get and set number of created standard billing document scenario
    ${STD_BILDOC}  Get Cell Value     ${sovosqascn.logtable}      row_num=2         col_id=DOC_NUMBER_1
    Set Global Variable         ${STD_BILDOC}

# KW to execcute the specifc scenario 
Execute standard billing document scenario more_than_one_qtd
    Select Radio Button     ${sovosqascn.slctrb}
    Input Text              ${sovosqascn.execode}         ${MXSD_6001_04.SCNENARIO_NAME}
    Send Vkey             F8
    Set Explicit Wait    5 seconds