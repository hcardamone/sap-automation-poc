# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     Here are the img transform data Keywords implementation resources

# *** Settings ***
# Library                 String
# Library                 ../../resources/customlib/StringExtended/StringExtended.py
# Variables               ../common/selenium-resources/web-elements/extract-web-elements.yaml

# *** Keywords ***
# Xbox game catalog and img screenshot validate

*** Settings ***
Library    SeleniumLibrary
Library    RobotEyes

*** Keywords ***    
Xbox game catalog and img screenshot validate
# Sample visual regression test case  # Name of the example test case
    # Open Browser    https://www.xbox.com/en-us/games/all-games    firefox
    # Maximize Browser Window
    # Open Eyes    SeleniumLibrary  5     C:\Users\\henri\Documents\SAP\sap-automation-poc\resources\extract-data\selenium-screenshot-1.png
    # Wait Until Element Is Visible    id=lst-ib
    # Capture Full Screen
    # Compare Images
    # Close Browser