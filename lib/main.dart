import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:maple/provider/all_provider.dart';
import 'package:maple/provider/getit.dart';
import 'package:maple/routes/routes.dart';
import 'package:maple/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/introduction_screen/introduction_screen.dart';
import 'package:maple/utils/color_loader.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'wood-wind',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers(),
        child: MaterialApp(
          title: 'Lossy',
          navigatorKey: getIt<NavigationService>().navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(
            // //default toast widget
            // toastBuilder: (String msg, AlignmentGeometry alignment) {
            //   return CustomToastWidget(msg: msg, alignment: alignment);
            // },
            // //default loading widget
            loadingBuilder: (String msg, Color background) {
              return ColorLoader(radius: 20,dotRadius: 8,);
            },
          ),
          theme: ThemeData(
            fontFamily: 'Nato Sans',
            textSelectionTheme: const TextSelectionThemeData(
              // Set Up for TextFields
              cursorColor: Colors.grey,
              selectionColor: Colors.blueGrey,
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFF2F2F2),
              secondary: Color(0xFFF4AE47),
              surface: Color(0xFFC4C4C4),
              background: Color(0xFFFFFFFF),
              error: Color(0xFFB00020),
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.black,
              onBackground: Colors.black,
              onError: Colors.white,
              brightness: Brightness.light,
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xFF464646),
              ),
              headline2: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xFF464646),
              ),
              headline3: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFF464646),
              ),
              headline4: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFFBDBDBD),
              ),
              headline5: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFFBDBDBD),
              ),
              headline6: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF464646),
              ),
            ),
          ),
          routes: routes,
          home: IntroductionAnimationScreen(),
    ),
    );
  }
}

///---------------Build Release Apk----------------///
///flutter build apk --build-name=1.0.x --build-number=x
