import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/popups/popup_warning.dart';
import 'package:maple/popups/popup_widgets/popup_filled_button.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';

class AddFinishedWf extends StatefulWidget {
  static String routeName = "/addfinishwf";

  const AddFinishedWf({Key? key}) : super(key: key);

  @override
  _AddFinishedWfState createState() => _AddFinishedWfState();
}

class _AddFinishedWfState extends State<AddFinishedWf> {
  double get width =>
      MediaQuery
          .of(context)
          .size
          .width;
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();

  List<String> tags = ["厨房","客厅","厕所","卧室"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.fromLTRB(20.0, 40, 20, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width / 2,
                  height: 290,
                  child: FlareActor(
                    "assets/gif/success.flr",
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    animation: "Untitled",
                  ),

                ),
                Text(
                  '设备添加成功',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.amber,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nameController,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty || value
                          .trim()
                          .isEmpty) {
                        return '请输入密码';
                      }
                      return null;
                    },
                    cursorColor: Colors.black12,
                    decoration: InputDecoration(
                      helperText: '设置个性化名称，建议使用中文，可以使用语音控制',
                      labelText: "名称",
                      hintStyle: const TextStyle(color: Colors.grey),

                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      enabled: true,

                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30), //边角为30
                        ),
                      ),

                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: MyTheme.mainC),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30), //边角为30
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  SizedBox(width: width,),
                  Text(
                      "所属房间：",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                      )
                  ),
                  SizedBox(height: 20,),

                  Tags(
                    itemCount: tags.length,
                    itemBuilder: (int index){
                      final item = tags[index];

                      return Tooltip(
                          message: item,
                          child:ItemTags(
                            onPressed: (item) => homeController.text = item as String,
                            title:item,
                            index: index,
                            activeColor:MyTheme.indigo,
                          ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (nameController.text.isEmpty) {
                                SmartDialog.show(
                                    widget: PopupWarning(
                                      popupTitle: '请自定义设备名称',
                                      popupActions: <Widget>[
                                        PopupFilledButton(
                                          onPressed: () => Navigator.pop(context),
                                          text: '确定',
                                        ),
                                      ],
                                    )
                                );
                              } else {
                                // TODO:Http云服务 nameController
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyTheme.mainC), //字体
                            ),
                            child: const Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('保存', style: TextStyle(fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),)
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
