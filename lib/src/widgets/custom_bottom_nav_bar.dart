import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/edit_profile/profil_page.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';
import 'package:maple/src/screens/statistic_screen/statistic_screen.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:maple/view/home_screen_view_model.dart';

class CustomBottomNavBar extends StatefulWidget {
  static String routeName = "/navbar";
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBar createState() => _CustomBottomNavBar();
}

class _CustomBottomNavBar extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  HomeScreenViewModel model = HomeScreenViewModel();

  static List<Widget> _widget = <Widget>[HomeScreen(), StatScreen(), ProfileLandingScreen(),];
  @override
  void initState() {
    SharedPreferencesUtil.getUserDetail().then((value) {
      String name = value!.username;
      final ref = FirebaseStorage.instance.ref().child("images/$name.png");
      ref.getDownloadURL().then((value) =>
          SharedPreferencesUtil.setCache(SharedPreferencesUtil.HEAD_PIC, value));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widget.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          elevation: 0,
          // onTap: model.onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.trending_up),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
