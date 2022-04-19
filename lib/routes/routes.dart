import 'package:maple/src/screens/devices_screen/device_total/add_device/add_device_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/components/add_finished_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/add_device/search_wifi.dart';
import 'package:maple/src/screens/devices_screen/device_total/device_total.dart';
import 'package:maple/src/screens/event_screen/event_screen.dart';
import 'package:maple/src/screens/login_screen/login/login_screen.dart';
import 'package:maple/src/screens/login_screen/sign_up/signup_screen.dart';
import 'package:maple/src/screens/menu_page/menu_screen.dart';
import 'package:maple/src/screens/devices_screen/smart_ac/smart_ac.dart';
import 'package:maple/src/screens/devices_screen/smart_fan/smart_fan.dart';
import 'package:maple/src/screens/devices_screen/smart_light/smart_light.dart';
import 'package:maple/src/screens/devices_screen/smart_speaker/smart_speaker.dart';
import 'package:maple/src/screens/savings_screen/savings_screen.dart';
import 'package:maple/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';
import 'package:maple/src/screens/edit_profile/edit_profile.dart';
import 'package:maple/src/screens/statistic_screen/overview/overview_stat.dart';
import 'package:maple/src/screens/statistic_screen/statistic_screen.dart';
import 'package:maple/src/widgets/custom_bottom_nav_bar.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  SmartLight.routeName: (context) => const SmartLight(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SmartAC.routeName: (context) => const SmartAC(),
  SmartSpeaker.routeName: (context) => const SmartSpeaker(),
  SmartFan.routeName: (context) => const SmartFan(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  EditProfile.routeName: (context) =>  const EditProfile(),
  SetEventScreen.routeName: (context) => const SetEventScreen(),
  StatScreen.routeName: (context) =>  StatScreen(),
  Menu.routeName: (context) => const Menu(),
  DeviceTotal.routeName:  (context) =>  DeviceTotal(),
  SavingsScreen.routeName:  (context) => const SavingsScreen(),
  WifiDevice.routeName:  (context) => const WifiDevice(),
  SearchWifi.routeName:  (context) => const SearchWifi(),
  AddFinishedWf.routeName:  (context) => const AddFinishedWf(),
  SignUpScreen.routeName:  (context) => const SignUpScreen(),
  CustomBottomNavBar.routeName:  (context) => const CustomBottomNavBar(),
  OverViewStats.routeName:  (context) => const OverViewStats()
};
