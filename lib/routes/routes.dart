import 'package:maple/src/screens/event_screen/event_screen.dart';
import 'package:maple/src/screens/login_screen/login_screen.dart';
import 'package:maple/src/screens/login_screen/dashboard_screen.dart';

import 'package:maple/src/screens/smart_ac/smart_ac.dart';
import 'package:maple/src/screens/smart_light/smart_light.dart';
import 'package:maple/src/screens/smart_speaker/smart_speaker.dart';
import 'package:maple/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:maple/src/screens/home_screen/home_screen.dart';

import 'package:maple/src/screens/edit_profile/edit_profile.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  SmartLight.routeName: (context) => SmartLight(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SmartAC.routeName: (context) => SmartAC(),
  SmartSpeaker.routeName: (context) => SmartSpeaker(),
  LoginScreen.routeName: (context) => LoginScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
  EditProfile.routeName: (context) =>  EditProfile(),
  SetEventScreen.routeName: (context) => SetEventScreen(),
};
