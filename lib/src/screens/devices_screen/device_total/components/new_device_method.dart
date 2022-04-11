import 'package:barcode_scan2/gen/protos/protos.pb.dart';
import 'package:barcode_scan2/model/android_options.dart';
import 'package:barcode_scan2/model/scan_options.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:maple/provider/getit.dart';
import 'package:maple/service/navigation_service.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/add_device_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/components/add_finished_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';

class NewDeviceMethod extends StatelessWidget {
  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

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
       // TODO:_scan获得二维码数据之后Http请求云，获得设备信息等
       onOkButtonPressed: () async {
         _scan();
         SmartDialog.dismiss(tag: "newDevice");
         getIt<NavigationService>().navigatorKey.currentState?.pushNamed(AddFinishedWf.routeName);
       },
       onCancelButtonPressed: () {
         SmartDialog.show(widget: NewDeviceMethod1(), tag: "wifi");
         SmartDialog.dismiss(tag: "newDevice");
       },
     );
  }
  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          useCamera: -1,
          autoEnableFlash: false,
          android: AndroidOptions(
            aspectTolerance:  0.00,
            useAutoFocus: true,
          ),
        ),
      );
      result.rawContent;
    } on PlatformException catch (e) {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
    }
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