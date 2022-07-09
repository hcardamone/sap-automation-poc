# Behavior Driven Development (BDD) and Functional Testing
[Documentation]     This resource get the getvalueResources.resource implementation


*** Keywords ***
That xbox page was open
    Open xbox page
    
Search the "game" data information "xbox catalog" title displayed
    Search and get ${XBOX_GAME_TITLE} information
    
Save the "game" data information
    Ater get the ${XBOX_GAME_VALUE} information save on file