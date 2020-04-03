import 'package:flutter/material.dart';
import 'package:music_fresco/logic/ProjectName_logic.dart';
import 'package:music_fresco/screen/chat_screen.dart';
import 'package:music_fresco/utils/styles.dart';
import 'package:music_fresco/widgets/customAppBar.dart';

class NewProject extends StatefulWidget {
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 180,
                color: Styles.getDarkBlueColor(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 40),
                      child: Text(
                        '${projectName.title}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        "Last saved...",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                    ),
                    // SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[DropDown(), PlayButton()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 300,
              width: 300,
              child: Center(child: Text('Music notes')),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
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
        onPressed: () {
          print('Add button pressed');
        },
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
        height: 40,
        // width: 175,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, .35),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ButtonTheme(
          buttonColor: Color.fromRGBO(255, 255, 255, .35),
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
            hint: Text('Choose Sheet'),
          ),
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("play button pressed");
      },
      child: Icon(Icons.play_arrow, color: Styles.getDarkBlueColor()),
      fillColor: Colors.white,
      shape: CircleBorder(),
    );
  }
}
