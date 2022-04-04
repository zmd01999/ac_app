import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoltModel {
  final double topBefore;
  final double leftBefore;
  final double size;
  final String img;

  BoltModel(this.topBefore, this.leftBefore, this.size, this.img);
}

List<BoltModel> bolts = [
  BoltModel(90, 104, 50, "assets/images/flash_left.png"),
  BoltModel(180, 32, 68, "assets/images/flash_left.png"),
  BoltModel(84, 284, 60, "assets/images/flash_right.png"),
  BoltModel(200, 352, 64, "assets/images/flash_right.png"),
];

class BoltWidget extends StatelessWidget {
  final bool menuOpen;
  final double w;
  final BoltModel boltModel;

  const BoltWidget({ Key? key, required this.menuOpen, required this.w, required this.boltModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 360),
      curve: Curves.easeIn,
      top: menuOpen ? boltModel.topBefore : 460,
      left: menuOpen ? boltModel.leftBefore : (w - boltModel.size) / 2,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 360),
        width: menuOpen ? boltModel.size : 5,
        height: menuOpen ? boltModel.size : 5,
        padding: EdgeInsets.all(5),
        child: Image.asset(
          boltModel.img,
          color: Colors.white,
        ),
      ),
    );
  }
}
