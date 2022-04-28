import 'package:flutter/material.dart';
import 'package:maple/src/entity/statistic/coal_barging.dart';
import 'package:maple/src/entity/statistic/coal_hauling.dart';
import 'package:maple/src/entity/statistic/coal_production.dart';
import 'package:maple/src/entity/statistic/elec_consum_entity.dart';
import 'package:maple/src/entity/statistic/inventory.dart';
import 'package:maple/src/entity/statistic/marginal_coal.dart';
import 'package:maple/src/entity/statistic/sales.dart';
import 'package:maple/src/entity/statistic/waste_removal.dart';
import 'package:maple/src/screens/statistic_screen/components/main_themes.dart';

class InfoCard extends StatelessWidget {
  final CoalProduction coalProduction;
  final String listTonnageProduct;

  InfoCard(this.coalProduction, this.listTonnageProduct);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 180,
          width: 280,
          color: darkBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coalProduction.pit,
                      style: subHeaderCardTextStyle,
                    ),
                    SizedBox(height: 4),
                    Text(
                      coalProduction.product,
                      style: headerCardTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      listTonnageProduct,
                      style: subHeaderCardTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                color: lightPurple,
                height: 66,
                width: 330,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    // bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: subHeaderCardTextStyle,
                      ),
                      Text(
                        coalProduction.tonnage.toString(),
                        style: headerCardTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCardNew extends StatelessWidget {
  final CoalProduction coalProduction;
  final String listTonnageProduct;

  const InfoCardNew(
      {Key? key,
      required this.coalProduction,
      required this.listTonnageProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 300,
        height: 180,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/card_background.png'),
          ),
          boxShadow: [
            BoxShadow(
              color: lightPurple.withOpacity(0.5),
              blurRadius: 50,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coalProduction.pit,
                        style: subHeaderCardTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        coalProduction.product,
                        style: headerCardTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 41),
            Text(
              'Total',
              style: subHeaderCardTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              coalProduction.tonnage.toString(),
              style: headerCardTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonCard extends StatefulWidget {
  var imageUrl;
  var location;
  var label;

  ButtonCard({this.imageUrl, this.location, this.label});

  @override
  _ButtonCardState createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            (widget.location != null)
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget.location,
                    ),
                  )
                : Container();
          },
          child: Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      widget.imageUrl,
                      width: 32,
                      height: 32,
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.label,
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 8,
                        color: blackColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InventoryOverviewCard extends StatelessWidget {
  // var type;
  final Inventory inventory;
  final type;

  InventoryOverviewCard(this.inventory, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              inventory.aspek,
              style: subHeaderCardTextStyle,
            ),
            Text(
              inventory.qty.toString(),
              style: headerCardTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesOverviewCard extends StatelessWidget {
  // var type;
  final Sales sales;
  final type;
  final valueType;

  SalesOverviewCard(this.sales, this.type, this.valueType);

  @override
  Widget build(BuildContext context) {
    var label = "";
    var tonnage;

    if (valueType == "Daily Plan") {
      label = "Daily (Plan)";
      tonnage = sales.dailyPlan ?? "0";
    } else if (valueType == "Daily Actual") {
      label = "Daily (Actual)";
      tonnage = sales.daily ?? "0";
    } else if (valueType == "Monthly Plan") {
      label = "Monthly (Plan)";
      tonnage = sales.monthly ?? "0";
    } else if (valueType == "Monthly Actual") {
      label = "Monthly (Actual)";
      tonnage = sales.mtd ?? "0";
    } else if (valueType == "Yearly Plan") {
      label = "Yearly (Plan)";
      tonnage = sales.yearly ?? "0";
    } else if (valueType == "Yearly Actual") {
      label = "Yearly (Actual)";
      tonnage = sales.ytd ?? "0";
    } else {
      label = "Unknown";
      tonnage = 0;
    }

    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/Paper.png",
                  height: 28,
                  width: 28,
                ),
                SizedBox(width: 10),
                Text(
                  label,
                  style: subHeaderCardTextStyle.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sales.proses.toString(),
                  style: subHeaderCardTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      double.parse(tonnage).toStringAsFixed(2),
                      style: headerCardTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(Ton)",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoalBargingOverviewCard extends StatelessWidget {
  // var type;
  final CoalBarging coalBarging;
  final type;
  final valueType;

  CoalBargingOverviewCard(this.coalBarging, this.type, this.valueType);

  @override
  Widget build(BuildContext context) {
    var label = "";
    var tonnage;

    if (valueType == "Daily Plan") {
      label = "Daily (Plan)";
      tonnage = coalBarging.dailyPlan ?? "0";
    } else if (valueType == "Daily Actual") {
      label = "Daily (Actual)";
      tonnage = coalBarging.daily ?? "0";
    } else if (valueType == "Monthly Plan") {
      label = "Monthly (Plan)";
      tonnage = coalBarging.monthly ?? "0";
    } else if (valueType == "Monthly Actual") {
      label = "Monthly (Actual)";
      tonnage = coalBarging.mtd ?? "0";
    } else if (valueType == "Yearly Plan") {
      label = "Yearly (Plan)";
      tonnage = coalBarging.yearly ?? "0";
    } else if (valueType == "Yearly Actual") {
      label = "Yearly (Actual)";
      tonnage = coalBarging.ytd ?? "0";
    } else {
      label = "Unknown";
      tonnage = 0;
    }

    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/Paper.png",
                  height: 28,
                  width: 28,
                ),
                SizedBox(width: 10),
                Text(
                  label,
                  style: subHeaderCardTextStyle.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coalBarging.aspek.toString(),
                  style: subHeaderCardTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      double.parse(tonnage).toStringAsFixed(2),
                      style: headerCardTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(Ton)",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardRecentTransaction extends StatelessWidget {
  String imageUrl = "";
  String title = "";
  String time = "";
  String qty = "";

  CardRecentTransaction(this.imageUrl, this.title, this.time, this.qty);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: MediaQuery.of(context).size.width - (2 * edge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF8F9FC),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  imageUrl,
                  width: 34,
                  height: 126,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headerTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  time,
                  style: subHeaderCardTextStyle.copyWith(
                    color: blackColor,
                  ),
                )
              ],
            ),
            // SizedBox(width: 9),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    qty,
                    style: headerTextStyle.copyWith(
                      fontSize: 14,
                      color: darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoalHaulingOverviewCard extends StatelessWidget {
  // var type;
  final CoalHauling coalHauling;
  final type;
  final valueType;

  CoalHaulingOverviewCard(this.coalHauling, this.type, this.valueType);

  @override
  Widget build(BuildContext context) {
    var label;
    var planValue;
    var actualValue;
    var achievementValue;

    if (valueType == "daily") {
      label = "Daily";
      planValue = coalHauling.dailyPlan ?? "0";
      actualValue = coalHauling.daily ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "monthly") {
      label = "Monthly";
      planValue = coalHauling.monthly ?? "0";
      actualValue = coalHauling.mtd ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "yearly") {
      label = "Yearly";
      planValue = coalHauling.yearly ?? "0";
      actualValue = coalHauling.ytd ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else {
      label = "Unknown";
      planValue = "0";
      actualValue = "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    }

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: subHeaderCardTextStyle,
            ),
            SizedBox(height: 5),
            Text(
              "Actual",
              style: subHeaderCardTextStyle,
            ),
            Row(
              children: [
                Text(
                  double.parse(actualValue).toStringAsFixed(2),
                  style: headerCardTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "(Ton)",
                  style: subHeaderCardTextStyle.copyWith(
                    fontSize: 12,
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Plan",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(planValue).toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(Ton)",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 10,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Achievement",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(achievementValue.toString())
                              .toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "%",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MarginalCoalOverviewCard extends StatelessWidget {
  // var type;
  final MarginalCoal marginalCoal;
  final type;
  final valueType;

  MarginalCoalOverviewCard(this.marginalCoal, this.type, this.valueType);

  @override
  Widget build(BuildContext context) {
    var label;
    var planValue;
    var actualValue;
    var achievementValue;

    if (valueType == "daily") {
      label = "Daily";
      planValue = marginalCoal.dailyPlan ?? "0";
      actualValue = marginalCoal.daily ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "monthly") {
      label = "Monthly";
      planValue = marginalCoal.monthly ?? "0";
      actualValue = marginalCoal.mtd ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "yearly") {
      label = "Yearly";
      planValue = marginalCoal.yearly ?? "0";
      actualValue = marginalCoal.ytd ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else {
      label = "Unknown";
      planValue = "0";
      actualValue = "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    }

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: subHeaderCardTextStyle,
            ),
            SizedBox(height: 30),
            Text(
              "Actual",
              style: subHeaderCardTextStyle,
            ),
            Text(
              double.parse(actualValue.toString()).toStringAsFixed(2),
              style: headerCardTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Plan",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(planValue).toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(Ton)",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 10,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Achievement",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(achievementValue.toString())
                              .toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "%",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WasteRemovalOverviewCard extends StatelessWidget {
  // var type;
  final WasteRemoval wasteRemoval;
  final type;
  final valueType;

  WasteRemovalOverviewCard(this.wasteRemoval, this.type, this.valueType);

  @override
  Widget build(BuildContext context) {
    var actualValue;
    var planValue;
    var achievementValue;

    if (valueType == "Daily") {
      actualValue = wasteRemoval.daily ?? "0";
      planValue = wasteRemoval.dailyPlan ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "Monthly") {
      actualValue = wasteRemoval.mtd ?? "0";
      planValue = wasteRemoval.monthly ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else if (valueType == "Yearly") {
      actualValue = wasteRemoval.ytd ?? "0";
      planValue = wasteRemoval.yearly ?? "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    } else {
      actualValue = "0";
      planValue = "0";
      achievementValue =
          (double.parse(actualValue) / double.parse(planValue)) * 100;
    }

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (type == "dark") ? Color(0xff281D60) : Color(0xff55C9F1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wasteRemoval.aspek.toString(),
              style: subHeaderCardTextStyle,
            ),
            SizedBox(height: 30),
            Text(
              "实际",
              style: subHeaderCardTextStyle,
            ),
            Text(
              double.parse(actualValue.toString()).toStringAsFixed(2),
              style: headerCardTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "计划",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(planValue).toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(kW·h)",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 10,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "完成",
                      style: subHeaderCardTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          double.parse(achievementValue.toString())
                              .toStringAsFixed(2),
                          style: headerCardTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "%",
                          style: subHeaderCardTextStyle.copyWith(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardSettingProfile extends StatefulWidget {
  var imageUrl;
  var title;
  var subtitle;
  var location;

  CardSettingProfile({this.imageUrl, this.title, this.subtitle, this.location});

  @override
  _CardSettingProfileState createState() => _CardSettingProfileState();
}

class _CardSettingProfileState extends State<CardSettingProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (widget.location != null)
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.location,
                ),
              )
            : Container();
      },
      child: Container(
        height: 76,
        width: MediaQuery.of(context).size.width - (2 * edge),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffF8F9FC),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    widget.imageUrl,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: headerTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        widget.subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: subHeaderCardTextStyle.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardElecDailyProduction extends StatelessWidget {
  String imageUrl = "";
  final ElecConsumEntity consumEntity;

  CardElecDailyProduction(this.imageUrl, this.consumEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: MediaQuery.of(context).size.width - (2 * edge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF8F9FC),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(imageUrl),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  consumEntity.seam,
                  style: headerTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  consumEntity.product,
                  style: subHeaderCardTextStyle.copyWith(
                    color: blackColor,
                  ),
                )
              ],
            ),
            SizedBox(width: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  consumEntity.powerConsum.toString(),
                  style: headerTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class cardSmallButton extends StatefulWidget {
//   var label = "";
//   var index;

//   cardSmallButton(this.label, this.index);

//   @override
//   _cardSmallButtonState createState() => _cardSmallButtonState();
// }

// class _cardSmallButtonState extends State<cardSmallButton> {
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = this.widget.index;
//                 });
//               },
//               child: Container(
//                 width: 80,
//                 height: 32,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Color(0xffDDDDDD),
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     this.widget.label,
//                     style: GoogleFonts.openSans(fontSize: 14),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 30)
//           ],
//         ),
//       ),
//     );
//   }
// }
