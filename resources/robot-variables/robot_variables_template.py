SAP_ENV = "ENVNAME"
SAPGUI_VERSION = "7XX"
MANDANTE = 'CLIENTNUM'
USER_NAME = "USR"
PWD = "********"
LANGUAGE = "EN"
PATH_TO_SAPLOGON = "C:\Program Files (x86)\SAP\FrontEnd\sapgui\saplogon.exe"
MULTIPLE_LOGON_ACTION = "endOthersOption_rdi"    # Options: 
# #                                                endOthersOption_rdi: Continue with this logon and end any other logons in system. 
# #                                                                     When ending any existing logons to system, unsaved data is lost. 
# #                                                continueOption_rdi:  Continue with this logon, without ending any other logons in system
# #                                                terminateOption_rdi: Terminate this logon. This will cause the test run to fail.
EXPLICIT_WAIT = "0 seconds"
MOCKDIR           =     '../mock/'
ECTDIR            =     '../extract-data/'
TRFDIR            =     '../transform-data/'
EXPECTED_RESPONSE =     '../mock/data-gamectg-mock.json'