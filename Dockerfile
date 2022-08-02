
FROM robotframework/rfdocker

### Uncomment following two lines if having external test libraries:
# COPY --chown=robot:robot requirements.txt .
# RUN python -m pip install -U pip
#RUN pip3 install --no-cache-dir -r requirements.txt