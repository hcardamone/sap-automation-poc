# Welcome to Process Automation Robot Framework Lab

Process Automation Robot Framework Lab is an study about automated testing framework developed using [Robot Framework](https://robotframework.org/) for QA purposes for process application.

## Writer in BDD Automation

To this project was used the Behavior-Driven Development (BDD) method to improve my skills also
my studies.

## About

The purpose of this POC is applying some studies to Automation, even using Robot Framework libraries, ECC or web elements.
This is a starting guide meant to set the environment ready to run tests and to validate that **all automation developers have the same environment**, making easier to create scenarios, select/process and extract status code in process.

> This POC was running on the MiniLICENSE NPL NetWeaver 7.52 (Sybase ASE) to VM Ubuntu.
> For further information, there are some helpful links at the end of this readme.

## Requirements and tools

- ## Git SCM

  - Windows: Get last git [here](https://git-scm.com/download/win). Git Bash is recommended to work from Windows with almost the same features as Git on Linux.

- ## Python 3.9 or higher

  - Windows: get last Python installer [here](https://www.python.org/downloads/)

- ## GUI Scripting Tracker

  - This tool allows to get the UI elements IDs from GUI application. Download [here](https://tracker.stschnell.de/).
  - After login in GUI, open the Scripting Tracker and click on Scan, then the tree panel will be filled with all objects found.
  - Expand over the object tree and right click in one element to highlight it in the GUI window.
  - You can also click on Identify arrow button to track the UI element as you move the mouse over it in GUI Window.

- ## API GUI Scripting

  - Enabling `GUI Scripting` on the server side,
    Launch the `saplogon.exe`, login to the server using your credentials. The Easy Access window appears.
    > **Hint**: To enable this, selecting this option when starting setup install to products to this module working as well
  - Execute the `RZ11` transaction. Specify `sapgui/user_scripting` parameter name and press Enter on keyboard or Display in interface.
  - In the View Profile Parameter Attributes window, click the `Change Value` button on the toolbar and set the New value of sapgui/user_scripting to `TRUE`. `Save Changes`.
  - `Sign out` of the session and `sign in again` to see the change as it is not applied to running sessions.
  <!-- search: https://docs.uipath.com/studio/lang-pt_BR/v2018.4/docs/enabling-sap-gui-scripting -->

- ## AutoIT Library

  - Download the latest release [here](https://github.com/nokia/robotframework-autoitlibrary/releases/latest).
  - Although the full AutoIT is not required, can be needed for debugging purposes if you get into issues with the above RF library. Download and install [here](https://www.autoitscript.com/site/autoit/downloads/).

- ## abapGit Git client for ABAP (Optional)

  - To this project I'm using the abapGit (). abapGit is a git client for ABAP developed in ABAP.
  - Download the latest build [zabapgit.abap](https://raw.githubusercontent.com/abapGit/build/main/zabapgit.abap).
  - abapGit is a tool to import and export code between ABAP systems. If a developer has a developer key to the system, the developer can perform these actions already. abapGit enables the developer to do mass export/changes/imports but not more than already possible to do manually. To more details go to [docs.abapgit.org](https://docs.abapgit.org/)
  > **Hint** abapGit requires BASIS version 702 or higher.

- ## Robotidy (Optional)

  - Download the latest release [here](https://github.com/MarketSquare/robotframework-tidy) - library  optional, Robotidy is a tool for autoformatting Robot Framework code.

- ## True Path (Optional)

  - This extension was installed on Chrome to get the xpath element. TruePath generates the relative XPath, script and analyzes code on click.

## Setup Guide

## Python Virtual Environment

> **Hint**: On Git Bash you can find where Python is located run `which python` or `which python3`. Then you can set your path accordingly the correct Python version.

1. After cloning the project repository, then create the Python Virtual Environment `env` (can be the name you want)

   ```python
   cd sap-automation-poc
   $ python -m venv env
   ```

> **Hint**: `py -m pip install --user virtualenv` To install the python virtual environment

1. Add path setting to activate script

   ```python
   echo -e "\n# Sets PYTHONPATH var within virtualenv\nexport PYTHONPATH=$(pwd)" >> ./env/Scripts/activate
   ```

1. Activate the Virtual Environment, then you should see the **(env)** prefix in your bash prompt.

   ```python
   user@host: ~/sap-automation-poc (branch)
   $ source ./env/Scripts/activate 
   (env)

> **Hint**: To exit `virtualenv` just type `deactivate`. To close Git Bash window type `exit`.

## AutoIT Library installation

1. [Unzip](https://github.com/nokia/robotframework-autoitlibrary.git) the AutoTI library file you got from [Requirements and tools](#requirements-and-tools) section.
2. Open the Windows Command Prompt as administrator, navigate to that folder and run:

   ```python
   python setup.py install
   ```

## abapGit Git client for ABAP

1. Download the [ABAP code](#abapgit-git-client-for-abap-optional) (right click -> save-as) to a file.
Via `SE38`, `SE80`, or `ADT`, create a new report named ZABAPGIT. Note: Do not use the name ZABAPGIT if you plan to install the developer version.
In source code change mode, upload the code from the file using Utilities -> More Utilities -> Upload/Download -> Upload -> Activate;

> **Hint** Typically, abapGit will only be used in the development system, so it can be installed in a local $ package (e.g. $ZABAPGIT).

1. Downloading the certificate file [here](https://github.com)
      On chrome, click on the locker near the address bar, then click on “Details”
   The developer tools will open at the Security tab. Click on “View certificate”
   Go to the “Details” tab and click on “Copy to file…” to export to a .CER file
   Open the “Certification path” tab and navigate to the parent node at the tree, do this until the root.
      Use Firefox, click on the lock icon and then “More Information …” and there “View Certificate”
   Switch to the Details Tab and choose the first certificate of the tree and click Export
   Do the same for the next certificate in the tree;

2. Install the certificates in `STRUST` transaction:
   - Click on the Change button
   - Open `SSL client Client SSL Client (Anonymous)` folder
   - In the third box, Certificate, click on the bottom-left button `Import certificate` and `Add to certificate list`.
   - Upload all the downloaded certificates
   - Save;

3. Now you can use abapGit by executing the report in transaction `SE38`.

> **Hint** Note about GitHub# On 2018-02-22, GitHub deprecated weak TLS connections. See note 510007, section 7, for information on how to configure SSL.

## Robotidy library (Optional)

1. Open the Windows Command Prompt as administrator, navigate to that folder and run:

   ```python
   pip install -U robotframework-tidy
   ```

2. To call robotidy with path(s) to file/directory with robot files run:

   ```python
   robotidy tests
   robotidy test.robot
   robotidy tests/resources test.robot
   ```

## True Path Extension (Optional)

1. Search this extension on your store browser, in this case was used on Google `Chrome`. Check on the [link](#useful-links)

## Test Automation dependencies

- ### Install Python packages: run this command after cloning the repo

  ```python
  (env) $ pip install -r requirements.txt
  ```

> **Hint** You can run this command on the Python virtual Environment.

## Visual Studio Code Plugins

VS Code is the recommended IDE, although barely anyone can be used.
These are suggested VS Code plugins that best fit this automation project:

- [Git Lens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) - great plugin to know instant Git blame info.
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) - a must have for all Python developers.
- [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode) - this is a very stronger robot framework extension. PS: The [Robot Framework Intellisense](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense) extension has been deprecated.
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) - YAML plugin supported by Red Hat, so no further comments.
- [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml) - Plugin with many useful commands to work with XML files.
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - Optional but great extension to give a nice touch on file icons.
- [JSON Pretty Printer](https://marketplace.visualstudio.com/items?itemName=euskadi31.json-pretty-printer) - Optional but great extension to give a nice .json indentation.
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) - Optional but great extension to give autocomplete filenames.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker#:~:text=Open%20up%20VS%20Code%20and,and%20reload%20window%20to%20enable.) - Optional but a great extension to check that works well with code and documentation.

## Running a Test Suite

1. First make a copy of file `robot_variables_template.py`to your home user folder and remove the `-template` suffix.
2. File `robot_variables` has all initial variables to run RF and you have to change to fit your machine settings as needed, since it won't be committed anyway as each automation developer can have different settings:

   - `SAP_ENV = "ENVNAME"`  
      test environment to be used. Refer to environments.yaml file for available environments details.
   - `USER_NAME = "USER"`  
      User name to login in GUI.
   - `PWD = "********"`  
      Password to login in GUI. **_IMPORTANT_**: It's a security best practice to NEVER commit user password in code repositories.
   - `LANGUAGE = "EN"`  
      GUI language to login. Defaults to English.
   - `PATH_TO_SAPLOGON`  
      Absolute path to `saplogon.exe` executable.
   - `EXPLICIT_WAIT = "n s"`  
      Time in pattern m, s or ms for minutes, milliseconds or seconds, respectively to wait between execution of GUI library keywords.
   - `MULTIPLE_LOGON_ACTION ="option"`  
      To set the behavior when there is another logged session with the same user. Options: `endOthersOption_rdi`: Continue with this logon and end any other logons in system. When ending any existing logons to system, unsaved data is lost. `continueOption_rdi`: Continue with this logon, without ending any other logons in system `terminateOption_rdi`: Terminate this logon. This will cause the test run to fail.

3. File `input-data.yaml` should be edited if you need to use different input data than the default values. Each Dataset is binder to one test case using the Test Setup.
4. To run the `demo` test tag from demo.robot suite on another Git Bash / terminal window, activate the Python Virtual Environment as stated before and use this command:

   ```python
   (env) 
   $ robot --variablefile ./resources/robot-variables/robot_variables.py --loglevel TRACE --outputdir results ./resources/tests/generaltabledisplay/standard/demo.robot
   ```

   - Option `--variablefile` simply points to your local copy of `robot_variables.py`.
   - Set `--loglevel` option to `TRACE` when running locally for debugging, but in automation production running environment this should be set to `INFO` to save space.
   - `--outputdir` refers to where RF should save the report after finishing the execution. Can be `logs*` or `results*` folder names, as both are already ignored in Git.
   - To run more tests just add another `--include` option and the test case tag to be run. You can also use logical operators (AND, OR and NOT) to select the tests, like `--include demoORmy-test-tag`, this will run any tests that have at least one of the tags. Using `--include demoNOTmy-test-tag` will run all tests with the first tag except the tests with the second tag. And with `--include demoANDmy-test-tag` will run tests that have BOTH tags. You can achieve the same result as OR operator by adding `--exclude` option and the test tag.

## Troubleshooting

If you get errors related to AutoIT library like `class not registered` follow these steps to fix it:

1. Uninstall robotframework-autoitlibrary by running this in Git bash:

   ```python
   (env) $ pip uninstall robotframework-autoitlibrary
   ```

1. Follow the [steps](#AutoIT-Library-installation) to install autoitlibrary from the source zip.
   [AutoItLibrary installs the own files](https://github.com/hcardamone/commun-imagecontents/blob/main/files.JPG) and, if not already present, the [3rd party AutoIt](https://github.com/nokia/robotframework-autoitlibrary/tree/master/3rdPartyTools/) and PIL tools, To install, [Unzip](#autoit-library-installation) the autoitlibrary library, open a command window in the directory and type: [python setup.py install](#autoit-library-installation) again.
1. Try to run robot again, if still doesn't work, [reinstall](#install-python-packages-run-this-command-after-cloning-the-repo) the package back using pip and try again.

1. If you get errors related to [abapGit](#abapgit-git-client-for-abap-optional) `The peer's X.509 Certificate (chain) is untrusted, Failed to verify peer certificate, Peer not trusted, RFC, LMDB_SYNCDEST, STRUST, PSE, Trusted certificate, Chain, ICM, Peers, Peer certificate (chain) is not trusted, issue in SSL, dev_icm, SSSLERR_PEER_CERT_UNTRUSTED, ICM_HTTP_SSL_PEER_CERT_UNTRUSTED, Fiori, My Inbox, Navigation, Gateway, upgrade, Portal, LDAPS. 636 , KBA , ssl handshake with , (-102) , BC-SEC-SSL , Secure Sockets Layer Protocol , Problem` try to add profile parameters:

- ssl/client_ciphersuites = 150:PFS:HIGH::EC_P256:EC_HIGH
- ssl/ciphersuites = 135:PFS:HIGH::EC_P256:EC_HIGH
- icm/HTTPS/client_sni_enabled = TRUE

To add profile parameters use transaction `RZ10` or update contents of file DEFAULT.PFL directly. For preview, evaluation and developer versions of NetWeaver refer to following locations, depending on your system name:

- “A4H - NetWeaver AS ABAP 7.4 and above (Linux / HANA)” - /usr/sap/A4H/sys/profile/DEFAULT.PFL
- “NPL - NetWeaver 7.x” - /sapmnt/NPL/profile/DEFAULT.PFL

## Useful Links

- [Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Built In Keywords](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [GUI Library](https://github.com/frankvanderkuur/robotframework-sapguilibrary/)
- [AutoIT library](https://github.com/nokia/robotframework-autoitlibrary)
- [Git Tutorial](https://testautomationu.applitools.com/git-tutorial/)
- [GUI Scripting Documentation](https://help.sap.com/viewer/b47d018c3b9b45e897faf66a6c0885a8/LATEST/en-US/babdf65f4d0a4bd8b40f5ff132cb12fa.html)
- [abapGit Git client for ABAP](https://docs.abapgit.org/)
- [Robotidy](https://github.com/MarketSquare/robotframework-tidy#installation)
- [True Path Extension](https://chrome.google.com/webstore/detail/truepath/mgjhkhhbkkldiihlajcnlfchfcmhipmn)

<!-- **Hint**: Markdown preview
`Ctrl+Shift+V` >
