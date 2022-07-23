

*** Keywords ***

Access the SM30 transaction
    SapGuiLibraryExtended.Input Text          ${sapedittableview.tbsch}       ${standard.maintaintable}
    Send Vkey    Enter


Access the ZTXGCTG01 table
    SapGuiLibraryExtended.Input Text          ${sapedittableview.tbsch}       ${zsaptransactions.zxboxctgtble}
    Send Vkey    Enter



Then load the game data information



Get the game data extraction


Load the game data extraction to ZTXGCTG01 table


Acess the ZXGCTG01 transaction to get the screenshot evidence