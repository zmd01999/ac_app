import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';

class NewDeviceMethod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return AssetGiffyDialog(
       buttonOkText:Text("选择"),
       buttonOkColor: MyTheme.mainC,
       buttonCancelText:Text("无线连接"),
       buttonCancelColor:MyTheme.indigo,
       key: Key("NetworkDialog"),
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
      key: Key("NetworkDialog"),
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
      },
      onCancelButtonPressed: () {
        SmartDialog.dismiss(tag: "wifi");

      },
    );
  }

}