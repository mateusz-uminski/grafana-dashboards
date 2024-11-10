{
  dashboards: {
    new(name="default", folder="", dir="/etc/grafana/provisioning/dashboards"): {
      apiVersion: 1,
      providers: [
        {
          name: name,
          orgId: 1,
          folder: folder,
          type: "file",
          disableDeletion: false,
          editable: true,
          updateIntervalSeconds: 10,
          options: {
            path: dir,
          },
        },
      ],
    },
  },

  datasources: {
    new(): {
      apiVersion: 1,
      datasources: [],
    },

    withTestDataSource(): {
      datasources+: [
        {
          name: "test-datasource",
          type: "grafana-testdata-datasource",
        },
      ],
    },

    withPrometheus(name, address, default): {
      list+: [
        {
          name: name,
          type: "prometheus",
          url: address,
          access: "server",
          basicAuth: false,
          isDefault: default,
        },
      ],
    },
  },
}
