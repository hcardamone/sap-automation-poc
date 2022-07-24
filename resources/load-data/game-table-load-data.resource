

*** Keywords ***

Access the SM30 transaction
    Run Transaction       ${standard.maintaintable}
    Send Vkey    Enter


Access the ZTXGCTG01 table
    SapGuiLibraryExtended.Input Text              ${sapedittableview.tbsch}       ${zsaptransactions.zxboxctgtble}
    Send Vkey    Enter
    SapGuiLibraryExtended.Click Element           ${sapedittableview.shbtn}
    SapGuiLibraryExtended.Click Element           ${sapedittableview.edtBtn}                    
    SapGuiLibraryExtended.Click Element           ${sapedittableview.nwentrie}                   
                       


Get the game data extraction
    ${is_loaddatagamefromjson}      Load JSON From File     ${EXPECTED_RESPONSE}
    ${is_jsonffldgenre}     Get Value From Json        ${is_loaddatagamefromjson}       $..xboxctnt.ggender
    ${is_jsonfldgamer}      Get Value From Json        ${is_loaddatagamefromjson}       $..xboxctnt.gamname
    ${is_regexfldvalue}     Update Value To Json      ${is_loaddatagamefromjson}        $..xboxctnt.gvalue      14,99
    ${is_newjsonfldgamer}      Get Value From Json        ${is_loaddatagamefromjson}       $..xboxctnt.gvalue


Load the game data extraction to ZTXGCTG01 table
    Send Key Property       ${sapzxbxcgttb.fldplayn}        ${xboxgamectg.playOn}  
    Send Key Property       ${sapzxbxcgttb.fldgenre}        ${xboxgamectg.gnrgme} 
    Send Key Property       ${sapzxbxcgttb.fldftres}        ${xboxgamectg.gmfltr} 
    SapGuiLibraryExtended.Input Text              ${sapzxbxcgttb.fldgamer}        ${xboxgamectg.gamename} 
    SapGuiLibraryExtended.Input Text              ${sapzxbxcgttb.fldvalue}        ${xboxgamectg.gamevalue}
    SapGuiLibraryExtended.Input Text              ${sapzxbxcgttb.fldwaers}        ${xboxgamectg.gamecurcy}                
    SapGuiLibraryExtended.Select Checkbox         ${sapzxbxcgttb.fldavble}
    SapGuiLibraryExtended.Click Element           ${sapmain.confirmBtn}
    ${is_datavaluetbar}      SapGuiLibraryExtended.Get Value        ${sapzxbxcgttb.zxbxsbar}
    Log To Console     ${is_datavaluetbar}

Acess the ZXGCTG01 transaction
    Run Transaction             ${zsaptransactions.zxboxalvctlg}
    Send Vkey    Enter
    Send Vkey    F8
    Set Column Width    ${sapzxbxcgtpg.srow}    GAMER   29
    ${row}      SapGuiLibraryExtended.Get Row Count      ${row}   GAMER  GAMER
    ${is_getvaluetrue}      SapGuiLibraryExtended.Get Cell Value           ${sapzxbxcgtpg.srow}
     Run Keyword If     ${row} == 0     Fail    There are no one data register
     FOR     ${index}     IN     ${sapzxbxcgtpg.srow}    Run Keywords
     Run Keyword If     '${is_getvaluetrue}'  ==  '${xboxgamectg.gamename}'    
     ...           Select Table Row     GAMER       ${index}
     ...           And Log To Console       Data was loaded    
     ...           Return Keyword
     END


Get the screenshot evidence
    Take Screenshot     ${TEMPDIR}/game-add.jpg
