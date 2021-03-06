import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_commerce/scenes/home-page.dart';
import 'package:flutter_commerce/scenes/splash-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Comfortaa-Regular',
          backgroundColor: Color(0xFFF9F9F9),
          primaryColor: Color(0xFFDB3022),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Color(0xFF2AA952),
          ),
          textTheme: TextTheme(
              headline: TextStyle(fontSize: 34.0, fontFamily: 'Comfortaa-Bold'),
              overline: TextStyle(fontSize: 12.0, color: Color(0xFF9B9B9B)),
              button: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Comfortaa-SemiBold',
                  color: Colors.white))),
      home: HomePage(),
//      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
