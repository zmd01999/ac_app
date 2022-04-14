import 'package:flutter/material.dart';
import 'package:maple/src/screens/login_screen/login/login_screen.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/background.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/or_divider.dart';
import 'package:maple/src/screens/login_screen/login/components/already_have_an_account_acheck.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_button.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_input_field.dart';
import 'package:maple/src/screens/login_screen/login/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
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
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
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
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
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
