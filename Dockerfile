FROM icr.io/appcafe/websphere-traditional:latest

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"

RUN /work/configure.sh

RUN mkdir /tmp/deploy
COPY deploy/myapp.war /tmp/deploy/
COPY deploy/deployApp.py /tmp/deploy/
COPY deploy/updateClassLoader.py /tmp/deploy/

ENV ADMIN_PWD $(cat /tmp/PASSWORD)
RUN echo $ADMIN_PWD

EXPOSE 9043
EXPOSE 9080

ENTRYPOINT ["/opt/IBM/WebSphere/AppServer/bin/wsadmin.sh", "-username wsadmin", "-password $ADMIN_PWD", "-lang jython", "-f /tmp/deploy/deployApp.py"]