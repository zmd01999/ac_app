import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/all_list.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/bolt.dart';
import 'components/custom_list.dart';
import 'components/custom_switch.dart';

class DeviceTotal extends StatefulWidget {
  static String routeName = "/device";

  @override
  _deviceTotalState createState() => _deviceTotalState();
}

class _deviceTotalState extends State<DeviceTotal> {
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;

  bool isOpenedTotal = false;
  // bool isOpened = false;

  bool menuOpen = true;
  bool textCtrl = false;

  String _animation = "open";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      width: w,
                      height: menuOpen ? 315 : 300,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      height: menuOpen ? 180 : 130,
                    ),
                    // ...tiles.map((e) {
                    //   return  CustomListTile(
                    //     w: w,
                    //     img: e.img,
                    //     title: e.title,
                    //     subtitle: e.subtitle,
                    //     onTap: (){
                    //       setState(() {
                    //         print("ontap");
                    //       });
                    //
                    //     },
                    //
                    //   );
                    // }).toList(),
                    AllList(w: w, totalSwitch: menuOpen,),
                    SizedBox(height: 36),
                    Container(
                      width: 54,
                      height: 54,
                      child: Center(
                        child: Icon(Icons.add, color: MyTheme.grey),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: MyTheme.lightGrey,
                          width: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Add New Device",
                      style: TextStyle(
                        color: MyTheme.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              ),
            ),
            //彩色边框
            AnimatedContainer(
              duration: Duration(milliseconds: 240),
              width: w,
              height: menuOpen ? 400 : 360,
              color: MyTheme.indigo,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 240),
                    left: menuOpen ? 220 : (w - 300) / 2,
                    top: menuOpen ? -160 : -165,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      width: menuOpen ? 900 : 300,
                      height: menuOpen ? 900 : 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyTheme.mainC,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? -100 : 66,
              left: 156,
              child: Container(
                width: 32,
                height: 32,
                child: Image.asset(
                  "assets/images/cloud.png",
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? -100 : 66,
              left: 230,
              child: Container(
                width: 64,
                height: 64,
                child: Image.asset(
                  "assets/images/cloud.png",
                  color: Colors.white,
                ),
              ),
            ),
            //! Bolts
            ...bolts.map((e) {
              return BoltWidget(
                menuOpen: menuOpen,
                w: w,
                boltModel: e,
              );
            }).toList(),
            //! Flare
            Positioned(
              top: 40,
              left: 0,
              child: Container(
                width: w,
                height: 360,
                child: FlareActor(
                  "assets/images/hero.flr",
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  animation: _animation,
                ),
              ),
            ),
            //字体
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? 320 : 164,
              left: 0,
              child: Container(
                width: w,
                child: AnimatedPadding(
                  duration: Duration(milliseconds: 360),
                  padding: EdgeInsets.symmetric(horizontal: textCtrl ? 12 : 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Stan's",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Office",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 54 : 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "23 indoor",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Door closed",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //! Gateway
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? 320 : 240,
              left: 24,
              child: Container(
                width: w - 48,
                height: 200,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (w - 40) / 2,
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/device2.png"),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(24),
                        ),
                      ),
                    ),
                    Container(
                      width: (w - 56) / 2,
                      height: 240,
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          SizedBox(height: 24),
                          Text(
                            "空调",
                            style: TextStyle(
                              color: MyTheme.textColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: MyTheme.grey,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 52),
                            child: Divider(
                              height: 2,
                              color: MyTheme.lightGrey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Alarming",
                            style: TextStyle(
                              color: MyTheme.grey,
                              fontSize: 22,
                            ),
                          ),
                          Spacer(),
                          CustomSwitch(
                            isOpened: menuOpen,
                            onTap: () {
                              if (menuOpen) {
                                setState(() {
                                  _animation = "close";
                                });
                              } else {
                                setState(() {
                                  _animation = "open";
                                });
                              }

                              setState(() {
                                textCtrl = true;
                                menuOpen = !menuOpen;
                              });

                              Future.delayed(Duration(milliseconds: 160), () {
                                setState(() {
                                  textCtrl = false;
                                });
                              });
                              print("object");
                            },
                          ),
                          SizedBox(height: 24),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: MyTheme.indigo.withOpacity(0.3),
                      offset: Offset(8, 8),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Image.asset(
                      //   "assets/images/woodwind.png",
                      //   color: Colors.green,
                      //   height: 120,
                      // ),
                      // Image.asset(
                      //   "assets/images/menu_lines.png",
                      //   color: Colors.white,
                      //   height: 32,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}