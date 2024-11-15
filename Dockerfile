FROM icr.io/appcafe/websphere-traditional:latest

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"

EXPOSE 9043
EXPOSE 9443

COPY deploy/hello-world.war /tmp/deploy/
COPY deploy/deployHelloWorldApp.py /work/config/

RUN /work/configure.sh
