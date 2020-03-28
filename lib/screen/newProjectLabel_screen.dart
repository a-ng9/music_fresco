import 'package:flutter/material.dart';
import 'package:music_fresco/screen/newProject_screen.dart';

class LabelProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project's Name"),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewProject()));
              },
              child: Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
