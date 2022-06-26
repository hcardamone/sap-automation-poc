# Welcome to SAP Test Automation Framework

SAP Test Automation is an automated testing framework developed using [Robot Framework](https://robotframework.org/) for QA purposes for process SAP application.

# About
This is a starting guide meant to set the environment ready to run tests and to validate that **all automation developers have the same environment**, making easier to create scenarios, select/process and extract status code in SAP process.  
For further information, there are some helpful links at the end of this readme.

# Requirements and tools

* ## Git SCM:
    * Windows: Get last git [here](https://git-scm.com/download/win). Git Bash is recommended to work from Windows with almost the same features as Git on Linux.
* ## Python 3.9 or higher:
    * Windows: get last Python installer [here](https://www.python.org/downloads/)
* ## SAP GUI Scripting Tracker:
    * This tool allows to get the UI elements IDs from SAP GUI application. Download [here](https://tracker.stschnell.de/).
    * After login in SAP GUI, open the Scripting Tracker and click on Scan, then the tree panel will be filled with all objects found.
    * Expand over the object tree and right click in one element to highlight it in the SAP GUI window.
    * You can also click on Identify arrow button to track the UI element as you move the mouse over it in SAP GUI Window.
* ## AutoIT Library
    * Download the latest release [here](https://github.com/nokia/robotframework-autoitlibrary/releases/latest).
    * Althought the full AutoIT is not required, can be needed for debugging purposes if you get into issues with the above RF library. Download and install [here](https://www.autoitscript.com/site/autoit/downloads/).
# Setup Guide
## Python Virtual Environment
> **Hint**: On Git Bash you can find where Python is located run `which python` or `which python3`. Then you can set your path accordingly the correct Python version.    
1. After cloning the project repository, then create the Python Virtual Environment `env` (can be the name you want)
    ```
    $ cd sap-automation-poc
    $ python -m venv env
    ```
1. Add path setting to activate script
    ```
    $ echo -e "\n# Sets PYTHONPATH var within virtualenv\nexport PYTHONPATH=$(pwd)" >> ./env/Scripts/activate
    ```
1. Activate the Virtual Environment, then you should see the **(env)** prefix in your bash prompt.
    ```
    $ source ./env/Scripts/activate
    (env) user@host:sap-automation-poc $
    ```
> **Hint**: To exit `virtualenv` just type `deactivate`. To close Git Bash window type `exit`.

## AutoIT Library installation
1. Unzip the AutoTI library file you got from [Requirements and tools](#requirements-and-tools) section.
2. Open the Windows Command Prompt as administrator, navigate to that folder and run:
    ```
    python setup.py install
    ```
## SAP Test Automation dependencies
* ### Install Python packages: run this command after cloning the repo:
    ```
    (env) $ pip install -r requirements.txt
    ```
## Visual Studio Code Plugins
VS Code is the recommended IDE, although barely anyone can be used.
These are suggested VS Code plugins that best fit this automation project:
* [Git Lens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) -  great plugin to know instant Git blame info.
* [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) - a must have for all Python developers.
* [Robot Framework Intellisense](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense) - one of the best RF plugins out there.
* [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) - YAML plugin supported by Red Hat, so no further comments.
* [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml) - Plugin with many useful commands to work with XML files.
* [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - Optional but great extension to give a nice touch on file icons.
# Running a Test Suite
1. First make a copy of file `robot_variables_template.py`to your home user folder and remove the `-template` suffix.
2. File `robot_variables` has all initial variables to run RF and you have to change to fit your machine settings as needed, since it won't be commited anyway as each automation developer can have different settings: 
    * `SAP_ENV = "NAME"`          
        SAP test environment to be used. Refer to sovos-environments.yaml file for available environments details.
    * `USER_NAME = "USER"`        
        User name to login in SAP GUI.
    * `USER_PASSWORD = "PASS"`    
        Password to login in SAP GUI. ***IMPORTANT***: It's a security best practice to NEVER commit user password in code repositories.
    * `LANGUAGE = "EN"`           
        SAP GUI language to login. Defaults to English.
    * `PATH_TO_SAPLOGON `         
        Absolute path to `saplogon.exe` executable.
    * `EXPLICIT_WAIT = "n s"`     
        Time in pattern m, s or ms for minutes, milisseconds or seconds, respectively to wait between execution of SAP GUI library keywords.
    * `MULTIPLE_LOGON_ACTION ="option"`     
        To set the behavior when there is another logged session with the same user. Options: `endOthersOption_rdi`: Continue with this logon and end any other logons in system. When ending any existing logons to system, unsaved data is lost. `continueOption_rdi`: Continue with this logon, without ending any other logons in system `terminateOption_rdi`: Terminate this logon. This will cause the test run to fail.
3. (vscode terminal/cm terminal) running like this robot -d ..\..\..\results --variablefile ..\..\..\robot-variables\robot_variables.py .\demo.robot.
4. (Git Bash terminal) running like this robot -d ./resources/results --variablefile ./resources/robot-variables/robot_variables.py ./resources/tests/generaltabledisplay/standard/demo.robot

# Useful Links
- [Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Built In Keywords](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [SAP GUI Library](https://github.com/frankvanderkuur/robotframework-sapguilibrary/)
- [AutoIT library](https://github.com/nokia/robotframework-autoitlibrary)
- [Git Tutorial](https://testautomationu.applitools.com/git-tutorial/)
- [SAP GUI Scripting Documentation](https://help.sap.com/viewer/b47d018c3b9b45e897faf66a6c0885a8/LATEST/en-US/babdf65f4d0a4bd8b40f5ff132cb12fa.html)

# Modules
1. xx resource to running tests.
2. sapgui.resource - SAP Gui Resource to Global Resources.
3. xx Demonstration Test Case resource to open/execute actions.
3. xx resource to open/execute actions.