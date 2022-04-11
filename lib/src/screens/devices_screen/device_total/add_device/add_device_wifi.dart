import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/popups/popup_warning.dart';
import 'package:maple/popups/popup_widgets/popup_filled_button.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/search_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:wifi_scan/wifi_scan.dart';


class WifiDevice extends StatefulWidget {
  static String routeName = "/wifi";
  const WifiDevice({Key? key}) : super(key: key);
  @override
  _WifiDeviceState createState() => _WifiDeviceState();
}

class _WifiDeviceState extends State<WifiDevice> with WidgetsBindingObserver{
  TextEditingController wifiNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];

  StreamSubscription<Result<List<WiFiAccessPoint>, GetScannedResultsErrors>>?
  subscription;

  bool get isStreaming => subscription != null;
  String? selectedValue;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  void _handleScannedResults(BuildContext context,
      Result<List<WiFiAccessPoint>, GetScannedResultsErrors> result) {
    if (result.hasError) {
      SmartDialog.showToast( "Cannot get scanned results: ${result.error}");
      setStateIfMounted(() => accessPoints = <WiFiAccessPoint>[]);
    } else {
      setStateIfMounted(() => accessPoints = result.value!);
    }
  }

  void _startListeningToScanResults(BuildContext context) {
    subscription = WiFiScan.instance.onScannedResultsAvailable
        .listen((result) => _handleScannedResults(context, result));
  }

  void _stopListteningToScanResults() {
    subscription?.cancel();
    setStateIfMounted(() => subscription = null);
  }
  Widget _buildInfo(String label, dynamic value) => Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))),
    child: Row(
      children: [
        Text("$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value.toString()))
      ],
    ),
  );

  // build access point tile.
  Widget _buildAccessPointTile(BuildContext context, WiFiAccessPoint ap) {
    final title = ap.ssid.isNotEmpty ? ap.ssid : "**EMPTY**";
    final signalIcon =
    ap.level >= -80 ? Icons.signal_wifi_4_bar : Icons.signal_wifi_0_bar;
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(signalIcon),
      title: Text(title),
      subtitle: Text(ap.capabilities),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfo("BSSDI", ap.bssid),
              _buildInfo("Capability", ap.capabilities),
              _buildInfo("frequency", "${ap.frequency}MHz"),
              _buildInfo("level", ap.level),
              _buildInfo("standard", ap.standard),
              _buildInfo("centerFrequency0", "${ap.centerFrequency0}MHz"),
              _buildInfo("centerFrequency1", "${ap.centerFrequency1}MHz"),
              _buildInfo("channelWidth", ap.channelWidth),
              _buildInfo("isPasspoint", ap.isPasspoint),
              _buildInfo("operatorFriendlyName", ap.operatorFriendlyName),
              _buildInfo("venueName", ap.venueName),
              _buildInfo("is80211mcResponder", ap.is80211mcResponder),
            ],
          ),
        ),
      ),
    );
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // _stopListteningToScanResults();
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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(40.0,40,40,70),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '选择2.4GHz Wi-Fi网络并输入密码',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(10, 15),
                            color: Color(0x22000000),
                            blurRadius: 20.0)
                      ],
                      image: DecorationImage(
                          image: AssetImage('assets/images/cwifi.png')
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 30,),
                Theme(
                    data:Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                        primary:Colors.amber,
                      ),
                    ),
                    child:TextFormField(

                      controller: wifiNameController,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        labelText:"Wi-Fi",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: FutureBuilder<bool>(
                          future: WiFiScan.instance.hasCapability(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (!snapshot.data!) {
                              return const Center(child: Text("WiFi scan not supported."));
                            }
                            return IconButton(
                                        icon: const Icon(Icons.swap_horiz),
                                        // call startScan and reset the ap list
                                        onPressed: () async {
                                          final error = await WiFiScan.instance.startScan();
                                          SmartDialog.showToast("startScan: ${error ?? 'done'}");

                                          setStateIfMounted(() => accessPoints = <WiFiAccessPoint>[]);
                                          _handleScannedResults(context,
                                              await WiFiScan.instance.getScannedResults());
                                          SelectDialog.showModal<String>(
                                            context,
                                            searchBoxDecoration: InputDecoration(
                                              hintText: "搜索",
                                            ),
                                            label: "附近的Wi-Fi",
                                            selectedValue: accessPoints[0].ssid,
                                            items: accessPoints.map((e) => e.ssid.length == 0 ? accessPoints[0].ssid : e.ssid).toSet().toList() ,
                                            onChange: (String selected) {
                                              wifiNameController.text = selected;
                                            },
                                          );
                                        },
                                      );
                          },
                        ),
                        icon: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.wifi,
                            // color: MyTheme.mainC,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: MyTheme.mainC),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Theme(
                    data:Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                        primary:Colors.amber,
                      ),
                    ),
                    child:TextFormField(
                      obscureText:true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      autofocus: false,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if(value!.isEmpty || value.trim().isEmpty) {
                          return '请输入密码';
                        }
                        return null;
                      },
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintStyle: const TextStyle(color: Colors.grey),
                        icon: Container(

                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.lock,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: MyTheme.mainC),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child:ElevatedButton(
                            onPressed: () {
                              if(wifiNameController.text.isEmpty || passwordController.text.isEmpty){
                                SmartDialog.show(
                                    widget: PopupWarning(
                                      popupTitle: '请完整填写Wi-Fi信息',
                                      popupActions: <Widget>[
                                        PopupFilledButton(
                                          onPressed: () => Navigator.pop(context),
                                          text: '确定',
                                        ),
                                      ],
                                    )
                                );
                              } else{
                                Navigator.of(context).pushNamed(SearchWifi.routeName);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all(MyTheme.mainC),                //字体
                            ),
                            child: const Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('下一步', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],

            ),
          ),
        )
    );
  }
}
// /// Show snackbar.
// void kShowSnackBar(BuildContext context, String message) {
//   if (kDebugMode) print(message);
//   ScaffoldMessenger.of(context)
//     ..hideCurrentSnackBar()
//     ..showSnackBar(SnackBar(content: Text(message)));
// }