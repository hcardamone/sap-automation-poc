[Documentation]     This resource get the web-gamectg-extract/web-gamectg-transform 
...                 resources implementation


*** Keywords ***
Extract the game data information on xbox game catalog title
    Get the game data detail information on xbox game catalog

Transform the game data information
    Get the game data information to create the xml/json file
    
That the game data information was extract
    Open SAP NetWeaver application

The SAP GUI was open
    Access the SM30 transaction
    Access the ZTXGCTG01 table

Then load the game data information
    Get the game data extraction
    Load the game data extraction to ZTXGCTG01 table
    Acess the ZXGCTG01 transaction to get the screenshot evidence

And close my conection
    Close SAP NetWeaver


#Extract the game data information by screenshot
    #Get the game data detail information on img screenshot

#That the transform game data extraction was successfully
    #Transform the game data extraction to save

