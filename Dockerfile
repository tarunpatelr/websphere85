FROM icr.io/appcafe/websphere-traditional:8.5.5.26
# copy property files and jython scripts, using the flag `--chown=was:root` to set the appropriate permission

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"

RUN /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -username wsadmin -password $(cat /tmp/PASSWORD) -lang jython -f deploy/deployMyApp.py

EXPOSE 9043
EXPOSE 9443

RUN /work/configure.sh
