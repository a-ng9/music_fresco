import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_fresco/utils/styles.dart';
import 'package:music_fresco/screen/menu_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                      color: Styles.getDarkBlueColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your details to continue',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 35),
                Container(
                  width: 275,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (value) => email = value,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 275,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (value) => email = value,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ButtonTheme(
            minWidth: 150,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuScreen()));
              },
              color: Styles.getDarkBlueColor(),
              child: Text('Sign In', style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    ));
  }
}
