import 'package:maple/src/screens/devices_screen/device_total/device_total.dart';
import 'package:maple/src/screens/event_screen/event_screen.dart';
import 'package:maple/src/screens/login_screen/login_screen.dart';
import 'package:maple/src/screens/login_screen/dashboard_screen.dart';
import 'package:maple/src/screens/menu_page/menu_screen.dart';

import 'package:maple/src/screens/devices_screen/smart_ac/smart_ac.dart';
import 'package:maple/src/screens/devices_screen/smart_fan/smart_fan.dart';
import 'package:maple/src/screens/devices_screen/smart_light/smart_light.dart';
import 'package:maple/src/screens/devices_screen/smart_speaker/smart_speaker.dart';
import 'package:maple/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';

import 'package:maple/src/screens/edit_profile/edit_profile.dart';
import 'package:maple/src/screens/statistic_screen/statistic_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  SmartLight.routeName: (context) => const SmartLight(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SmartAC.routeName: (context) => const SmartAC(),
  SmartSpeaker.routeName: (context) => const SmartSpeaker(),
  SmartFan.routeName: (context) => const SmartFan(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  EditProfile.routeName: (context) =>  const EditProfile(),
  SetEventScreen.routeName: (context) => const SetEventScreen(),
  StatisticScreen.routeName: (context) => const StatisticScreen(),
  Menu.routeName: (context) => const Menu(),
  DeviceTotal.routeName:  (context) =>  DeviceTotal(),
};
