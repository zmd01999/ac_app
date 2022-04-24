import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/entity/statistic/coal_production.dart';
import 'package:maple/src/entity/statistic/elec_consum_entity.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/statistic_screen/chart_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/coal_barging_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/coal_hauling_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/inventory_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/marginal_coal_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/sales_page.dart';
import 'package:maple/src/screens/statistic_screen/subpages/waste_removal_page.dart';
import 'package:maple/provider/elec_consumption_provider.dart';
import 'package:maple/src/widgets/card.dart';
import 'package:maple/src/widgets/globals.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'components/main_themes.dart';

class StatScreen extends StatelessWidget {
  static String routeName = "/stat";

  @override
  Widget build(BuildContext context) {
    var elecConsumProvider = Provider.of<ElecConsumProvider>(context);
    var elecRecentProvider = Provider.of<ElecConsumProvider>(context);

    Stream coalProductionCardStream() async* {
      while (true) {
        await Future.delayed(Duration(seconds: 2));
        var someProduct = await elecConsumProvider.getDataElecProduction();
        yield someProduct;
      }
    }

    Stream coalRecentStream() async* {
      while (true) {
        await Future.delayed(Duration(seconds: 2));
        var someProduct = await elecRecentProvider.getDataRecentTransaction();
        yield someProduct;
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffF9FAFD),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  FutureBuilder<String?>(
                      future: SharedPreferencesUtil.getCache(SharedPreferencesUtil.HEAD_PIC),
                      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                        if(snapshot.hasData){
                          return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data??"",
                            fit: BoxFit.cover,
                            width: 28,
                          );
                        } else {
                          return  Padding(
                            padding: EdgeInsets.only(
                              bottom: 0,
                            ),
                            child: DottedBorder(
                                borderType: BorderType.Circle,
                                radius: Radius.circular(35),
                                color: MyTheme.indigo,
                                child: Container(
                                    height: 28,
                                    width:28,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                    ),
                                )
                            )
                          );
                        }
                      }
                  ),
                  SizedBox(width: 10),
                  FutureBuilder<String?>(
                      future: SharedPreferencesUtil.getUserName(), // a previously-obtained Future<String> or null
                      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '欢迎, '+ snapshot.data.toString(),
                            style: headerTextStyle,
                          );
                        } else {
                          return Text(
                            '欢迎!' ,
                            style: headerTextStyle,
                          );
                        }
                      }),
                  Spacer(),
                  Image.asset('assets/images/notification.png', width: 20),
                ],
              ),
            ),
            SizedBox(height: 24),
            StreamBuilder(
              stream: coalProductionCardStream(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<ElecConsumEntity> data = snapshot.data;
                  double tonnageSectorOne = 0;
                  double tonnageSectorTwo = 0;
                  double tonnageSectorFour = 0;

                  List<String> listProductSectorOne = [];
                  List<String> listProductSectorTwo = [];
                  List<String> listProductSectorFour = [];

                  List listTonnageProductSectorOne = [];
                  List listTonnageProductSectorTwo = [];
                  List listTonnageProductSectorFour = [];

                  data.forEach(
                        (item) {
                      if (item.scene == pitSectorOne) {
                        listProductSectorOne.add(item.product);
                        listTonnageProductSectorOne.add(item.powerConsum);
                      } else if (item.scene == pitSectorTwo) {
                        listProductSectorTwo.add(item.product);
                        listTonnageProductSectorTwo.add(item.powerConsum);
                      } else if (item.scene == pitSectorFour) {
                        listProductSectorFour.add(item.product);
                        listTonnageProductSectorFour.add(item.powerConsum);
                      }
                    },
                  );

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
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InfoCard(
                            CoalProduction(
                              id: 0,
                              pit: pitSectorOne,
                              product: listProductSectorOne
                                  .map((item) => item)
                                  .toString(),
                              tonnage: tonnageSectorOne.toStringAsFixed(2) + " KW",
                            ),
                            listTonnageProductSectorOne
                                .map((e) => e)
                                .toString(),
                          ),
                          InfoCard(
                            CoalProduction(
                              id: 0,
                              pit: pitSectorTwo,
                              product: listProductSectorTwo
                                  .map((item) => item)
                                  .toString(),
                              tonnage: tonnageSectorTwo.toStringAsFixed(2),
                            ),
                            listTonnageProductSectorTwo
                                .map((e) => e)
                                .toString(),
                          ),
                          InfoCard(
                            CoalProduction(
                              id: 0,
                              pit: pitSectorFour,
                              product: listProductSectorFour
                                  .map((item) => item)
                                  .toString(),
                              tonnage: tonnageSectorFour.toStringAsFixed(2),
                            ),
                            listTonnageProductSectorFour
                                .map((e) => e)
                                .toString(),
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
            SizedBox(height: 31),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                '新特性',
                style: headerTextStyle,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 68,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ButtonCard(
                      imageUrl: "assets/icons/trash.png",
                      location: WasteRemovalPage(),
                      label: "Waste Removal",
                    ),
                    SizedBox(width: 18),
                    ButtonCard(
                      imageUrl: "assets/icons/featured_two.png",
                      location: MarginalCoalPage(),
                      label: "Marginal Coal",
                    ),
                    SizedBox(width: 18),
                    ButtonCard(
                      imageUrl: "assets/icons/hauling.png",
                      location: CoalHaulingPage(),
                      label: "Coal Hauling",
                    ),
                    SizedBox(width: 18),
                    ButtonCard(
                      imageUrl: "assets/icons/barging.png",
                      location: CoalBargingPage(),
                      label: "Coal Barging",
                    ),
                    SizedBox(width: 18),
                    ButtonCard(
                      imageUrl: "assets/icons/featured_three.png",
                      location: SalesPage(),
                      label: "Sales",
                    ),
                    SizedBox(width: 18),
                    ButtonCard(
                      imageUrl: "assets/icons/featured_four.png",
                      location: InventoryPage(),
                      label: "Inventory",
                    ),
                    SizedBox(width: 18),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding:
              const EdgeInsets.only(left: 24.0, bottom: 17.0, right: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '最近',
                    style: headerTextStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChartPage()),
                      );
                    },
                    child: Text(
                      '全部',
                      style: subHeaderCardTextStyle.copyWith(
                        color: blackColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            StreamBuilder(
              stream: coalRecentStream(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<ElecConsumEntity> data = snapshot.data;
                  var dateOne = getDateFirstForRecent(flag: "s");
                  var dateTwo = getDateSecondForRecent(flag: "s");

                  return Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "设备运行时能耗产生自 : " +
                              dateOne.substring(12, 20) +
                              " - " +
                              dateTwo.substring(12, 20) +
                              " ",
                          style: subHeaderCardTextStyle.copyWith(
                            color: blackColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 17),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: data.map(
                                (item) {
                              return Column(
                                children: [
                                  CardRecentTransaction(
                                      'assets/icons/arrow_up.png',
                                      item.scene,
                                      item.product,
                                      '+ ' + item.powerConsum.toString()),
                                  SizedBox(height: 16),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(height: 50 + edge),
          ],
        ),
      ),
    );
  }
}
