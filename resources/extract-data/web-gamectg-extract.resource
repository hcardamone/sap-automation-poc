*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the web extract data Keywords implementation resources


*** Settings ***
Library         SeleniumLibrary
Library         Screenshot    screenshot_directory${var_ext_dir}
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


*** Variables ***
${var_ext_dir}      C:\\Users\\henri\\Documents\\SAP\\sap-automation-poc\\resources\\extract-data
${sc_sht_name}      selenium-screenshot-1.png


*** Keywords ***
Get the game data detail information on xbox game catalog
    Page Should Contain    ${xboxpage.cttitle}
    Set Focus To Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.acadvid}
    Page Should Contain    ${xboxpage.acaddsp}    30
    Execute Javascript    window.scrollTo(0,559)
    Set Selenium Implicit Wait    ${EXPLICIT_WAIT}
    Set Focus To Element    ${xboxpage.gmimgid}
    Element Should Be Visible    ${xboxpage.gelemnt}
    ${cpt_pg_scre}    SeleniumLibrary.Capture Page screenshot    ${sc_sht_name}
    Move File    ${cpt_pg_scre}    ${var_ext_dir}
