import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/statistic_screen/components/main_themes.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xffFB3DC6),
    const Color(0xff55C9F1),
  ];

  final minimalValue;
  final maximalValue;
  final steps;
  final horizontalTitles;
  final bunchOfData;

  LineChartWidget(this.minimalValue, this.maximalValue, this.steps,
      this.horizontalTitles, this.bunchOfData);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsData = this.bunchOfData.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 490,
        width: 600,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 8,
            minY: 0,
            maxY: 4,
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCases = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
                  for (var i = 0; i <= this.horizontalTitles.length; i++) {
                    if (value.toInt() == numCases[i]) {
                      return this.horizontalTitles[i];
                    }
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCase = [0, 1, 2, 3, 4, 5];

                  List verticalTitles = [];
                  for (var i = this.minimalValue.toInt();
                      i <= this.maximalValue.toInt();
                      i = i + this.steps.toInt()) {
                    verticalTitles.add(i);
                  }

                  for (var j = 0; j <= verticalTitles.length; j++) {
                    if (value.toInt() == numCase[j]) {
                      return verticalTitles[j].toString();
                    }
                  }
                  return '';
                },
                reservedSize: 28,
                margin: 28,
              ),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spotsData,
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesLineChart extends StatelessWidget {
  final List<Color> gradientColorTwo = [
    const Color(0xffB6E7F8),
    const Color(0xff55C9F1),
  ];

  final List<Color> gradientColors = [
    const Color(0xffFB3DC6),
    const Color(0xffFF96E2),
  ];

  final minimalValue;
  final maximalValue;
  final steps;
  final horizontalTitles;
  final bunchOfData;
  final bunchOfDataTwo;

  SalesLineChart(this.minimalValue, this.maximalValue, this.steps,
      this.horizontalTitles, this.bunchOfData, this.bunchOfDataTwo);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsData = this.bunchOfData.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    List<FlSpot> spotsDataTwo =
        this.bunchOfDataTwo.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 490,
        width: 230,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 2,
            minY: 0,
            maxY: 5,
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCases = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
                  for (var i = 0; i <= this.horizontalTitles.length; i++) {
                    if (value.toInt() == numCases[i]) {
                      return this.horizontalTitles[i];
                    }
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
                getTitles: (value) {
                  List numCase = [0, 1, 2, 3, 4, 5];

                  List verticalTitles = [];
                  for (var i = this.minimalValue.toInt();
                      i <= this.maximalValue.toInt();
                      i = i + this.steps.toInt()) {
                    verticalTitles.add(i);
                  }

                  for (var j = 0; j <= verticalTitles.length; j++) {
                    if (value.toInt() == numCase[j]) {
                      return verticalTitles[j].toString();
                    }
                  }
                  return '';
                },
                reservedSize: 16,
                margin: 28,
              ),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spotsData,
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
              LineChartBarData(
                spots: spotsDataTwo,
                isCurved: true,
                colors: gradientColorTwo,
                barWidth: 5,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColorTwo
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoalBargingLineChart extends StatelessWidget {
  final List<Color> gradientColorTwo = [
    const Color(0xffB6E7F8),
    const Color(0xff55C9F1),
  ];

  final List<Color> gradientColors = [
    const Color(0xffFB3DC6),
    const Color(0xffFF96E2),
  ];

  final minimalValue;
  final maximalValue;
  final steps;
  final horizontalTitles;
  final bunchOfDataPlan;
  final bunchOfDataActual;

  CoalBargingLineChart(this.minimalValue, this.maximalValue, this.steps,
      this.horizontalTitles, this.bunchOfDataPlan, this.bunchOfDataActual);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsData =
        this.bunchOfDataPlan.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    List<FlSpot> spotsDataActual =
        this.bunchOfDataActual.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 490,
        width: 230,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 2,
            minY: 0,
            maxY: 8,
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCases = [0, 1, 2, 3];
                  for (var i = 0; i <= this.horizontalTitles.length; i++) {
                    if (value.toInt() == numCases[i]) {
                      return this.horizontalTitles[i];
                    }
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCase = [0, 1, 2, 3, 4, 5, 6, 7, 8];

                  List verticalTitles = [];
                  for (var i = this.minimalValue.toInt();
                      i <= this.maximalValue.toInt();
                      i = i + this.steps.toInt()) {
                    verticalTitles.add(i);
                  }

                  for (var j = 0; j <= verticalTitles.length; j++) {
                    if (value.toInt() == numCase[j]) {
                      return verticalTitles[j].toString();
                    }
                  }
                  return '';
                },
                reservedSize: 28,
                margin: 28,
              ),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spotsData,
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
              LineChartBarData(
                spots: spotsDataActual,
                isCurved: true,
                colors: gradientColorTwo,
                barWidth: 5,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColorTwo
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendChart extends StatelessWidget {
  final color;
  final label;

  LegendChart(this.color, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: subHeaderCardTextStyle.copyWith(
              color: blackColor,
              fontSize: 8,
            ),
          )
        ],
      ),
    );
  }
}

class CoalMiningLineChart extends StatelessWidget {
  final List<Color> gradientColorTwo = [
    const Color(0xffB6E7F8),
    const Color(0xff55C9F1),
  ];

  final List<Color> gradientColors = [
    const Color(0xffFB3DC6),
    const Color(0xffFF96E2),
  ];

  final List<Color> gradientColorsThree = [
    const Color(0xffD0D1D4),
    const Color(0xffD0D1D4),
  ];

  final minimalValue;
  final maximalValue;
  final steps;
  final horizontalTitles;
  final bunchOfData;
  final bunchOfDataTwo;
  final bunchOfDataThree;
  final maxX;

  CoalMiningLineChart(
    this.minimalValue,
    this.maximalValue,
    this.steps,
    this.horizontalTitles,
    this.bunchOfData,
    this.bunchOfDataTwo,
    this.bunchOfDataThree,
  {
    this.maxX
  }
  );

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsData = this.bunchOfData.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    List<FlSpot> spotsDataTwo =
        this.bunchOfDataTwo.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    List<FlSpot> spotsDataThree =
        this.bunchOfDataThree.asMap().entries.map<FlSpot>((e) {
      var result = double.parse("${e.value ?? 0}").toDouble() / steps;
      return FlSpot(e.key.toDouble(), result);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 490,
        width: 230,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: maxX ?? 1,
            minY: 0,
            maxY: 5,
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 10,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                getTitles: (value) {
                  List numCases = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
                  for (var i = 0; i <= this.horizontalTitles.length; i++) {
                    if (value.toInt() == 0) return this.horizontalTitles[0];
                    if (value.toInt() == numCases[bunchOfData.length - 1]) {
                      return this.horizontalTitles[1];
                    } else return "";
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
                getTitles: (value) {
                  List numCase = [0, 1, 2, 3, 4, 5];

                  List verticalTitles = [];
                  for (var i = this.minimalValue.toInt();
                      i <= this.maximalValue.toInt();
                      i = i + this.steps.toInt()) {
                    verticalTitles.add(i);
                  }

                  for (var j = 0; j <= verticalTitles.length; j++) {
                    if (value.toInt() == numCase[j]) {
                      return verticalTitles[j].toString();
                    }
                  }
                  return '';
                },
                reservedSize: 16,
                margin: 28,
              ),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: false,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spotsData,
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                dotData: FlDotData(show: true, checkToShowDot:(FlSpot spot, LineChartBarData barData){
                  if (spot.hashCode == spotsData[0].hashCode || spot.hashCode == spotsData[spotsData.length - 1].hashCode) {
                    return true;
                  } else return false;

                }),
                showingIndicators: <int>[1,2,3,4],
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
              LineChartBarData(
                spots: spotsDataTwo,
                isCurved: true,
                colors: gradientColorTwo,
                barWidth: 4,
                dotData: FlDotData(show: true, checkToShowDot:(FlSpot spot, LineChartBarData barData){
                  if (spot.hashCode == spotsDataTwo[0].hashCode || spot.hashCode == spotsDataTwo[spotsDataTwo.length - 1].hashCode) {
                    return true;
                  } else return false;

                }),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColorTwo
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
              LineChartBarData(
                spots: spotsDataThree,
                isCurved: true,
                colors: gradientColorsThree,
                barWidth: 4,
                dotData: FlDotData(show: true, checkToShowDot:(FlSpot spot, LineChartBarData barData){
                  if (spot.hashCode == spotsDataThree[0].hashCode || spot.hashCode == spotsDataThree[spotsDataThree.length - 1].hashCode) {
                    return true;
                  } else return false;

                }),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColorsThree
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
