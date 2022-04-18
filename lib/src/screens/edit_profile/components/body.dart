import 'package:maple/config/size_config.dart';
import 'package:maple/src/entity/user/user_entity.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/edit_profile/components/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:maple/utils/shared_preferences_util.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nikenameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser().then((value){
      usernameController.text = value!.username;
      nikenameController.text = value.nikename;

    });
    usernameController.addListener((){
      print(usernameController.text);
    });
  }
  Future<UserDetail?> getUser() async{
    return await SharedPreferencesUtil.getUserDetail();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        bottom: getProportionateScreenHeight(15),
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                top: getProportionateScreenHeight(15),
                right: getProportionateScreenWidth(15),
                bottom: getProportionateScreenHeight(20),
              ),
              child: Column(
                children: [
                  const Text(
                    '上传头像',
                    // style: Theme.of(context).textTheme.headline1,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: MyTheme.indigo),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    dashPattern: const [7, 7],
                    color: MyTheme.indigo,
                    strokeWidth: 2,
                    // padding: EdgeInsets.fromLTRB(115, 37, 115, 37),
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(75),
                        getProportionateScreenHeight(25),
                        getProportionateScreenWidth(75),
                        getProportionateScreenHeight(25)),
                    child: const UploadImage(),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    color: MyTheme.indigo
                  ),
                  controller: usernameController,
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    labelText: '账号',
                    labelStyle: TextStyle(
                      color:  MyTheme.indigo
                    ),
                    icon: Container(
                      height: 50,
                      width: 40,
                      // decoration: BoxDecoration(
                      //   color: Colors.amberAccent.shade100,
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      child: const Icon(
                        Icons.account_circle_outlined,
                        color: MyTheme.indigo,
                        size: 40,
                      ),
                    ),

                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    enabled: false,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:MyTheme.indigo),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TextFormField(
                  style: TextStyle(
                    color: MyTheme.indigo
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nikenameController,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty || value.trim().isEmpty){
                      return 'Username is required';
                    }
                    return null;
                  },
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    labelText: '昵称',
                    labelStyle: TextStyle(
                      color: MyTheme.indigo
                    ),
                    icon: Container(
                      height: 50,
                      width: 40,

                      child: const Icon(
                        Icons.drive_file_rename_outline,
                        color: MyTheme.indigo,
                        size: 35,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TextFormField(
                  style: TextStyle(
                    color: MyTheme.indigo
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty || value.trim().isEmpty){
                      return 'phone is required';
                    }
                    return null;
                  },
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    labelText:"手机",
                    labelStyle: TextStyle(
                      color: MyTheme.indigo
                    ),
                    hintStyle: const TextStyle(color: Colors.grey),
                    icon: Container(
                      height: 50,
                      width: 40,
                      child: const Icon(
                        Icons.phone_android,
                        color: MyTheme.indigo,
                        size: 35,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TextFormField(
                  style: TextStyle(
                    color: MyTheme.indigo
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addressController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty || value.trim().isEmpty) {
                      return 'address is required';
                    }
                    return null;
                  },
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    labelText: '地址',
                    labelStyle: TextStyle(
                      color: MyTheme.indigo
                    ),
                    hintStyle: const TextStyle(color: Colors.grey),
                    icon: Container(
                      height: 50,
                      width: 40,
                      child: const Icon(
                        Icons.location_city,
                        color: MyTheme.indigo,
                        size: 35,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyTheme.indigo),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/ 1.4 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFF91a8d0),
                                  Color(0xFF25c5ea),
                                  Color(0xFF00ddc7),
                                  Color(0xFF7be972),
                                  Color(0xFFffdf00)
                                ],
                              )
                            ),
                            child: ElevatedButton(
                                onPressed: () {  },
                                style: ButtonStyle(
                                  backgroundColor:  MaterialStateProperty.all(Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: const Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text('Save Changes', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)
                                ),
                              )
                          ),
                        ],
                    ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
