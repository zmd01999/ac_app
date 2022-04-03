import 'package:maple/src/screens/menu_page/components/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:maple/config/size_config.dart';


class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //MenuListItem is custom tile in list_tile file
          MenuListItems(
            iconPath: 'assets/icons/menu_icons/stats.svg',
            itemName: '分析',
            function: (){},
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          MenuListItems(
            iconPath: 'assets/icons/menu_icons/devices.svg',
            itemName: '设备',
            function: (){},
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          MenuListItems(
            iconPath: 'assets/icons/menu_icons/settings.svg',
            itemName: '设置',
            function: (){},
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          MenuListItems(
            iconPath: 'assets/icons/menu_icons/notifications.svg',
            itemName: '通知',
            function: (){},
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          MenuListItems(
            iconPath: 'assets/icons/menu_icons/faq.svg',
            itemName: 'FAQ',
            function: (){},
          ),
        ]
    );
  }
}



