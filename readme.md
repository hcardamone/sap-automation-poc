# Welcome to SAP Test Automation Framework

SAP Test Automation is an automated testing framework developed using [Robot Framework](https://robotframework.org/) for QA purposes for process SAP application.

# About
This is a starting guide meant to set the environment ready to run tests and to validate that **all automation developers have the same environment**, making easier to create scenarios, select/process and extract status code in SAP process.
>  This POC was running on the Minisap LICENSE NPL SAP NetWeaver 7.52 (Sybase ASE) to VM Ubuntu.
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

* ## API SAP GUI Scripiting (Optional)
    * Enabling `SAP GUI Scripting` on the server side,
      Launch the `saplogon.exe`, login to the SAP server using your credentials. The SAP Easy Access window appears.
    > **Hint**: To enable this, selecting this option when starting setup install to SAP products to this module working as well
    * Execute the `RZ11` transaction. Specify `sapgui/user_scripting` parameter name and press Enter on keyboard or Display in SAP interface.
    * In the View Profile Parameter Attributes window, click the `Change Value` button on the toolbar and set the New value of sapgui/user_scripting to `TRUE`. `Save Changes`.
    * `Sign out` of the session and `sign in again` to see the change as it is not applied to running sessions.
    <!-- fonte: https://docs.uipath.com/studio/lang-pt_BR/v2018.4/docs/enabling-sap-gui-scripting -->

* ## AutoIT Library
    * Download the latest release [here](https://github.com/nokia/robotframework-autoitlibrary/releases/latest).
    * Althought the full AutoIT is not required, can be needed for debugging purposes if you get into issues with the above RF library. Download and install [here](https://www.autoitscript.com/site/autoit/downloads/).
* ## OCR Library:
> **Hint**: A robot framework library that is capable of processing images, validating text, and locating specified text by coordinates within images. OCRLibrary requires Google's Tesseract OCR software, that utilizes OpenCV image processing and pytesseract OCR.

> **Hint**: **Keyword Documentation** you can find the keyword documentation [here](https://bendurston.github.io/OCRLibrary.html).

> **Hint**: **Installation and Usage** OCRLibrary can be run on Python 3.6, 3.7, 3.8, and 3.9.

> **Hint**: **Dependencies** OCRLibrary uses two dependencies downloadable through the pip package manager, ***opencv-python*** and ***pytesseract***. As well as Tesseract OCR.


1. To install, run: 
    ```
    pip install robotframework-ocrlibrary
    ```
**Tesseract**

2. Install tesseract using windows installer available at [here](https://github.com/UB-Mannheim/tesseract/wiki): 
> **Hint**: The tesseract path from the installation. Default installation path at the time of this edit was: C:\Users\USER\AppData\Local\Tesseract-OCR. It may change so please check the installation path.


3. After that install de tesseract on python
    ```
    pip install pytesseract 
    pip install tesseract    
    ```
<!-- $ pip install tesseract-ocr -->

4. Add Tesseract path to your System Environment. i.e. Edit system variables.

5. Set the tesseract path in the script ***pytesseract.py*** which can be found at the path    `C:\Users\User\AppData\Local\Programs\Python\Python310\Lib\site-packages\pytesseract` or usually in the `C:\Users\YOUR USER\APPDATA\Python`
    ```
    #tesseract_cmd = 'tesseract'
    tesseract_cmd = 'C:\Program Files\Tesseract-OCR\\tesseract.exe'
    ```
6. After that compile the file ***pytesseract.py***
    ```
    \Usr\AppData\Local\Programs\Python\Python310\Lib\site-packages> python .\pytesseract.py    
    ```

**OpenCV Python**
> **Hint** Please see [opencv-python's installation and usage section](https://github.com/opencv/opencv-python#installation-and-usage) section for more information.

7. To install opencv-python, run:
    ```
    pip install opencv-python
    ```

**Pytesseract**
> **Hint**  Please see [pytesseracts installation section](https://github.com/madmaze/pytesseract#installation) for more information.
8. To install pytesseract, run
    ```
    pip install pytesseract 
   ```

**Usage**

Once `OCRLibrary` is installed, along with its dependencies, add Library `OCRLibrary` to your robot file to use.





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
1. [Unzip](https://github.com/nokia/robotframework-autoitlibrary.git) the AutoTI library file you got from [Requirements and tools](#requirements-and-tools) section.
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

1. File `input-data.yaml` should be edited if you need to use different input data than the default values. Each Dataset is binded to one test case using the Test Setup.
1. To run the `demo` test tag from demo.robot suite on another Git Bash / terminal window, activate the Python Virtual Environment as stated before and use this command:

    * Include params options:
    ```
    (env) $ robot --variablefile .\resources\robot-variables\robot_variables.py --loglevel TRACE --outputdir results --include create_input_data --exclude create_input_random_code .\resources\tests\generaltabledisplay\standard 
    ```

    * Folder level:
    ```
    (env) $ robot --variablefile ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir results .\demo.robot    

    ```  
1. To run the `demo.robot` test suite on another Git Bash / terminal window, activate the Python Virtual Environment as stated before and use this command:
    * Terminal vsCode | PowerShell  | CMD Option: 
    ```
    (env) $ robot -d ..\..\..\results --variablefile ..\..\..\robot-variables\robot_variables.py .\demo.robot .
    ```
    ```
    (env) $ robot --variablefile ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir ..\..\..\results  demo.robot .
    ```
    * Terminal Git Bash Option: 
    ```
    (env) $ robot -d ./resources/results --variablefile ./resources/robot-variables/robot_variables.py ./resources/tests/generaltabledisplay/standard/demo.robot .
    ```   
    
    * Option `--variablefile` simply points to your local copy of `robot_variables.py`.
    * Set `--loglevel` option to `TRACE` when running locally for debugging, but in automation production running environment this should be set to `INFO` to save space.
    * `--outputdir` refers to where RF should save the report after finishing the execution. Can be `logs*` or `results*` folder names, as both are already ignored in Git.
    * To run more tests just add another `--include` option and the test case tag to be run. You can also use logical operators (AND, OR and NOT) to select the tests, like `--include demoORmy-test-tag`, this will run any tests that have at least one of the tags. Using `--include demoNOTmy-test-tag` will run all tests with the first tag except the tests with the second tag. And with `--include demoANDmy-test-tag` will run tests that have BOTH tags. You can achieve the same result as OR operator by adding `--exclude` option and the test tag.

1. There is an example of test the OCRLibrary, the content will be returned from the processed image using page segmentation mode 6 and it will ignore all numbers. `${content}= Get Image Content ${processed_image} --psm 6 -c tessedit_char_blacklist=0123456789`.

    ```
<!-- robot --variablefile ..\..\..\robot-variables\robot_variables.py --loglevel TRACE --outputdir ..\..\..\results .\demo-testFunc.robot -->
    

# Troubleshooting
If you get errors related to AutoIT library like `class not registered` follow these steps to fix it:
1. Unnistall robotframework-autoitlibrary by running this in Git bash:
    ```
    (env) $ pip uninstall robotframework-autoitlibrary
    ```
1. Follow the [steps](#AutoIT-Library-installation) to install autoitlibrary from the source zip.
[AutoItLibrary installs the own files](https://github.com/hcardamone/commun-imagecontents/blob/main/files.JPG) and, if not already present, the [3rd party AutoIt](https://github.com/nokia/robotframework-autoitlibrary/tree/master/3rdPartyTools/) and PIL tools, To install, [Unzip](#autoit-library-installation) the autoitlibrary library, open a command window in the directory and type: [python setup.py install](#autoit-library-installation) again.
1. Try to run robot again, if still doesn't work, [reinstall](#install-python-packages-run-this-command-after-cloning-the-repo) the package back using pip and try again.

If you get errors related to Tesseract OCRLibrary like `TesseractNotFound Error: tesseract is not installed or it's not in your path` follow these steps to fix it:
1. Follow the [step 3](#ocr-library)
1. Try to run robot again, if still doesn't work, [reinstall](#ocr-library) since step 1.
    
<!-- https://stackoverflow.com/questions/50951955/pytesseract-tesseractnotfound-error-tesseract-is-not-installed-or-its-not-i -->

# Useful Links
- [Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Built In Keywords](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [SAP GUI Library](https://github.com/frankvanderkuur/robotframework-sapguilibrary/)
- [AutoIT library](https://github.com/nokia/robotframework-autoitlibrary)
- [Git Tutorial](https://testautomationu.applitools.com/git-tutorial/)
- [SAP GUI Scripting Documentation](https://help.sap.com/viewer/b47d018c3b9b45e897faf66a6c0885a8/LATEST/en-US/babdf65f4d0a4bd8b40f5ff132cb12fa.html)
- [OCR Library](https://pypi.org/project/robotframework-ocrlibrary/)

# Modules
1. `demo.robot` to running tests.
2. `sapgui.resource` to the other modules/resources access the Global Resources.
3. `zcadastromat.resource` to register a new material.
3. `zcategmaterial.resource` to register a new material category.

> **Hint**: Markdown preview
`Ctrl+Shift+V`
