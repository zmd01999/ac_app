import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/provider/base_view.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/edit_profile/edit_profile.dart';
import 'package:maple/src/screens/menu_page/menu_screen.dart';
import 'package:maple/utils/color_loader.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:maple/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/body.dart';
import 'components/weather_am.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();

}
class _HomeScreen extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
          model.generateRandomNumber(),
        },
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child:AdvancedDrawer(
              backdropColor: MyTheme.indigo,
              controller: _advancedDrawerController,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              animateChildDecoration: true,
              disabledGestures: false,
              childDecoration: const BoxDecoration(

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 0.0,
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              drawer: SizedBox(
                  width: getProportionateScreenWidth(270),
                  child:  Menu(advancedDrawerController: _advancedDrawerController)),
              child:Scaffold(
                  appBar: AppBar(
                    // automaticallyImplyLeading: false,
                    toolbarHeight: getProportionateScreenHeight(60),
                    //centerTitle: true,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(Icons.menu),
                      tooltip: 'Navigation',
                      onPressed: () => _advancedDrawerController.showDrawer(),
                    ),
                    iconTheme: const IconThemeData(color: Colors.black),
                    title: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(
                          4,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<String?>(
                              future: SharedPreferencesUtil.getUserName(), // a previously-obtained Future<String> or null
                              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                                if(snapshot.hasData){
                                  return Text(
                                    '你好, '+ snapshot.data.toString(),
                                    style: Theme.of(context).textTheme.headline2,
                                  );
                                } else {
                                  return Text(
                                    '你好!' ,
                                    style: Theme.of(context).textTheme.headline2,
                                  );
                                }
                              }),
                          // Text(
                          //   'Hi, '+ username.toString() ,
                          //   style: Theme.of(context).textTheme.headline1,
                          // ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: MyTheme.blue,
                              borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45)),
                            ),
                            child: IconButton(
                              splashRadius: 25,
                              icon: const Icon(
                                FontAwesomeIcons.solidUser,
                                color: Colors.amberAccent,
                              ),
                              onPressed: () {
                                // Navigator.of(context).pushNamed(EditProfile.routeName);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile(),));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // leadingWidth: getProportionateScreenWidth(170),
                    bottom: PreferredSize(
                      child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.white.withOpacity(0.3),
                          indicatorColor: Color(0xFF464646),
                          tabs: [
                            Tab(
                              child: Text(
                                '客厅',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            Tab(
                              child: Text(
                                '卧室',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Tab(
                              child: Text(
                                '厨房',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          ]),
                      preferredSize: Size.fromHeight(
                        getProportionateScreenHeight(
                          35,
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Body(
                        model: model,
                      ),
                      Center(
                        child: Text("wait"),
                      ),
                       Center(
                        child:  Container(
                          width: 250,
                          height: 290,
                          child: FlareActor(
                            "assets/gif/energy.flr",
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            animation: "receiving glow",
                          ),

                        ),
                      ),
                    ],
                  ),
              ),
            )
          );
        });
  }



}
