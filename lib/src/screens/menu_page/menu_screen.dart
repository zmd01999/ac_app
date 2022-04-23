import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/statistic_screen/overview/overview_stat.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:transparent_image/transparent_image.dart';

class Menu extends StatelessWidget {
  static String routeName = '/menu-screen';

  const Menu({Key? key, required this.advancedDrawerController}) : super(key: key);
  final AdvancedDrawerController advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF67c0e7),
                Color(0xFF74bae3),
                Color(0xFF7fb4de),
                Color(0xFF89aed8),
                Color(0xFF91a8d0)
              ],
            )
        ),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 5.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,

                ),
                child:  FutureBuilder<String?>(
                    future: SharedPreferencesUtil.getCache(SharedPreferencesUtil.HEAD_PIC),
                    builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                      if(snapshot.hasData){
                        return DottedBorder(
                          borderType: BorderType.Circle,
                          radius: Radius.circular(35),
                          color: MyTheme.indigo,
                          child: Container(
                            height: 128,
                            width:128,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: snapshot.data??"",
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),),);
                      } else {
                        return  Padding(
                          padding: EdgeInsets.only(
                            bottom: 2,
                          ),
                          child: CircularProgressIndicator(color: Colors.grey.shade300,),
                        );
                      }
                    }
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 44.0,
                ),
                child: FutureBuilder<String?>(
                  future: SharedPreferencesUtil.getUserName(),
                  builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        (snapshot.data??" "),
                          style: GoogleFonts.dmSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFDEF2FF),
                          )
                      );
                    } else {
                      return Text(
                        " ",
                      );
                    }
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  advancedDrawerController.hideDrawer();
                },
                leading: Icon(Icons.home),
                title: Text('主页'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.account_circle_rounded),
                title: Text('个人信息'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.favorite),
                title: Text('最喜爱'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OverViewStats()),);
                },
                leading: Icon(Icons.stacked_bar_chart),
                title: Text('统计概览'),
                ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('设置'),
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(right: 100, ),
                  child: Container(
                  width: 150,
                  decoration: new BoxDecoration(
                    //背景
                    color: Colors.transparent,
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //设置四周边框
                    border: new Border.all(width: 2, color: Colors.white),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.logout),
                    title: Text('注销'),
                  ),
                ),
              ),


              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   Drawer(
    //   child: GestureDetector(
    //     onTap: () {
    //       FocusScope.of(context).requestFocus(FocusNode());
    //     },
    //     child: const Scaffold(
    //       backgroundColor: Color(0xFFF2F2F2),
    //       body: Body(),
    //     ),
    //   ),
    // );
  }
}
