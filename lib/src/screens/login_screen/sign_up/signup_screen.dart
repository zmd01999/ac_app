import 'package:flutter/material.dart';
import 'package:maple/src/screens/login_screen/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
