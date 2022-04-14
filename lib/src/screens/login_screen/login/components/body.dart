import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:maple/api/api.dart';
import 'package:maple/popups/popup_error.dart';
import 'package:maple/popups/popup_warning.dart';
import 'package:maple/popups/popup_widgets/popup_filled_button.dart';
import 'package:maple/src/entity/user/login_entity.dart';
import 'package:maple/src/entity/user/user_entity.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';
import 'package:maple/src/screens/login_screen/login/components/background.dart';
import 'package:maple/src/screens/login_screen/sign_up/signup_screen.dart';
import 'package:maple/src/screens/login_screen/login/components/already_have_an_account_acheck.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_button.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_input_field.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maple/utils/shared_preferences_util.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  userHandler(UserEntity? user) {
      print("token set succesed");
      SharedPreferencesUtil.setUser(jsonEncode(user));
      return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(width: 30,),
            Text(
              "木风",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: usernameController,
              hintText: "账号",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "登陆",
              press: () async{

                if( !usernameController.text.isEmpty || !passwordController.text.isEmpty) {
                  LoginEntity user = new LoginEntity(name: usernameController.text, password: passwordController.text);
                  SmartDialog.showLoading();

                  Api.login(data: jsonEncode(user), onSuccess: userHandler).then((value){
                    print(value);
                    if(value== null){
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      SmartDialog.dismiss();
                    } else {
                      SmartDialog.show(widget: PopupError(popupTitle:value));
                      SmartDialog.dismiss();
                    }
                  });
                } else {
                  SmartDialog.show(
                      widget: PopupWarning(
                        popupTitle: '请输入账号和密码',
                        popupActions: <Widget>[
                          PopupFilledButton(
                            onPressed: () => SmartDialog.dismiss(),
                            text: '确定',
                          ),
                        ],
                      )
                  );
                }

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
