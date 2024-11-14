FROM icr.io/appcafe/websphere-traditional:latest

ENV ENABLE_BASIC_LOGGING=true

LABEL authors="tarun"

#COPY --chown=was:root was-config.props /work/config/
COPY --chown=was:root myapp.war /work/app/
#COPY --chown=was:root myAppDeploy.py dataSourceConfig.py /work/config/

EXPOSE 9043

RUN /work/configure.sh
