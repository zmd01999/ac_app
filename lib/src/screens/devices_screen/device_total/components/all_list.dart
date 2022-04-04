import 'package:flutter/cupertino.dart';

import 'custom_list.dart';

class AllList extends StatelessWidget  {
  const AllList({
    Key? key,
    this.w
  }) : super(key: key);
  final w;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tiles.length,
      itemExtent: 75.0,
      itemBuilder: (context, index) =>
          CustomListTile(tileModel: tiles[index], w: this.w, onTap: (){print("optap");},),
    );;
  }

}