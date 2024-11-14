FROM icr.io/appcafe/websphere-traditional:8.5.5.26
# copy property files and jython scripts, using the flag `--chown=was:root` to set the appropriate permission

ENV ENABLE_BASIC_LOGGING=true

LABEL authors="tarun"

#COPY --chown=was:root was-config.props /work/config/
COPY --chown=was:root myapp.war /work/app/
#COPY --chown=was:root myAppDeploy.py dataSourceConfig.py /work/config/
RUN chmod -R 777 /work/app

EXPOSE 9043
EXPOSE 9443

RUN /work/configure.sh
