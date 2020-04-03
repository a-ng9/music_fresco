import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_fresco/screen/first_screen.dart';
import 'package:music_fresco/utils/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Styles.getDarkBlueMaterialColor,
      ),
      home: FirstScreen(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
