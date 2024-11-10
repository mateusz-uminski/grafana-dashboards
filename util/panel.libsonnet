local g = import 'g.libsonnet';

{
  timeseries: {
    base(title, targets):
      g.panel.timeSeries.new(title)
      + g.panel.timeSeries.gridPos.withH(8)
      + g.panel.timeSeries.gridPos.withW(12)
      + g.panel.timeSeries.queryOptions.withInterval("5m")
      + g.panel.timeSeries.queryOptions.withTargets(targets),

    line(title, targets):
      self.base(title, targets)
      + g.panel.timeSeries.standardOptions.withDecimals(0),

    bar(title, targets, interval=null):
      self.base(title, targets)
      + g.panel.timeSeries.standardOptions.withDecimals(0)
      + g.panel.timeSeries.fieldConfig.defaults.custom.withDrawStyle('bars')
      + g.panel.timeSeries.fieldConfig.defaults.custom.withFillOpacity(100),
  },

  withGridPos(h, w): {
    gridPos+: {
      h: h,
      w: w,
    }
  },
}
