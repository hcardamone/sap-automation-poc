[Documentation]     This resource get the web-gamectg-extract/web-gamectg-transform 
...                 resources implementation


*** Keywords ***
Extract the game data information on xbox game catalog title
    Get the game data detail information on xbox game catalog

Transform the game data information
    Get the game data information to create the xml/json file
    
That the SAP NetWeaver application was open
    Login in SAP NetWeaver
    Access the SM30 transaction
    Access the ZTXGCTG01 table

load the game data information
    Get the game data extraction
    Load the game data extraction to ZTXGCTG01 table
    

Access the ZXGCTG01 transaction to take a screenshot
    Acess the ZXGCTG01 transaction
    Get the screenshot evidence

Close the SAP NetWeaver application
    Close SAP NetWeaver

Extract the game data information by screenshot
    Get the game data detail information on img screenshot

That the transform game data extraction was successfully
    Transform the game data extraction to save

