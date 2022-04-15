import 'package:flutter/material.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/login_screen/constants.dart';
import 'package:maple/src/screens/login_screen/login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if(value!.isEmpty || value.trim().isEmpty) {
            return '请输入账号';
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          labelText: hintText,
          labelStyle: TextStyle(
              color: MyTheme.indigo
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
