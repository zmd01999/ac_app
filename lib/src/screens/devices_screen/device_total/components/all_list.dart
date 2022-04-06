import 'package:flutter/cupertino.dart';

import 'custom_list.dart';

class AllList extends StatelessWidget  {
  const AllList({
    Key? key,
    this.w, this.totalSwitch
  }) : super(key: key);
  final w;
  final bool? totalSwitch;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: w - 48,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles.length,
          itemExtent: 75.0,
          itemBuilder: (context, index) =>
              CustomListTile(tileModel: tiles[index], w: this.w, totalSwitch: totalSwitch, onTap: (){print("optap");},),
        ),
    );
  }

}