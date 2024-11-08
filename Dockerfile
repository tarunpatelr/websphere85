FROM icr.io/appcafe/websphere-traditional:latest
# copy property files and jython scripts, using the flag `--chown=was:root` to set the appropriate permission
RUN /work/configure.sh

LABEL authors="tarun"

ENTRYPOINT ["top", "-b"]