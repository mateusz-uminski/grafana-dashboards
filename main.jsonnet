local dashboards = import "dashboards/main.libsonnet";
local provisioning = import "util/provisioning.libsonnet";

{
  # provisioning
  'dashboards/dashboards.yaml': std.manifestYamlDoc(
    provisioning.dashboards.new(),
    indent_array_in_object=true,
    quote_keys=false,
  ),
  'datasources/datasources.yaml': std.manifestYamlDoc(
    provisioning.datasources.new()
    + provisioning.datasources.withTestDataSource()
    + provisioning.datasources.withPrometheus(
      "prometheus",
      "prometheus:9090",
      false,
    ),
    indent_array_in_object=true,
    quote_keys=false,
  ),

  # dashbaords
  ## root dir
  'dashboards/server-dashboard.json': std.manifestJson(dashboards.server.Dashboard()),
  'dashboards/pod-dashboard.json': std.manifestJson(dashboards.pod.Dashboard()),
}
