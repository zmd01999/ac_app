import 'package:maple/src/screens/edit_profile/components/body.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static String routeName = '/edit-profile';
  const EditProfile({Key? key}) : super(key: key);

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
