# SAP Process Automation Lab with Robot Framework

Process Automation Robot Framework Lab is a study of test automation for SAP processes, built with [Robot Framework](https://robotframework.org/) for QA purposes.

## Written with BDD

This project uses Behavior-Driven Development (BDD) to structure the test scenarios.

## About

The purpose of this POC is to apply automation studies using Robot Framework libraries on SAP ECC (SAP GUI) and web elements.
It is also a starting guide to set up the environment, run the tests and make sure that **all automation developers share the same environment**, making it easier to create scenarios, process them and extract status codes.

> This POC ran on SAP NetWeaver 7.52 (NPL, Sybase ASE, MiniLICENSE) in an Ubuntu VM.
> Useful links are listed at the end of this README.

## Requirements and tools

- ## Git SCM

  - Windows: get the latest Git [here](https://git-scm.com/download/win). Git Bash is recommended on Windows, since it offers almost the same features as Git on Linux.

- ## Python 3.9 or higher

  - Windows: get the latest Python installer [here](https://www.python.org/downloads/).

- ## GUI Scripting Tracker

  - This tool gets the IDs of UI elements from the SAP GUI. Download it [here](https://tracker.stschnell.de/).
  - After logging in to SAP GUI, open Scripting Tracker and click **Scan**; the tree panel will be filled with all objects found.
  - Expand the object tree and right-click an element to highlight it in the SAP GUI window.
  - You can also click the **Identify** arrow button to track UI elements as you move the mouse over the SAP GUI window.

- ## SAP GUI Scripting API

  - Enable `GUI Scripting` on the server side:
    launch `saplogon.exe` and log in to the server with your credentials. The Easy Access window appears.
    > **Hint**: GUI Scripting must also be selected as a component when installing SAP GUI on the client.
  - Run transaction `RZ11`, enter the parameter name `sapgui/user_scripting` and press Enter (or click **Display**).
  - In the *View Profile Parameter Attributes* window, click `Change Value` on the toolbar, set the new value of `sapgui/user_scripting` to `TRUE` and click `Save Changes`.
  - `Log off` and `log on again` to see the change, since it is not applied to running sessions.
  <!-- search: https://docs.uipath.com/studio/lang-pt_BR/v2018.4/docs/enabling-sap-gui-scripting -->

- ## AutoIt Library

  - Download the latest release [here](https://github.com/nokia/robotframework-autoitlibrary/releases/latest).
  - The full AutoIt is not required, but it can help with debugging if you run into issues with the Robot Framework library above. Download and install it [here](https://www.autoitscript.com/site/autoit/downloads/).

- ## abapGit — Git client for ABAP (optional)

  - This project uses [abapGit](https://abapgit.org/), a Git client for ABAP written in ABAP.
  - Download the latest build: [zabapgit.abap](https://raw.githubusercontent.com/abapGit/build/main/zabapgit.abap).
  - abapGit imports and exports code between ABAP systems. A developer with a developer key can already do this manually; abapGit enables mass exports, changes and imports, but nothing beyond what is already possible manually. More details at [docs.abapgit.org](https://docs.abapgit.org/).
  > **Hint**: abapGit requires Basis 702 or higher.

- ## Robotidy (optional)

  - Download the latest release [here](https://github.com/MarketSquare/robotframework-tidy). Robotidy is a tool for auto-formatting Robot Framework code.

- ## TruePath (optional)

  - Chrome extension used to get element XPaths. TruePath generates the relative XPath and analyzes the code on click.

## Setup Guide

## Python Virtual Environment

> **Hint**: In Git Bash, run `which python` or `which python3` to find where Python is installed, then set your path to the correct Python version.

1. After cloning the repository, create the Python virtual environment `env` (any name works):

   ```bash
   cd sap-automation-poc
   python -m venv env
   ```

> **Hint**: run `py -m pip install --user virtualenv` to install the Python virtual environment package.

1. Add the path setting to the activate script:

   ```bash
   echo -e "\n# Sets PYTHONPATH var within virtualenv\nexport PYTHONPATH=$(pwd)" >> ./env/Scripts/activate
   ```

1. Activate the virtual environment; you should see the **(env)** prefix in your bash prompt:

   ```bash
   user@host: ~/sap-automation-poc (branch)
   $ source ./env/Scripts/activate
   (env)
   ```

> **Hint**: to leave the virtual environment, type `deactivate`. To close the Git Bash window, type `exit`.

## AutoIt Library installation

1. [Unzip](https://github.com/nokia/robotframework-autoitlibrary.git) the AutoIt library file you downloaded in the [Requirements and tools](#requirements-and-tools) section.
2. Open the Windows Command Prompt as administrator, go to that folder and run:

   ```bash
   python setup.py install
   ```

## abapGit installation

1. Download the [ABAP code](#abapgit--git-client-for-abap-optional) (right-click → Save as) to a file.
   Via `SE38`, `SE80` or `ADT`, create a new report named `ZABAPGIT`. Note: do not use the name `ZABAPGIT` if you plan to install the developer version.
   In source code change mode, upload the code from the file via Utilities → More Utilities → Upload/Download → Upload, then activate it.

> **Hint**: abapGit is usually used only in the development system, so it can be installed in a local `$` package (e.g. `$ZABAPGIT`).

2. Download the GitHub SSL certificates from [github.com](https://github.com):
   - **Chrome:** click the lock icon next to the address bar, then **Details**. The developer tools open on the Security tab. Click **View certificate**, go to the **Details** tab and click **Copy to file…** to export a `.CER` file. Open the **Certification path** tab and repeat for each parent node up to the root.
   - **Firefox:** click the lock icon, then **More Information…** → **View Certificate**. On the **Details** tab, select the first certificate of the tree and click **Export**. Repeat for the next certificates in the tree.

3. Install the certificates in transaction `STRUST`:
   - Click **Change**.
   - Open the `SSL client Client SSL Client (Anonymous)` folder.
   - In the third box, *Certificate*, click `Import certificate` (bottom-left) and then `Add to certificate list`.
   - Upload all downloaded certificates.
   - Save.

4. Now you can use abapGit by running the report in transaction `SE38`.

> **Hint**: on 2018-02-22 GitHub deprecated weak TLS connections. See SAP Note 510007, section 7, for how to configure SSL.

## Robotidy installation (optional)

1. Open the Windows Command Prompt as administrator, go to the project folder and run:

   ```bash
   pip install -U robotframework-tidy
   ```

2. Run robotidy with the path(s) to the robot files or folders:

   ```bash
   robotidy tests
   robotidy test.robot
   robotidy tests/resources test.robot
   ```

## TruePath extension (optional)

1. Search for the extension in your browser's store (this project used Google Chrome). See the [link](#useful-links).

## Test automation dependencies

- ### Install the Python packages after cloning the repository

  ```bash
  (env) $ pip install -r requirements.txt
  ```

> **Hint**: run this command inside the Python virtual environment.

## Visual Studio Code extensions

VS Code is the recommended IDE, although any IDE can be used.
Suggested VS Code extensions for this automation project:

- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) — instant Git blame info.
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) — a must-have for Python development.
- [RobotCode](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode) — a complete Robot Framework extension. Note: the [Robot Framework Intellisense](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense) extension has been deprecated.
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) — YAML support by Red Hat.
- [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml) — useful commands for working with XML files.
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) — optional, nicer file icons.
- [JSON Pretty Printer](https://marketplace.visualstudio.com/items?itemName=euskadi31.json-pretty-printer) — optional, formats `.json` indentation.
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) — optional, autocompletes file names.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) — optional, spell checking that works well with code and documentation.

## Running a test suite

1. Copy the file `robot_variables_template.py` to your home folder and remove the `_template` suffix.
2. `robot_variables.py` holds the initial variables to run Robot Framework. Adjust them to your machine settings as needed; this file is never committed, since each automation developer can have different settings:

   - `SAP_ENV = "ENVNAME"`
      Test environment to use. See `environments.yaml` for the available environments.
   - `USER_NAME = "USER"`
      User name to log in to SAP GUI.
   - `PWD = "********"`
      Password to log in to SAP GUI. **_IMPORTANT_**: as a security best practice, NEVER commit passwords to code repositories.
   - `LANGUAGE = "EN"`
      SAP GUI logon language. Defaults to English.
   - `PATH_TO_SAPLOGON`
      Absolute path to the `saplogon.exe` executable.
   - `EXPLICIT_WAIT = "n s"`
      Wait time between SAP GUI library keywords, in m, s or ms (minutes, seconds or milliseconds).
   - `MULTIPLE_LOGON_ACTION = "option"`
      Behavior when there is another session logged in with the same user. Options: `endOthersOption_rdi` — continue with this logon and end any other logons in the system (unsaved data in those sessions is lost); `continueOption_rdi` — continue with this logon without ending the others; `terminateOption_rdi` — terminate this logon, which makes the test run fail.

3. Edit `input-data.yaml` if you need input data other than the defaults. Each dataset is bound to one test case through the Test Setup.
4. To run the `demo` tag from the `demo.robot` suite, open another Git Bash / terminal window, activate the Python virtual environment as described above and run:

   ```bash
   (env) $ robot --variablefile ./resources/robot-variables/robot_variables.py --loglevel TRACE --outputdir results ./resources/tests/generaltabledisplay/standard/demo.robot
   ```

   - `--variablefile` points to your local copy of `robot_variables.py`.
   - Set `--loglevel` to `TRACE` when debugging locally; in the automation production environment use `INFO` to save space.
   - `--outputdir` is where Robot Framework saves the report after the run. Use `logs*` or `results*` folder names, since both are already ignored by Git.
   - To run more tests, add another `--include` option with the test tag. You can also combine tags with logical operators (AND, OR, NOT): `--include demoORmy-test-tag` runs tests that have at least one of the tags; `--include demoNOTmy-test-tag` runs tests with the first tag except those with the second; `--include demoANDmy-test-tag` runs tests that have BOTH tags. The `--exclude` option gives the same result as the NOT operator.

## Troubleshooting

If you get AutoIt library errors such as `class not registered`, follow these steps:

1. Uninstall robotframework-autoitlibrary by running this in Git Bash:

   ```bash
   (env) $ pip uninstall robotframework-autoitlibrary
   ```

1. Follow the [installation steps](#autoit-library-installation) to install AutoItLibrary from the source zip.
   [AutoItLibrary installs its own files](https://github.com/hcardamone/commun-imagecontents/blob/main/files.JPG) and, if not already present, the [3rd-party AutoIt](https://github.com/nokia/robotframework-autoitlibrary/tree/master/3rdPartyTools/) and PIL tools. To install, [unzip](#autoit-library-installation) the library, open a command window in that folder and run [python setup.py install](#autoit-library-installation) again.
1. Run robot again. If it still doesn't work, [reinstall](#install-the-python-packages-after-cloning-the-repository) the packages with pip and try again.

1. If you get [abapGit](#abapgit--git-client-for-abap-optional) errors such as `The peer's X.509 Certificate (chain) is untrusted, Failed to verify peer certificate, Peer not trusted, RFC, LMDB_SYNCDEST, STRUST, PSE, Trusted certificate, Chain, ICM, Peers, Peer certificate (chain) is not trusted, issue in SSL, dev_icm, SSSLERR_PEER_CERT_UNTRUSTED, ICM_HTTP_SSL_PEER_CERT_UNTRUSTED, Fiori, My Inbox, Navigation, Gateway, upgrade, Portal, LDAPS. 636 , KBA , ssl handshake with , (-102) , BC-SEC-SSL , Secure Sockets Layer Protocol , Problem`, try adding these profile parameters:

- ssl/client_ciphersuites = 150:PFS:HIGH::EC_P256:EC_HIGH
- ssl/ciphersuites = 135:PFS:HIGH::EC_P256:EC_HIGH
- icm/HTTPS/client_sni_enabled = TRUE

To add profile parameters, use transaction `RZ10` or edit `DEFAULT.PFL` directly. For preview, evaluation and developer versions of NetWeaver, the file is in one of these locations, depending on your system name:

- "A4H - NetWeaver AS ABAP 7.4 and above (Linux / HANA)" — /usr/sap/A4H/sys/profile/DEFAULT.PFL
- "NPL - NetWeaver 7.x" — /sapmnt/NPL/profile/DEFAULT.PFL

## Useful links

- [Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [BuiltIn keywords](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [SAP GUI Library](https://github.com/frankvanderkuur/robotframework-sapguilibrary/)
- [AutoIt Library](https://github.com/nokia/robotframework-autoitlibrary)
- [Git Tutorial](https://testautomationu.applitools.com/git-tutorial/)
- [SAP GUI Scripting documentation](https://help.sap.com/viewer/b47d018c3b9b45e897faf66a6c0885a8/LATEST/en-US/babdf65f4d0a4bd8b40f5ff132cb12fa.html)
- [abapGit — Git client for ABAP](https://docs.abapgit.org/)
- [Robotidy](https://github.com/MarketSquare/robotframework-tidy#installation)
- [TruePath extension](https://chrome.google.com/webstore/detail/truepath/mgjhkhhbkkldiihlajcnlfchfcmhipmn)
