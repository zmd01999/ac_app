import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:maple/src/entity/statistic/coal_mining.dart';

class SimpleBarChart extends StatelessWidget {
  final seriesList;
  final animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,

    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
          new charts.BasicNumericTickProviderSpec(desiredTickCount: 3)),
      secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
          new charts.BasicNumericTickProviderSpec(desiredTickCount: 3)),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<CoalMining, String>> _createSampleData() {
    final data = [
      CoalMining(
          transactionDate: "2021-08-27",
          sector: '1',
          tonnageShift1: 15.05,
          tonnageShift2: 16.05,
          totalTonnage: 200,
          jmp: 300.00,
          ibs: 0.00,
          achievementJmp: 19.00,
          achievementIbs: 0.00),
    ];

    return [
      new charts.Series<CoalMining, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (CoalMining sales, _) => sales.sector,
        measureFn: (CoalMining sales, _) => sales.totalTonnage,
        data: data,
      ),
    ];
  }
}
