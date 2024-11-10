FROM jsonnet:local AS build

WORKDIR /
COPY . .
RUN jb install \
    && jsonnet -J vendor/ -S main.jsonnet -cm out/

FROM grafana/grafana:11.1.0

# dashboards
COPY --from=build --chown=472:0 /out/dashboards /etc/grafana/provisioning/dashboards/
# datasources
COPY --from=build --chown=472:0 /out/datasources /etc/grafana/provisioning/datasources/

ENTRYPOINT [ "/run.sh" ]
