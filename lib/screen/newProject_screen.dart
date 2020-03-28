import 'package:flutter/material.dart';
import 'package:music_fresco/utils/styles.dart';

class NewProject extends StatefulWidget {
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Project's Name"),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
        flexibleSpace: FlexibleSpaceBar(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Project 1'),
              ],
            ),
            Material(
              color: Styles.getDarkBlueColor(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropDown(),
                  Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                        ),
                        color: Styles.getDarkBlueColor(),
                        iconSize: 30,
                        onPressed: () {},
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Styles.getDarkBlueColor(),
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.chat, color: Styles.getlightPurpleColor()),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.subdirectory_arrow_left,
                    color: Styles.getlightPurpleColor()),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.subdirectory_arrow_right,
                    color: Styles.getlightPurpleColor()),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.remove_red_eye,
                    color: Styles.getlightPurpleColor()),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Lead Sheet';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 175,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, .35),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            iconSize: 25,
            elevation: 16,
            style: TextStyle(color: Colors.white, fontSize: 15),
            items: <String>['Lead Sheet', 'ID #1', 'ID #2']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            hint: Text(
              'Choose Sheet',
            ),
          ),
        ),
      ),
    );
  }
}
