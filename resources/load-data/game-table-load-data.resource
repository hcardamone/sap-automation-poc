*** Settings ***
Library         JSONLibrary
Library         ScreenCapLibrary
Library         SapGuiLibrary
Library         ../customlib/SapGuiLibraryExtended/SapGuiLibraryExtended.py
Library         ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables       ../input-data/input-data-transactions.yaml
Variables       ../input-data/input-data-xboxctg.yaml
Variables       ../robot-variables/robot_variables.py
Variables       ../common/sapgui-resources/ui-elements/sap-elements.yaml


*** Keywords ***
Access the SM30 transaction
    SapGuiLibraryExtended.Run Transaction    ${standard.maintaintable}
    SapGuiLibrary.Send Vkey    Enter

Access the ZTXGCTG01 table
    SapGuiLibraryExtended.Input Text    ${sapedittableview.tbsch}    ${zsaptransactions.zxboxctgtble}
    SapGuiLibrary.Send Vkey    Enter
    SapGuiLibraryExtended.Click Element    ${sapedittableview.shbtn}
    SapGuiLibraryExtended.Click Element    ${sapedittableview.edtBtn}
    SapGuiLibraryExtended.Click Element    ${sapedittableview.nwentrie}

Get the game data extraction
    ${lod_gme_ext}    JSONLibrary.Load JSON From File    ${EXPECTED_RESPONSE}
    ${get_cnt_gdr}    JSONLibrary.Get Value From Json    ${lod_gme_ext}    $..xboxctnt.ggender
    ${get_cnt_gnm}    JSONLibrary.Get Value From Json    ${lod_gme_ext}    $..xboxctnt.gamname
    ${get_cnt_gvl}    JSONLibrary.Update Value To Json    ${lod_gme_ext}    $..xboxctnt.gvalue    14,99
    ${upd_val_gme}    JSONLibrary.Get Value From Json    ${lod_gme_ext}    $..xboxctnt.gvalue

Load the game data extraction to ZTXGCTG01 table
    SapGuiLibraryExtended.Send Key Property    ${sapzxbxcgttb.fldplayn}    ${xboxgamectg.playOn}
    SapGuiLibraryExtended.Send Key Property    ${sapzxbxcgttb.fldgenre}    ${xboxgamectg.gnrgme}
    SapGuiLibraryExtended.Send Key Property    ${sapzxbxcgttb.fldftres}    ${xboxgamectg.gmfltr}
    SapGuiLibraryExtended.Input Text    ${sapzxbxcgttb.fldgamer}    ${xboxgamectg.gamename}
    SapGuiLibraryExtended.Input Text    ${sapzxbxcgttb.fldvalue}    ${xboxgamectg.gamevalue}
    SapGuiLibraryExtended.Input Text    ${sapzxbxcgttb.fldwaers}    ${xboxgamectg.gamecurcy}
    SapGuiLibraryExtended.Select Checkbox    ${sapzxbxcgttb.fldavble}
    SapGuiLibraryExtended.Click Element    ${sapmain.confirmBtn}
    ${get_val_bar}    SapGuiLibraryExtended.Get Value    ${sapzxbxcgttb.zxbxsbar}
    BuiltIn.Log To Console    ${get_val_bar}

Acess the ZXGCTG01 transaction
    SapGuiLibraryExtended.Run Transaction    ${zsaptransactions.zxboxalvctlg}
    SapGuiLibrary.Send Vkey    Enter
    SapGuiLibrary.Send Vkey    F8
    SapGuiLibraryExtended.Set Column Width    ${sapzxbxcgtpg.srow}    GAMER    29
    ${get_cnt_row}    SapGuiLibraryExtended.Get Row Count    ${sapzxbxcgtpg.srow}
    ${get_val_cel}    SapGuiLibraryExtended.Get Cell Value    ${sapzxbxcgtpg.srow}    4    GAMER
    IF    ${get_cnt_row} == 0    Fail    There are no one data register
    FOR    ${get_cnt_row}    IN    ${sapzxbxcgtpg.srow}    Run Keywords
        IF    '${get_val_cel}' == '${xboxgamectg.gamename}'
            SapGuiLibraryExtended.Select Row    ${sapzxbxcgtpg.srow}    4
        END
    END
    BuiltIn.Log To Console    Data was loaded

Get the screenshot evidence
    ${var_tmp_dirc}    ScreenCapLibrary.Take Screenshot    ${TEMPDIR}\game-add.jpg
    BuiltIn.Log To Console    Screenshot was saved: ${var_tmp_dirc}
