import 'package:maple/config/size_config.dart';
import 'package:maple/provider/base_view.dart';
import 'package:maple/src/screens/edit_profile/edit_profile.dart';
import 'package:maple/src/screens/menu_page/menu_screen.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:maple/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();

}
class _HomeScreen extends State<HomeScreen> {
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
            child: Scaffold(
              appBar: AppBar(
                // automaticallyImplyLeading: false,
                toolbarHeight: getProportionateScreenHeight(60),
                //centerTitle: true,
                elevation: 0,
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
                                style: Theme.of(context).textTheme.headline1,
                              );
                            } else {
                              return Text(
                                '你好!' ,
                                style: Theme.of(context).textTheme.headline1,
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
                          color: Color(0xffdadada),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(45, 45)),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.amber,
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
              drawer: SizedBox(
                  width: getProportionateScreenWidth(270),
                  child: const Menu()),
              body: TabBarView(
                children: <Widget>[
                  Body(
                    model: model,
                  ),
                  Center(
                    child: Text(
                      'To be Built Soon',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const Center(
                    child: Text('under construction'),
                  ),
                ],
              ),
              // bottomNavigationBar: CustomBottomNavBar(model),
            ),
          );
        });
  }



}
