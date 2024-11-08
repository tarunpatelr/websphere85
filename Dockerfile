FROM icr.io/appcafe/websphere-traditional:8.5.5.26
# copy property files and jython scripts, using the flag `--chown=was:root` to set the appropriate permission
ENV ENABLE_BASIC_LOGGING=true

RUN /work/configure.sh

LABEL authors="tarun"

EXPOSE 9043
EXPOSE 9060
EXPOSE 9080
EXPOSE 9443