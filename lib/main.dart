import 'package:flutter/material.dart';

import 'package:music_fresco/screen/splash_screen.dart';
import 'package:music_fresco/utils/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Styles.getDarkBlueMaterialColor,
      ),
      home: SplashScreen(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
