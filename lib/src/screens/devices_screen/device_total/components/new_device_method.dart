import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:maple/provider/getit.dart';
import 'package:maple/service/navigation_service.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/add_device_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/qrcode.dart';

class NewDeviceMethod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return AssetGiffyDialog(
       buttonOkText:Text("选择"),
       buttonOkColor: MyTheme.mainC,
       buttonCancelText:Text("无线连接"),
       buttonCancelColor:MyTheme.indigo,
       key: Key("deviceDialog"),
       image: Image.asset(
         'assets/gif/qrcode.gif',
         fit: BoxFit.contain,
       ),
       entryAnimation: EntryAnimation.DEFAULT,
       title: Text(
         '添加设备',
         textAlign: TextAlign.center,
         style: TextStyle(
             fontSize: 22.0, fontWeight: FontWeight.w600),
       ),
       description: Text(
         '请扫描设备或包装上的二维码来添加设备',
         textAlign: TextAlign.center,
       ),
       onOkButtonPressed: () {
         getIt<NavigationService>().navigatorKey.currentState?.pushNamed(QrCode.routeName);
         SmartDialog.dismiss(tag: "newDevice");
         // Navigator.push(context,  MaterialPageRoute(builder: (context) => const QrCode(),));
       },
       onCancelButtonPressed: () {
         SmartDialog.show(widget: NewDeviceMethod1(), tag: "wifi");
         SmartDialog.dismiss(tag: "newDevice");
       },
     );
  }

}

class NewDeviceMethod1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AssetGiffyDialog(
      buttonOkText:Text("选择"),
      buttonOkColor: MyTheme.mainC,
      buttonCancelText:Text("取消"),
      buttonCancelColor:MyTheme.indigo,
      key: Key("wifiDialog"),
      image: Image.asset(
        'assets/gif/wifi1.gif',
        fit: BoxFit.contain,
      ),
      entryAnimation: EntryAnimation.DEFAULT,
      title: Text(
        '添加设备',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w600),
      ),
      description: Text(
        '使用WIFI热点发现设备',
        textAlign: TextAlign.center,
      ),
      onOkButtonPressed: () {
        getIt<NavigationService>().navigatorKey.currentState?.pushNamed(WifiDevice.routeName);
        SmartDialog.dismiss(tag: "wifi");
      },
      onCancelButtonPressed: () {
        SmartDialog.dismiss(tag: "wifi");

      },
    );
  }

}