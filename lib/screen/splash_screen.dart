import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_fresco/screen/signIN_screen.dart';
import 'package:music_fresco/utils/styles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Styles.getDarkBlueColor(),
            ),
            SizedBox(height: 50),
            //////sign IN button
            ButtonTheme(
              minWidth: 200,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                color: Styles.getDarkBlueColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ////// Sign UP button
            ButtonTheme(
              minWidth: 200,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Styles.getDarkBlueColor()),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Styles.getDarkBlueColor()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
