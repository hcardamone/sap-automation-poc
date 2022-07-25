# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the web extract data Keywords implementation resources


*** Variables ***
${EXTCTDIR}               C:\\Users\\henri\\Documents\\SAP\\sap-automation-poc\\resources\\extract-data
${screenshotname}                         selenium-screenshot-1.png

*** Settings ***
Library                SeleniumLibrary
Library	               Screenshot	screenshot_directory${EXTCTDIR}
Library                ScreenCapLibrary
Variables              ../common/selenium-resources/web-elements/extract-web-elements.yaml



*** Keywords ***
Get the game data detail information on xbox game catalog    
    Page Should Contain                     ${xboxpage.cttitle}
    Set Focus To Element                    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element           ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element           ${xboxpage.acadvid}
    Page Should Contain                     ${xboxpage.acaddsp}     20
    Execute Javascript                      window.scrollTo(0,559)
    Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    Set Focus To Element                    ${xboxpage.gmimgid}
    #SeleniumLibrary.Click Element           ${xboxpage.gmimgid}
    Element Should Be Visible               ${xboxpage.gelemnt}
    #ScreenCapLibrary.Set Screenshot Directory                ${EXTCTDIR}
    ${IMAGE_PATH}         SeleniumLibrary.Capture Page screenshot   ${screenshotname}
    Move File           ${IMAGE_PATH}     ${EXTCTDIR}
    #Wait Until Element Is Visible           ${XBOX_GAME_ELEMENT}        20
    #${handles}  Get Window Handles          browser=ALL
    #Switch Window   ${handles}[1]
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Wait Until Element Is Visible           ${IS_XBOX_GAME_DISPLAYED}   20
    #Repeat Keyword   4                      Execute Javascript          window.scrollTo(0,208)
    #Set Selenium Implicit Wait              ${EXPLICIT_WAIT}
    #Capture Page Screenshot         