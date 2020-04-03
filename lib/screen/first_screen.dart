import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_fresco/screen/signIN_screen.dart';
import 'package:music_fresco/utils/styles.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /////make status bar (in the phone) change to black color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //////logo
            ///hero widget acts as an animation. works together with 1st and 2nd screen
            Hero(
              tag: 'logo',
              child: Container(
                width: 100,
                height: 100,
                color: Styles.getDarkBlueColor(),
                // child: Text('Logo', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 40),
            //////SIGN-IN button
            ButtonTheme(
              minWidth: 200,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      )

                      /////////One way to delay animation hero widget, but does not delay other widgets
                      // PageRouteBuilder(
                      // pageBuilder: (_, __, ___) => SignInScreen(),
                      // transitionDuration: Duration(seconds: 1),)
                      );
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
