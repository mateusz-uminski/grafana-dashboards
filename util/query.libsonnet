local g = import 'g.libsonnet';

{
  testData: {
    randomWalk:
      g.query.testData.withRefId('test')
      + g.query.testData.withQueryType('randomWalk')
      + g.query.testData.withIntervalMs(18000000) // 30min
      + g.query.testData.withDatasource()
        + g.query.testData.datasource.withUid('test-datasource'),
  }

  // todo
  // prometheus: {
  //   requestsPerMinute:
  //     g.query.prometheus.new(
  //     )
  // }
}
