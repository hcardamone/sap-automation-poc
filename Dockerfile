FROM fedora:31

VOLUME /opt/sap-automation-poc/resources/results
VOLUME /opt/sap-automation-poc/resources/tests/generaltabledisplay/standard

RUN dnf upgrade -y && dnf install -y python37 \
    fedora-workstation-repositories 
# Aqui a magica para o browser:
RUN  dnf install -y 'dnf-command(config-manager)' && dnf config-manager --set-enabled google-chrome
RUN  dnf install -y google-chrome-stable
 
# e o  driver que vai dar match entre browser e driver:
# Fica atento onde instala por default e o symlink criado.
# ref: https://pypi.org/project/webdrivermanager
 
RUN pip3 install webdrivermanager  \
    && webdrivermanager    chrome  
RUN mv chromedriver /usr/bin/chromedriver 
# RUN chown root:root /usr/bin/chromedriver 
# RUN chmod +x /usr/bin/chromedriver
RUN chown root /usr/bin/chromedriver >/dev/null && echo OK
RUN chmod +x /usr/bin/chromedriver >/dev/null && echo OK
RUN chmod 755 /usr/bin/chromedriver >/dev/null && echo OK
RUN pip3 install robotframework robotframework-faker \
robotframework-requests==0.5.0 robotframework-seleniumlibrary \
robotframework-databaselibrary robotframework-sshlibrary==3.2.1 | grep "Successfully installed"

