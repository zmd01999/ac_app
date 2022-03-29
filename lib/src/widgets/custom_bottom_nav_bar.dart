import 'package:flutter/material.dart';
import 'package:maple/src/screens/about_screen/about_us_screen.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';
import 'package:maple/src/screens/smart_ac/smart_ac.dart';
import 'package:maple/src/screens/smart_fan/smart_fan.dart';
import 'package:maple/view/home_screen_view_model.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBar createState() => _CustomBottomNavBar();
}

class _CustomBottomNavBar extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  HomeScreenViewModel model = HomeScreenViewModel();

  static List<Widget> _widget = <Widget>[HomeScreen(), SmartAC(), SmartFan(), AboutUs()];

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
              icon: Icon(Icons.auto_graph_rounded),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.history),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person_rounded),
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
// Widget CustomBottomNavBar(BuildContext context) {
//   int _selectedIndex = 0;
//
//   return BottomBarWithSheet(
//     selectedIndex: _selectedIndex,
//     sheetChild: const Center(child: Text("Place for your another content")),
//     bottomBarTheme: const BottomBarTheme(
//       height: 70,
//       heightClosed: 70,
//       mainButtonPosition: MainButtonPosition.middle,
//       itemIconColor: Colors.grey,
//       selectedItemIconColor: Colors.red,
//     ),
//     mainActionButtonTheme: MainActionButtonTheme(
//       transform: Matrix4.translationValues(0, -30, 0),
//     ),
//     mainActionButton: Container(
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Text(
//         'Open',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//         ),
//       ),
//     ),
//     onSelectItem: (index) => setState(() => _selectedIndex = index),
//     items: const [
//       BottomBarWithSheetItem(icon: Icons.settings),
//       BottomBarWithSheetItem(icon: Icons.favorite),
//     ],
//   );
// }
//
// Widget CustomBottomNavBar(HomeScreenViewModel model) {
//   return BottomNavigationBar(
//     currentIndex: model.selectedIndex,
//     selectedItemColor: Colors.black,
//     elevation: 0,
//     onTap: model.onItemTapped,
//     items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         label: '',
//         icon: Icon(Icons.home),
//         backgroundColor: Colors.white,
//       ),
//       BottomNavigationBarItem(
//         label: '',
//         icon: Icon(Icons.auto_graph_rounded),
//         backgroundColor: Colors.lightBlue,
//       ),
//       BottomNavigationBarItem(
//         label: '',
//         icon: Icon(Icons.history),
//         backgroundColor: Colors.lightBlue,
//       ),
//       BottomNavigationBarItem(
//         label: '',
//         icon: Icon(Icons.person_rounded),
//         backgroundColor: Colors.lightBlue,
//       ),
//     ],
//   );
// }