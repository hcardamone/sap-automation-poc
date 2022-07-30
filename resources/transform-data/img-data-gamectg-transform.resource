*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the img transform data Keywords implementation resources


*** Settings ***
Library         SeleniumLibrary
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml


*** Keywords ***
Xbox game catalog and img screenshot validate
    Open Eyes    none
    Maximize Browser Window
    Page Should Contain    ${xboxpage.cttitle}
    Set Focus To Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.acadvid}
    Page Should Contain    ${xboxpage.acaddsp}    20
    Execute Javascript    window.scrollTo(0,559)
    Set Selenium Implicit Wait    ${EXPLICIT_WAIT}
    Set Focus To Element    ${xboxpage.gmimgid}
    #Capture Full Screen    tolerance=5    name=homepage
    Capture Page Screenshot
    Compare Images
    #RobotEyes.Compare Two Images    selenium-screenshot-1.png    selenium-screenshot-20.png    diffimage.png    tolerance=10
    SeleniumLibrary.Click Element    ${xboxpage.gmimgid}

#    robot --variablefile    ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir ..\..\..\results --include transform_game_info --exclude add_val_sapguitests --exclude extract_game_info    -v images_dir:..\..\..\extract-data -v actual_dir:..\..\..\mock .\demo.robot
