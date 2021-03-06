import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_fresco/utils/styles.dart';
import 'package:music_fresco/screen/menu_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 60),
              /////hero widget animation destination
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: 60,
                  height: 60,
                  color: Styles.getDarkBlueColor(),
                  //////child: ,      (add image of logo)
                ),
              ),
            ),
          ],
        ),
      ),
      /////systemUIOverlayStyle is to change mobile's status bar color
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        ////1st column to center all widgets together
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ////2nd column aligns all widgets to the left
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
                  //////email text input
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
                  /////password text input
                  Container(
                    width: 275,
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
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
            ////////SIGNIN button
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

            ///////temporary button to test hero animation
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
