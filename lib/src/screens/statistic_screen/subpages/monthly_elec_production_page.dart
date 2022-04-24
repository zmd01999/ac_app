import 'package:flutter/material.dart';
import 'package:maple/src/entity/statistic/coal_production.dart';
import 'package:maple/provider/elec_consumption_provider.dart';
import 'package:maple/src/entity/statistic/elec_consum_entity.dart';
import 'package:maple/src/screens/statistic_screen/components/main_themes.dart';
import 'package:maple/src/widgets/card.dart';
import 'package:maple/src/widgets/globals.dart';
import 'package:provider/provider.dart';

class MonthlyCoalProduction extends StatefulWidget {
  const MonthlyCoalProduction({Key? key}) : super(key: key);

  @override
  _MonthlyCoalProductionState createState() => _MonthlyCoalProductionState();
}

class _MonthlyCoalProductionState extends State<MonthlyCoalProduction> {
  Widget myStream = Container();
  Widget overviewStream = Container();

  String defaultMonth = showDateNow();
  List<String> monthName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var prov = Provider.of<ElecConsumProvider>(context, listen: false);

      setState(() {
        myStream = totalPower(elecMonthlyProductionStream(
            Duration(milliseconds: 100),
            prov.getDataMonthlyElecProductionFiltered(defaultMonth)));

        overviewStream = overview(elecMonthlyProductionStream(
            Duration(milliseconds: 100),
            prov.getDataMonthlyElecProductionFiltered(defaultMonth)));
      });

    });

    myStream = Column(
      children: [
        Center(
          child: Text(
            "还没有数据，请选择您想要显示的月份",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    overviewStream = Column(
      children: [
        Center(
          child: Text(
            "还没有数据，请选择您想要显示的月份",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Stream elecMonthlyProductionStream(
      Duration duration, Future? provider) async* {
    while (true) {
      await Future.delayed(duration);
      var someProduct = await provider;
      yield someProduct;
    }
  }

  Widget totalPower(Stream elecStream) {
    return StreamBuilder(
      stream: elecStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ElecConsumEntity> data = snapshot.data;
          double tonnageSectorOne = 0;
          double tonnageSectorTwo = 0;
          double tonnageSectorFour = 0;

          data.forEach(
            (item) {
              if (item.scene == pitSectorOne) {
                tonnageSectorOne += item.powerConsum;
              } else if (item.scene == pitSectorTwo) {
                tonnageSectorTwo += item.powerConsum;
              } else if (item.scene == pitSectorFour) {
                tonnageSectorFour += item.powerConsum;
              }
            },
          );

          return Container(
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
                        style:
                            subHeaderCardTextStyle.copyWith(color: blackColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        tonnageSectorOne.toStringAsFixed(2),
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
                        style:
                            subHeaderCardTextStyle.copyWith(color: blackColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        tonnageSectorTwo.toStringAsFixed(2),
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
                        style:
                            subHeaderCardTextStyle.copyWith(color: blackColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        tonnageSectorFour.toStringAsFixed(2),
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
                        style:
                            subHeaderCardTextStyle.copyWith(color: blackColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        (tonnageSectorOne +
                                tonnageSectorTwo +
                                tonnageSectorFour)
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
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget overview(Stream elecStream) {
    return Container(
      height: MediaQuery.of(context).size.height + (50 + edge),
      child: ListView(children: [
        StreamBuilder(
            stream: elecStream,
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
            }),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var elecConsumProvider = Provider.of<ElecConsumProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '月度能耗总量',
                style: normalTextStyle,
              ),
              DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down, size: 18),
                items: monthName.map((String map) {
                  return new DropdownMenuItem<String>(
                    value: map,
                    child: new Text(
                      map,
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 10,
                        color: blackColor,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    defaultMonth = newValue.toString();
                  });

                  myStream = totalPower(elecMonthlyProductionStream(
                      Duration(milliseconds: 100),
                      elecConsumProvider
                          .getDataMonthlyElecProductionFiltered(defaultMonth)));

                  overviewStream = overview(elecMonthlyProductionStream(
                      Duration(milliseconds: 100),
                      elecConsumProvider
                          .getDataMonthlyElecProductionFiltered(defaultMonth)));
                },
                value: defaultMonth,
              )
            ],
          ),
          SizedBox(height: 15),
          myStream,
          SizedBox(height: 40),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Inventory Chart',
          //       style: normalTextStyle,
          //     ),
          //     Text(
          //       '07 Agustus 2021',
          //       style: normalTextStyle,
          //     ),
          //   ],
          // ),
          // SizedBox(height: 23),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(14),
          //     color: whiteColor,
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Image.asset('assets/icons/example_chart.png'),
          //   ),
          // ),
          // SizedBox(height: 43),
          Text(
            '概况',
            style: normalTextStyle,
          ),
          SizedBox(height: 16),
          overviewStream,
        ],
      ),
    );
  }
}
