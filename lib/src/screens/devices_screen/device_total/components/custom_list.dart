import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:maple/src/entity/home/devices_entity.dart';
import 'package:maple/src/screens/devices_screen/smart_ac/smart_ac.dart';

import 'custom_switch.dart';
import 'mytheme.dart';

class CustomTileModel {
  final String title;
  final String subtitle;
  final String img;

  CustomTileModel(this.title, this.subtitle, this.img);
}

List<DevicesEntity> tiles = [
  DevicesEntity(nikeName: "美的", type: "Sleeping"),
  DevicesEntity(nikeName: "三星", type:"Sleeping"),
  DevicesEntity(nikeName: "奥克斯", type:"Sleeping"),
  DevicesEntity(nikeName: "格力", type:"Sleeping"),
];
class CustomListTile extends StatefulWidget {

  const CustomListTile({
    Key? key, required this.tileModel, required this.w,  this.onTap, this.totalSwitch
  }) : super(key: key);
  final DevicesEntity tileModel;
  final double w;
  final VoidCallback? onTap ;
  final bool? totalSwitch;
  final String img = "assets/images/ac.png";

  @override
  _CustomListTile createState() => _CustomListTile();
}

class _CustomListTile extends State<CustomListTile> {

   late bool isOpened;
   late String deviceState;
  @override
  void initState() {
    print("enter init");
    if (widget.totalSwitch == false || widget.tileModel.status == "Sleeping") {
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
      } else {
        SmartDialog.showToast("总控未开启");
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
                image: AssetImage(widget.img),
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
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: 60,
                     ),
                    child: Text(
                      widget.tileModel.nikeName??"Default",
                      style: TextStyle(
                          fontSize: 20,
                          color: MyTheme.textColor,
                          overflow: TextOverflow.clip
                      ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
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
