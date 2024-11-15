FROM icr.io/appcafe/websphere-traditional:latest
# copy property files and jython scripts, using the flag `--chown=was:root` to set the appropriate permission

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"

EXPOSE 9043
EXPOSE 9443

RUN /work/configure.sh

COPY deploy/myapp.war /tmp/deploy/
COPY deploy/hello-world.war.war /tmp/deploy/
COPY deploy/deployApp.py /tmp/deploy/
COPY deploy/updateClassLoader.py /tmp/deploy/

RUN /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -username wsadmin -password $(cat /tmp/PASSWORD) -lang jython -f /tmp/deploy/deployHelloWorldApp.py
#RUN /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -username wsadmin -password $(cat /tmp/PASSWORD) -lang jython -f /tmp/deploy/deployApp.py
