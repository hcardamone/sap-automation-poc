If Not IsObject(application) Then
   Set SapGuiAuto  = GetObject("SAPGUI")
   Set application = SapGuiAuto.GetScriptingEngine
End If
If Not IsObject(connection) Then
   Set connection = application.Children(0)
End If
If Not IsObject(session) Then
   Set session    = connection.Children(0)
End If
If IsObject(WScript) Then
   WScript.ConnectObject session,     "on"
   WScript.ConnectObject application, "on"
End If
session.findById("wnd[0]").maximize
session.findById("wnd[0]/tbar[0]/okcd").text = "/nSM30"
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/usr/ctxtVIEWNAME").text = "ZTXGCTG01"
session.findById("wnd[0]/usr/ctxtVIEWNAME").caretPosition = 9
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/usr/btnSHOW_PUSH").press
session.findById("wnd[0]/tbar[1]/btn[25]").press
session.findById("wnd[0]/tbar[1]/btn[5]").press
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/chkZTXGCTG01-AVBLE[6,0]").selected = true
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/cmbZTXGCTG01-PLAYN[0,0]").key = "Xbox"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/cmbZTXGCTG01-GENRE[1,0]").key = "Act & Adv"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/cmbZTXGCTG01-FTRES[2,0]").key = "Oln multip"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-GAMER[3,0]").text = "Grand Theft Auto V: Premium Edition"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-VALUE[4,0]").text = "14.99"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-WAERS[5,0]").text = "USR"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/chkZTXGCTG01-AVBLE[6,0]").setFocus
session.findById("wnd[0]/tbar[0]/btn[11]").press
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-VALUE[4,0]").text = "14,99"
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-GAMER[3,0]").text = "Grand Thefh Auto V: Premium Edition"
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-GAMER[3,0]").setFocus
session.findById("wnd[0]/usr/tblSAPLZTXGCTG01TCTRL_ZTXGCTG01/txtZTXGCTG01-GAMER[3,0]").caretPosition = 11
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/tbar[0]/btn[11]").press
