import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var y1 = 190.0;
    return Column(
      children: [
        Container(
          height: 300,
          width: 300,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 2),
                  bottom: BorderSide(width: 2),
                ),
              ),
              groupsSpace: 3,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(y: 0, width: 5, colors: [Colors.amber]),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(y: y1, width: 5, colors: [Colors.amber]),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(y: 160.0, width: 5, colors: [Colors.amber]),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(y: 100.0, width: 5, colors: [Colors.amber]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
