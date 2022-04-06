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
  CustomTileModel("美的", "Sleeping", "assets/images/ac.png"),
  CustomTileModel("三星", "Sleeping", "assets/images/ac.png"),
  CustomTileModel("奥克斯", "Sleeping", "assets/images/ac.png"),
  CustomTileModel("格力", "Sleeping", "assets/images/ac.png"),
];
class CustomListTile extends StatefulWidget {

  const CustomListTile({
    Key? key, required this.tileModel, required this.w,  this.onTap, this.totalSwitch
  }) : super(key: key);
  final CustomTileModel tileModel;
  final double w;
  final VoidCallback? onTap ;
  final bool? totalSwitch;

  @override
  _CustomListTile createState() => _CustomListTile();
}

class _CustomListTile extends State<CustomListTile> {

   late bool isOpened;
   late String deviceState;
  @override
  void initState() {
    print("enter init");
    if (widget.totalSwitch == false || widget.tileModel.subtitle == "Sleeping") {
      isOpened = false;
      deviceState = "Sleeping";
    } else {
      isOpened =  true;
      deviceState = "Online";
    }

    super.initState();
  }

   @override
   void ready()
   {

   }
   onTapProxy(){
    widget.onTap!();
    setState(() {
      if (widget.totalSwitch == null || widget.totalSwitch == true){
        isOpened = !isOpened;
        if (isOpened == true) deviceState = "Online";
        else deviceState = "Sleeping";
      }

    });

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
            width: 55,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(widget.tileModel.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 45),
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
              SizedBox(height: 1),
              Text(
                widget.totalSwitch??true ? deviceState : "Sleeping",
                style: TextStyle(
                  fontSize: 16,
                  color: MyTheme.grey,
                ),
              )
            ],
          ),
          Spacer(),
          CustomSwitch(isOpened:isOpened, totalOpend: widget.totalSwitch??true, onTap: onTapProxy),
        ],
      ),
    );
  }
}
