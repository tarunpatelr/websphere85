FROM icr.io/appcafe/websphere-traditional:latest

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"

EXPOSE 9043
EXPOSE 9443

RUN /work/configure.sh

RUN mkdir /tmp/deploy
COPY deploy/myapp.war /tmp/deploy/
COPY deploy/hello-world.war /tmp/deploy/
COPY deploy/deployApp.py /tmp/deploy/
COPY deploy/updateClassLoader.py /tmp/deploy/

ENV TEST_PWD "test"
RUN echo $TEST_PWD

ENV ADMIN_PWD $(cat /tmp/PASSWORD)

RUN /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -username wsadmin -password $ADMIN_PWD -lang jython -f /tmp/deploy/deployHelloWorldApp.py
#RUN /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -username wsadmin -password $(cat /tmp/PASSWORD) -lang jython -f /tmp/deploy/deployApp.py
