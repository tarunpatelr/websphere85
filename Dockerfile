FROM icr.io/appcafe/websphere-traditional:latest

ENV ENABLE_BASIC_LOGGING=true
LABEL authors="tarun"


RUN mkdir /tmp/deploy
COPY deploy/myapp.war /tmp/deploy/
COPY deploy/updateClassLoader.py /tmp/deploy/

COPY deploy/deployApp.py /work/config/

RUN /work/configure.sh


EXPOSE 9043
EXPOSE 9080
