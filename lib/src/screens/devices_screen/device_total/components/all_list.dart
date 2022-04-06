import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
            AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 400),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child:  CustomListTile(
                          tileModel: tiles[index], w: this.w, totalSwitch: totalSwitch,
                          onTap: () async {
                          if (totalSwitch != false){
                            SmartDialog.showLoading();
                            await Future.delayed(Duration(milliseconds: 300));
                            SmartDialog.dismiss();
                          }
                          },),
                    ),
                ),
            )
        ),
    );
  }

}