import 'package:flutter/material.dart';
import 'package:maple/config/size_config.dart';
import 'package:flutter_svg/svg.dart';

class MenuListItems extends StatelessWidget {
  final String iconPath;
  final String itemName;
  final Function function;
  const MenuListItems({
    Key? key,
    required this.iconPath,
    required this.itemName,
    required this.function
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(
            width: getProportionateScreenWidth(25),
          ),
          Text(
            itemName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      )
    );
  }
}
