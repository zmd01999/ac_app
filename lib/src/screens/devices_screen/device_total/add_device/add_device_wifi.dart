import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';


class WifiDevice extends StatefulWidget {
  static String routeName = "/wifi";
  const WifiDevice({Key? key}) : super(key: key);
  @override
  _WifiDeviceState createState() => _WifiDeviceState();
}

class _WifiDeviceState extends State<WifiDevice> {
  Widget  _placeContainer(String title, Color color,bool leftIcon){
    return Column(children: <Widget>[
      Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color:color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,style: TextStyle(color: leftIcon ? Color(0xffa3a3a3) : Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
              leftIcon ? Icon(Icons.add,color: Color(0xffa3a3a3),)
                  : Container()
            ],)
      )
    ],);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController wifiNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(40.0,40,40,70),
            child: Column(
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
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
              ],
            ),
          ),
        ));
  }
}
