import 'package:flutter/material.dart';

import 'package:maple/src/screens/savings_screen/components/body.dart';

class SavingsScreen extends StatelessWidget {
  static String routeName = '/savings-screen';
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:  Scaffold(
          extendBodyBehindAppBar: true,

          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //修改颜色
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF2F2F2),
          body: Body(),
        ),
    );
  }
}
