### SOVOSO MX Outbound Monitor Demonstration Test Case reosurce ###
## This resource provides actions:
#  * Open/Execute the SOVOSO MX Outbound Monitor.
#  * Select and process the document created by Sovos QA Automation Scenarios Program resource.
#  * Get the status code of the Cloud on the STATUS collumn.

*** Keywords ***

# KW to fill the fields of Sovos MX Outbound Monitor and execute external_value_1 date scenario.
MEX Monitor SD Fill filtering fileds and execute external_value_1 date scenario
    Input Text            ${sovosomxid.cocd}     ${cocdmx.mxndfa}
    Send Vkey             Enter
    Input Text            ${sovosomxid.dtlw}    ${SCN_MX.EXTERNAL_VALUE_1}
    Input Text            ${sovosomxid.dtht}    ${SCN_MX.EXTERNAL_VALUE_1}    
    Send Vkey             F8
    Sleep    2 s    reason=Waiting transaction to be executed properly

# KW to fill the fields of Sovos MX Outbound Monitor and execute.
MEX Monitor SD Fill filtering fields and execute standard scenario
    Input Text            ${sovosomxid.cocd}     ${cocdmx.mxndfa}
    Send Vkey             Enter
    Input Text            ${sovosomxid.dtlw}    ${DATE_VALUE_LOW}
    Input Text            ${sovosomxid.dtht}    ${DATE_VALUE_HIGH}
    Send Vkey             F8
    Sleep    2 s    reason=Waiting transaction to be executed properly