import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mytheme.dart';

class CustomSwitch extends StatelessWidget {
  final bool isOpened;
  final VoidCallback onTap;
  final bool? totalOpend;

  const CustomSwitch({ Key? key, required this.isOpened, required this.onTap,  this.totalOpend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 240),
        width: 74,
        height: 34,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 240),
              top: 2.5,
              left: totalOpend??true ? (isOpened ? 41 : 2) : 2,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: totalOpend??true ? (isOpened ? MyTheme.switchl : MyTheme.lightGrey) : MyTheme.lightGrey,
        ),
      ),
    );
  }
}
