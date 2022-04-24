import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maple/provider/coal_mining_provider.dart';
import 'package:maple/provider/elec_consumption_provider.dart';
import 'package:maple/src/entity/statistic/elec_consum_entity.dart';
import 'package:maple/src/entity/statistic/energy_adv_entity.dart';
import 'package:maple/src/screens/statistic_screen/components/main_themes.dart';
import 'package:maple/src/widgets/card.dart';
import 'package:maple/src/widgets/globals.dart';
import 'package:provider/provider.dart';
import 'bar_chart_second.dart';
import 'line_chart.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class DailyCoalProduction extends StatefulWidget {
  const DailyCoalProduction({Key? key}) : super(key: key);

  @override
  _DailyCoalProductionState createState() => _DailyCoalProductionState();
}

class _DailyCoalProductionState extends State<DailyCoalProduction> {
  DateTime selectedFirstDate = DateTime.now();
  DateTime selectedLastDate = DateTime.now();

  String labelFirstDate = showFirstDateNow();
  String labelLastDate = showLastDateNow();

  Widget totalPowerStream = Container();
  Widget overviewStream = Container();

  Stream elecProductionStream(Duration duration, Future? provider) async* {
    while (true) {
      await Future.delayed(duration); //Duration(milliseconds: 500)
      var someProduct =
          await provider; //coalProductionProvider.getDataCoalProduction()
      yield someProduct;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var prov = Provider.of<ElecConsumProvider>(context, listen: false);

      setState(() {
        totalPowerStream = totalPowerToday(elecProductionStream(
            Duration(milliseconds: 100),
            prov.getDataElecProductionFiltered(labelFirstDate, labelLastDate)));
      });

      overviewStream = overviewToday(elecProductionStream(
          Duration(milliseconds: 100),
          prov.getDataElecProductionFiltered(labelFirstDate, labelLastDate)));
    });

    totalPowerStream = Column(
      children: [
        Center(
          child: Text(
            "还没有数据，请选择您想要显示的日期",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    overviewStream = Column(
      children: [
        Center(
          child: Text(
            "还没有数据，请选择您想要显示的日期",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget totalPowerToday(Stream elecStream) {
    return StreamBuilder(
      stream: elecStream, //coalProductionStream()
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ElecConsumEntity> data = snapshot.data;
          double powerSectorOne = 0;
          double powerSectorTwo = 0;
          double powerSectorFour = 0;

          data.forEach(
            (item) {
              if (item.scene == pitSectorOne) {
                powerSectorOne += item.powerConsum;
              } else if (item.scene == pitSectorTwo) {
                powerSectorTwo += item.powerConsum;
              } else if (item.scene == pitSectorFour) {
                powerSectorFour += item.powerConsum;
              } else {
                powerSectorFour += item.powerConsum;
              }
            },
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                width: 600,
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          Text(
                            pitSectorOne,
                            style: subHeaderCardTextStyle.copyWith(
                                color: blackColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            powerSectorOne.toStringAsFixed(2),
                            style: headerTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          Text(
                            pitSectorTwo,
                            style: subHeaderCardTextStyle.copyWith(
                                color: blackColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            powerSectorTwo.toStringAsFixed(2),
                            style: headerTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          Text(
                            pitSectorFour,
                            style: subHeaderCardTextStyle.copyWith(
                                color: blackColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            powerSectorFour.toStringAsFixed(2),
                            style: headerTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          Text(
                            "Total All",
                            style: subHeaderCardTextStyle.copyWith(
                                color: blackColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            (powerSectorOne +
                                powerSectorTwo +
                                powerSectorFour)
                                .toStringAsFixed(2),
                            style: headerTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget overviewToday(Stream elecStream) {
    return Container(
      height: MediaQuery.of(context).size.width + (50 + edge),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          StreamBuilder(
            stream:
                elecStream, //coalProductionStream(Duration(milliseconds: 500),
            //     coalProductionProvider.getDataCoalProduction()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<ElecConsumEntity> data = snapshot.data;
                int index = 0;
                int type = 0;
                return Column(
                  children: data.map((item) {
                    index++;
                    type = item.scene == pitSectorOne ? 1 : 2;
                    return Container(
                      margin: EdgeInsets.only(
                        top: index == 1 ? 0 : 16,
                      ),
                      child: (type % 2 == 0)
                          ? CardElecDailyProduction(
                              'assets/icons/featured_one.png', item)
                          : CardElecDailyProduction(
                              'assets/icons/featured_one_light.png',
                              item),
                    );
                  }).toList(),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var elecProductionProvider = Provider.of<ElecConsumProvider>(context);
    var energyAdvProvider = Provider.of<EnergyAdvProvider>(context);

    Future<Null> _selectFirstDate(BuildContext context) async {
      final DateTime? picked1 = await showDatePicker(
          context: context,
          initialDate: selectedFirstDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      setState(() {
        selectedFirstDate = picked1!;
        labelFirstDate =
            "${DateFormat('dd MMM yyyy').format(selectedFirstDate.toLocal())}";
      });
    }

    Future<Null> _selectLastDate(BuildContext context) async {
      final DateTime? picked2 = await showDatePicker(
          context: context,
          initialDate: selectedLastDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      setState(() {
        selectedLastDate = picked2!;
        labelLastDate =
            "${DateFormat('dd MMM yyyy').format(selectedLastDate.toLocal())}";

        totalPowerStream = totalPowerToday(elecProductionStream(
            Duration(milliseconds: 100),
            elecProductionProvider.getDataElecProductionFiltered(
                labelFirstDate, labelLastDate)));

        overviewStream = overviewToday(elecProductionStream(
            Duration(milliseconds: 100),
            elecProductionProvider.getDataElecProductionFiltered(
                labelFirstDate, labelLastDate)));
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '今日总能耗',
              style: normalTextStyle,
            ),
            GestureDetector(
              onTap: () => _selectFirstDate(context),
              child: Text(
                labelFirstDate,
                style: normalTextStyle.copyWith(
                  fontSize: 10,
                  color: darkBlue,
                ),
              ),
            ),
            Text(
              '-',
              style: normalTextStyle,
            ),
            GestureDetector(
              onTap: () => _selectLastDate(context),
              child: Text(
                labelLastDate,
                style: normalTextStyle.copyWith(
                  fontSize: 10,
                  color: darkBlue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        totalPowerStream,
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '能耗优化情况',
              style: headerTextStyle,
            ),
            Text(
              getDateToday(flag: "flag"),
              style: normalTextStyle,
            ),
          ],
        ),
        SizedBox(height: 23),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Energy Consumption Overview",
                  style: subHeaderCardTextStyle.copyWith(
                    fontSize: 10,
                    color: blackColor,
                  ),
                ),
                LegendChart(pinkColor, "TOTAL"),
                LegendChart(blueColor, "SMART"),
                LegendChart(greyColor, "TRAD"),
                SizedBox(height: 30),
              ],
            ),
            FutureBuilder(
              future: energyAdvProvider.getDataEnergyAdv(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<EnergyAdvEntity> data = snapshot.data;
                  List bunchOfDatatotalSector1 = [];
                  List bunchOfDatajmpSector1 = [];
                  List bunchOfDataibsSector1 = [];

                  List bunchOfDatatotalSector2 = [];
                  List bunchOfDatajmpSector2 = [];
                  List bunchOfDataibsSector2 = [];

                  List bunchOfDatatotalSector4 = [];
                  List bunchOfDatajmpSector4 = [];
                  List bunchOfDataibsSector4 = [];

                  double totalTotal = 0;
                  double totalJmp = 0;
                  double totalIbs = 0;

                  List bunchOfDatatotalSectorTotal = [];
                  List bunchOfDatajmpSectorTotal = [];
                  List bunchOfDataibsSectorTotal = [];

                  bunchOfDatatotalSector1.add(0);
                  bunchOfDatajmpSector1.add(0);
                  bunchOfDataibsSector1.add(0);
                  bunchOfDatatotalSector2.add(0);
                  bunchOfDatajmpSector2.add(0);
                  bunchOfDataibsSector2.add(0);
                  bunchOfDatatotalSector4.add(0);
                  bunchOfDatajmpSector4.add(0);
                  bunchOfDataibsSector4.add(0);

                  data.forEach(
                    (item) {
                      totalTotal += item.powerConsum ?? 0;
                      totalJmp += item.smartConsum ?? 0;
                      totalIbs += item.tradConsum ?? 0;

                      if (item.scene == pitSectorOne) {

                        int index = bunchOfDataibsSector1.length - 1;
                        bunchOfDatatotalSector1.add(bunchOfDatatotalSector1[index] + item.powerConsum);
                        bunchOfDatajmpSector1.add(bunchOfDatatotalSector1[index] + item.smartConsum);
                        bunchOfDataibsSector1.add(bunchOfDatatotalSector1[index] + item.tradConsum);
                      } else if (item.scene == pitSectorTwo) {

                        int index = bunchOfDataibsSector2.length - 1;

                        bunchOfDatatotalSector2.add(bunchOfDatatotalSector2[index] + item.powerConsum);
                        bunchOfDatajmpSector2.add(bunchOfDatatotalSector2[index] + item.smartConsum);
                        bunchOfDataibsSector2.add(bunchOfDatatotalSector2[index] + item.tradConsum);
                      } else if (item.scene == pitSectorFour) {

                        int index = bunchOfDataibsSector4.length - 1;

                        bunchOfDatatotalSector4.add(bunchOfDatatotalSector4[index] +item.powerConsum);
                        bunchOfDatajmpSector4.add(bunchOfDatatotalSector4[index] + item.smartConsum);
                        bunchOfDataibsSector4.add(bunchOfDatatotalSector4[index] + item.tradConsum);
                      } else {
                        bunchOfDatatotalSector1.add(0);
                        bunchOfDatajmpSector1.add(0);
                        bunchOfDataibsSector1.add(0);

                        bunchOfDatatotalSector1.add("0");
                        bunchOfDatajmpSector1.add("0");
                        bunchOfDataibsSector1.add("0");

                        bunchOfDatatotalSector2.add(0);
                        bunchOfDatajmpSector2.add(0);
                        bunchOfDataibsSector2.add(0);

                        bunchOfDatatotalSector2.add("0");
                        bunchOfDatajmpSector2.add("0");
                        bunchOfDataibsSector2.add("0");
                      }
                    },
                  );

                  bunchOfDatatotalSectorTotal.add(0);
                  bunchOfDatajmpSectorTotal.add(0);
                  bunchOfDataibsSectorTotal.add(0);

                  bunchOfDatatotalSectorTotal.add(totalTotal);
                  bunchOfDatajmpSectorTotal.add(totalJmp);
                  bunchOfDataibsSectorTotal.add(totalIbs);

                  return Container(
                    height: 200,
                    width: 300,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color(0xff020227),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CoalMiningLineChart(
                                0,
                                70,
                                14,
                                ["0","Sector1"],
                                bunchOfDatatotalSector1,
                                bunchOfDatajmpSector1,
                                bunchOfDataibsSector1,
                                maxX: bunchOfDatatotalSector1.length - 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color(0xff020227),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CoalMiningLineChart(
                                0,
                                70,
                                14,
                                ["0", "Sector2"],
                                bunchOfDatatotalSector2,
                                bunchOfDatajmpSector2,
                                bunchOfDataibsSector2,
                                maxX: bunchOfDatatotalSector2.length - 1.0,

                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color(0xff020227),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CoalMiningLineChart(
                                0,
                                70,
                                14,
                                ["0", "Sector4"],
                                bunchOfDatatotalSector4,
                                bunchOfDatajmpSector4,
                                bunchOfDataibsSector4,
                                maxX: bunchOfDatatotalSector4.length - 1.0,

                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color(0xff020227),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CoalMiningLineChart(
                                0,
                                500,
                                100,
                                ["0", "Total"],
                                bunchOfDatatotalSectorTotal,
                                bunchOfDatajmpSectorTotal,
                                bunchOfDataibsSectorTotal,
                                maxX: bunchOfDatatotalSectorTotal.length - 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 40),
        FutureBuilder(
          future: energyAdvProvider.getDataEnergyAdv(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<EnergyAdvEntity> data = snapshot.data;
              double totalTotal = 0;
              double totalJmp = 0;
              double totalIbs = 0;

              List<charts.Series<EnergyAdvEntity, String>> _createDataSector1() {
                List<EnergyAdvEntity> dataTotal = [];

                data.forEach(
                  (item) {
                    totalTotal += item.powerConsum ?? 0;
                    totalJmp +=  item.smartConsum ?? 0;
                    totalIbs +=  item.tradConsum ?? 0;

                    if (item.scene == pitSectorOne) {
                      dataTotal = [
                        new EnergyAdvEntity(
                        powerConsum: item.powerConsum,
                        smartConsum:  item.smartConsum,
                        tradConsum: item.tradConsum,
                      ),
                      //   new OrdinalSales("TOTAL", item.powerConsum ?? 0,charts.MaterialPalette.pink.shadeDefault),
                      //   new OrdinalSales("SMART", item.smartConsum ?? 0, charts.MaterialPalette.blue.shadeDefault),
                      //   new OrdinalSales("TRAD", item.tradConsum ?? 0, charts.MaterialPalette.gray.shadeDefault)

                      ];

                    }
                  },
                );

                return [
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TOTAL',
                    colorFn: (EnergyAdvEntity sales, __) =>
                    charts.MaterialPalette.pink.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TOTAL",
                    measureFn: (EnergyAdvEntity sales, _) => sales.powerConsum,
                    data: dataTotal,
                ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'SMART',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "SMART",
                    measureFn: (EnergyAdvEntity sales, _) => sales.smartConsum,
                    data: dataTotal,
                  ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TRAD',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.gray.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TRAD",
                    measureFn: (EnergyAdvEntity sales, _) => sales.tradConsum,
                    data: dataTotal,
                  )

                ];
              }

              List<charts.Series<EnergyAdvEntity, String>> _createDataSector2() {
                List<EnergyAdvEntity> dataTotal2 = [];
                data.forEach(
                  (item) {
                    if (item.scene == pitSectorTwo) {
                      dataTotal2 = [
                        new EnergyAdvEntity(
                          powerConsum: item.powerConsum,
                          smartConsum: item.smartConsum,
                          tradConsum: item.tradConsum,

                        ),
                      ];
                    }
                  },
                );

                return [
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TOTAL',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.pink.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TOTAL",
                    measureFn: (EnergyAdvEntity sales, _) => sales.powerConsum,
                    data: dataTotal2,
                  ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'SMART',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "SMART",
                    measureFn: (EnergyAdvEntity sales, _) => sales.smartConsum,
                    data: dataTotal2,
                  ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TRAD',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.gray.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TRAD",
                    measureFn: (EnergyAdvEntity sales, _) => sales.tradConsum,
                    data: dataTotal2,
                  )
                ];
              }

              List<charts.Series<EnergyAdvEntity, String>> _createDataSectorTotal() {
                List<EnergyAdvEntity> dataTotalTotal = [];

                data.forEach(
                  (item) {
                    totalTotal += item.powerConsum ?? 0;
                    totalJmp += item.smartConsum ?? 0;
                    totalIbs += item.tradConsum ?? 0;

                    dataTotalTotal = [
                      new EnergyAdvEntity(
                        powerConsum: totalTotal,
                        smartConsum: totalJmp,
                        tradConsum: totalIbs,
                      ),
                    ];
                  },
                );

                return [
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TOTAL',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.pink.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TOTAL",
                    measureFn: (EnergyAdvEntity sales, _) => sales.powerConsum,
                    data: dataTotalTotal,
                  ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'SMART',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "SMART",
                    measureFn: (EnergyAdvEntity sales, _) => sales.smartConsum,
                    data: dataTotalTotal,
                  ),
                  new charts.Series<EnergyAdvEntity, String>(
                    id: 'TRAD',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.gray.shadeDefault,
                    domainFn: (EnergyAdvEntity sales, _) => "TRAD",
                    measureFn: (EnergyAdvEntity sales, _) => sales.tradConsum,
                    data: dataTotalTotal,
                  )
                ];
              }

              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: (model) {
                  print('Change in ${model.selectedDatum.first.datum}');
                },
                updatedListener: (model) {
                  print('updatedListener in $model');
                },
              );

              return Container(
                height: 260,
                width: 380,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: energyAdvProvider.getDataEnergyAdv(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var actualSector1;
                                    var jmpSector1;
                                    var ibsSector1;

                                    data.forEach(
                                      (item) {
                                        if (item.scene == pitSectorOne) {
                                          actualSector1 =
                                              item.powerConsum;
                                          jmpSector1 = item.smartConsum ;
                                          ibsSector1 = item.tradConsum ?? "0";
                                        } else if (item.scene == pitSectorTwo) {
                                        } else {
                                          actualSector1 = "0";
                                          jmpSector1 = "0";
                                          ibsSector1 = "0";
                                        }
                                      },
                                    );

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Actual : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          actualSector1.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "SMART : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          jmpSector1.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "TRAD : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          ibsSector1.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 260,
                                  height: 180,
                                  child: SimpleBarChart(
                                    _createDataSector1(),
                                    // Disable animations for image tests.
                                    animate: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: energyAdvProvider.getDataEnergyAdv(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var actualSector2;
                                    var jmpSector2;
                                    var ibsSector2;

                                    data.forEach(
                                      (item) {
                                        if (item.scene == pitSectorTwo) {
                                          actualSector2 =
                                              item.powerConsum;
                                          jmpSector2 = item.smartConsum;
                                          ibsSector2 = item.tradConsum ?? 0;
                                        } else if (item.scene ==
                                            pitSectorOne) {
                                        } else {
                                          actualSector2 = "0";
                                          jmpSector2 = "0";
                                          ibsSector2 = "0";
                                        }
                                      },
                                    );

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Actual : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          actualSector2.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "SMART : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          jmpSector2.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "TRAD : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          ibsSector2.toString(),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 260,
                                  height: 180,
                                  child: SimpleBarChart(
                                    _createDataSector2(),
                                    // Disable animations for image tests.
                                    animate: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: energyAdvProvider.getDataEnergyAdv(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var actualSectorTotal = 0.00;
                                    var jmpSectorTotal = 0.00;
                                    var ibsSectorTotal = 0.00;

                                    data.forEach(
                                      (item) {
                                        actualSectorTotal += item.powerConsum ?? 0;
                                        jmpSectorTotal += item.smartConsum ?? 0;
                                        ibsSectorTotal += item.tradConsum ?? 0;
                                      },
                                    );

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Actual : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          actualSectorTotal.toStringAsFixed(2),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "SMART : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          jmpSectorTotal.toStringAsFixed(2),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "TRAD : ",
                                          style: subHeaderCardTextStyle
                                              .copyWith(color: blackColor),
                                        ),
                                        Text(
                                          ibsSectorTotal.toStringAsFixed(2),
                                          style:
                                              subHeaderCardTextStyle.copyWith(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 260,
                                  height: 180,
                                  child: SimpleBarChart(
                                    _createDataSectorTotal(),
                                    // Disable animations for image tests.
                                    animate: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        SizedBox(height: 40),
        Text(
          '概况',
          style: normalTextStyle,
        ),
        SizedBox(height: 16),
        overviewStream
      ],
    );
  }
}
class OrdinalSales {
  final String domain;
  final double measure;
  final charts.Color color;
  OrdinalSales(this.domain, this.measure, this.color);
}