import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:maple/api/api.dart';
import 'package:maple/popups/popup_error.dart';
import 'package:maple/popups/popup_success.dart';
import 'package:maple/popups/popup_warning.dart';
import 'package:maple/popups/popup_widgets/popup_filled_button.dart';
import 'package:maple/src/entity/user/login_entity.dart';
import 'package:maple/src/screens/login_screen/login/login_screen.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/background.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/or_divider.dart';
import 'package:maple/src/screens/login_screen/login/components/already_have_an_account_acheck.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_button.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_input_field.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_password_field.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/social_icon.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            Container(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/pen.png"),
            ),
            SizedBox(height: size.height * 0.05),

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
              text: "注册",
              press: () async{
                if( !usernameController.text.isEmpty || !passwordController.text.isEmpty) {
                    LoginEntity user = new LoginEntity(name: usernameController.text, password: passwordController.text);
                    SmartDialog.showLoading();
                    Api.register(data: jsonEncode(user)).then((value){
                      if (value == null) {
                        SmartDialog.show(widget: PopupSuccess(
                          popupTitle: "注册成功",
                          popupSubtitle: "点击跳转登录页面",
                          popupActions: [
                            PopupFilledButton(
                              onPressed: (){
                                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                                SmartDialog.dismiss();
                              },
                              text: '确定',
                            ),
                          ],
                        ));
                        SmartDialog.dismiss();
                      } else {
                        SmartDialog.dismiss();
                        SmartDialog.show(widget: PopupError(popupTitle:value));
                      }
                    });
                } else {
                  SmartDialog.show(
                      widget: PopupWarning(
                        popupTitle: '请完整填写账号和密码',
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
              login: false,
              press: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
