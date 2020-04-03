import 'package:flutter/material.dart';
import 'package:music_fresco/logic/ProjectName_logic.dart';
import 'package:music_fresco/screen/newProject_screen.dart';
import 'package:music_fresco/utils/styles.dart';
// import 'package:music_fresco/models/project_name.dart';

class LabelProject extends StatefulWidget {
  @override
  _LabelProjectState createState() => _LabelProjectState();
}

class _LabelProjectState extends State<LabelProject> {
  final TextEditingController projectLabel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.getDarkBlueMaterialColor,
      appBar: AppBar(
        // title: Text("Project's Name"),
        elevation: 0,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 100),
          width: MediaQuery.of(context).size.width * 60,
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Project's Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
              Container(
                width: 300,
                child: TextField(
                  controller: projectLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38, width: 2),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w300,
                        letterSpacing: .5,
                        fontSize: 15),
                    hintText: "Type in your Project's Name",
                  ),
                  maxLines: 1,
                ),
              ),
              //
              RaisedButton(
                onPressed: () {
                  projectName.title = projectLabel.text;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewProject()));
                },
                child: Text('Create'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
