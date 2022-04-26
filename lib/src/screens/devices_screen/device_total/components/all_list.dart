import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maple/api/api.dart';
import 'package:maple/src/entity/home/devices_entity.dart';
import 'package:maple/utils/shared_preferences_util.dart';

import 'custom_list.dart';

class AllList extends StatelessWidget  {
  const AllList({
    Key? key,
    this.w, this.totalSwitch, this.userName
  }) : super(key: key);
  final w;
  final bool? totalSwitch;
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: w - 48,
        child: FutureBuilder<List<DevicesEntity>>(
        future: Api.getMyDevices(data: {"user":  userName, "type" : "空调" }), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<List<DevicesEntity>> snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemExtent: 75.0,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 400),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child:  CustomListTile(
                                  tileModel: snapshot.data![index], w: this.w, totalSwitch: totalSwitch,
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
                  );
                }else {
                    return ListView.builder(
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
                    );
                }
        }
        )

    );
  }

}