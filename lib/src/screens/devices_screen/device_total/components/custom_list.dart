import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/devices_screen/smart_ac/smart_ac.dart';

import 'custom_switch.dart';
import 'mytheme.dart';

class CustomTileModel {
  final String title;
  final String subtitle;
  final String img;

  CustomTileModel(this.title, this.subtitle, this.img);
}

List<CustomTileModel> tiles = [
  CustomTileModel("美的", "Online", "assets/images/my_lamp.png"),
  CustomTileModel("三星", "Online", "assets/images/phlilips_lamp.png"),
  CustomTileModel("奥克斯", "Sleeping", "assets/images/camera.png"),
  CustomTileModel("格力", "Online", "assets/images/mi_fan.png"),
];
class CustomListTile extends StatefulWidget {

  const CustomListTile({
    Key? key, required this.tileModel, required this.w,  this.onTap
  }) : super(key: key);
  final CustomTileModel tileModel;
  final double w;
  final VoidCallback? onTap ;

  @override
  _CustomListTile createState() => _CustomListTile();
}

class _CustomListTile extends State<CustomListTile> {

  bool isOpened = false;
  onTapProxy(){
    setState(() {
      isOpened = !isOpened;
    });
    widget.onTap!();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.w - 48,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: MyTheme.lightGrey,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 64,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(widget.tileModel.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.tileModel.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: MyTheme.textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon:Icon(
                      Icons.arrow_forward_ios,
                      color: MyTheme.textColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SmartAC(),));
                    },
                  )
                ],
              ),
              SizedBox(height: 3),
              Text(
                widget.tileModel.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: MyTheme.grey,
                ),
              )
            ],
          ),
          Spacer(),
          CustomSwitch(isOpened:isOpened, onTap: onTapProxy),
        ],
      ),
    );
  }
}
