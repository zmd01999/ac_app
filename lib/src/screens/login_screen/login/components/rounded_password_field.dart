import 'package:flutter/material.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/login_screen/constants.dart';
import 'package:maple/src/screens/login_screen/login/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: (value) {
          if(value!.isEmpty || value.trim().isEmpty) {
            return '请输入密码';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "密码",
          labelStyle: TextStyle(
            color: MyTheme.indigo
          ),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
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
    );
  }
}
