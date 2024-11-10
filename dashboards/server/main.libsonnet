local g = import 'util/g.libsonnet';
local panel = import 'util/panel.libsonnet';
local query = import 'util/query.libsonnet';
local variable = import 'util/variable.libsonnet';


{
  Dashboard(): g.dashboard.new('server')
    + g.dashboard.withUid('server-dashboard-example')
    + g.dashboard.withDescription('example grafana dashboard created by jsonnet')
    + g.dashboard.graphTooltip.withSharedCrosshair()
    // todo
    // + g.dashboard.withVariables([
    //   variable.datasource('test-datasource'),
    // ])
    + g.dashboard.withPanels(
        g.util.grid.wrapPanels([
          panel.timeseries.bar('Req/min', query.testData.randomWalk)
          + panel.withGridPos(h=10, w=24),
          panel.timeseries.line('Memory Usage', query.testData.randomWalk),
          panel.timeseries.line('CPU Usage', query.testData.randomWalk),
        ], 12, 6)
    )
}
