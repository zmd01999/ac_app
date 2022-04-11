import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/components/add_finished_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/components/radar_painter.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/components/water_painter.dart';

class SearchWifi extends StatefulWidget {
  static String routeName = "/search-wifi";

  const SearchWifi({Key? key}) : super(key: key);

  @override
  _SearchWifiState createState() => _SearchWifiState();
}

class _SearchWifiState extends State<SearchWifi>  with SingleTickerProviderStateMixin {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + Duration(seconds: 60).inMilliseconds;
  double get  width => MediaQuery.of(context).size.width;
  CurrentRemainingTime? time;

  int activeForm = 0;
  @override
  void initState() {
    super.initState();

    controller =
        CountdownTimerController(endTime: endTime, vsync: this);
    controller.addListener(() {
      Future.delayed(Duration.zero, () async {
        changeState(controller.currentRemainingTime!.sec);
      });
    });
  }

  changeState(time) async {
      if(time < 55 && time > 52){
        setState(() {
          activeForm = 1;
        });
      } else if (time < 53 && time > 52) {
        setState(() {
          activeForm = 2;
        });
      } else if (time < 51){
        SmartDialog.showLoading();
        await Future.delayed(Duration(milliseconds: 300));
        SmartDialog.dismiss();
        controller.disposeTimer();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFinishedWf(),));

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //修改颜色
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              top: 90,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '正在添加设备',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned.fill(
              left: 70,
              right: 70,
              child: Center(
                child: Stack(children: [
                  Positioned.fill(
                    child: RadarView(),
                  ),
                  Positioned.fill(
                    child: WaterRipple(),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        child: Image.asset('assets/images/ds.png'),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Positioned.fill(
              top: 300,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child:CountdownTimer(
                    controller: controller,
                    endTime: endTime,
                    textStyle: TextStyle(
                        fontSize: 30,
                    ),
                  ),
                ),
              ),),

            Positioned.fill(
                top: 600,
                child: Stack(
                  children: <Widget>[
                    Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50.0, left: 60),
                        width: width / 3.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                            color:
                            activeForm == 1 || activeForm == 2 || activeForm == 3
                                ? Colors.orange
                                : Colors.grey),
                      ),
                      Container(

                        margin: EdgeInsets.only(
                          top: 50.0,
                          left: 10
                        ),
                        height: 2.0,
                        width: width / 3.2,
                        decoration: BoxDecoration(
                            color: activeForm == 2 || activeForm == 3
                                ? Colors.orange
                                : Colors.grey),
                      ),

                    ],
                  ),
                    Positioned(
                      top: 28,
                      left: MediaQuery.of(context).size.width * 0.15,
                      child: CircleAvatar(
                        backgroundColor: activeForm == 0 ? Colors.orange : Colors.orange,
                        foregroundColor: Colors.white,
                        radius: 20,
                        child: activeForm == 0 ? Loading(indicator: BallSpinFadeLoaderIndicator(), size: 25.0, color: Colors.white)
                            : Image.asset("assets/images/condivice.png"),
                      ),
                    ),
                    Positioned(
                      top: 28,
                      left: MediaQuery.of(context).size.width * 0.45,
                      child: CircleAvatar(
                        backgroundColor: activeForm == 0
                            ? Colors.grey
                            : activeForm == 1
                            ? Colors.orange
                            : Colors.orange,
                        foregroundColor: Colors.white,
                        radius: 20,
                        child: activeForm == 1 ? Loading(indicator: BallSpinFadeLoaderIndicator(), size: 25.0, color: Colors.white)
                            : Image.asset("assets/images/cloudser.png"),
                      ),
                    ),
                    Positioned(
                      top: 28,
                      left: MediaQuery.of(context).size.width * 0.75,
                      child: CircleAvatar(
                        backgroundColor: activeForm == 2
                            ? Colors.orange :Colors.grey,
                        foregroundColor: Colors.white,
                        radius: 20,
                        child: activeForm == 2 ? Loading(indicator: BallSpinFadeLoaderIndicator(), size: 25.0, color: Colors.white)
                              : Image.asset("assets/images/init.png"),
                      ),
                    ),

                  ],
                )
            )
          ],
        )
    );
  }
}
