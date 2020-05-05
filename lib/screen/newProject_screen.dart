import 'package:flutter/material.dart';
import 'package:music_fresco/logic/ProjectName_logic.dart';
import 'package:music_fresco/screen/chat_screen.dart';
import 'package:music_fresco/screen/speechRecg_screen.dart';
import 'package:music_fresco/utils/styles.dart';
import 'package:music_fresco/widgets/customAppBar.dart';

//import 'package:sliding_up_panel/sliding_up_panel.dart';

class NewProject extends StatefulWidget {
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Stack(
        children: <Widget>[
          /////main body (all widgets behind the purple sheet)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 160,
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
                  child: Center(
                    child: Text('Music notes'),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpeechRecgScreen()));
                  },
                  child: Text('Speech Recognition'),
                ),
              ],
            ),
          ),

          ////////////Bottom light purple sheet
          Center(
            child: DraggableScrollableSheet(
              initialChildSize: 0.12,
              minChildSize: 0.12,
              maxChildSize: 0.47,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Styles.getlightPurpleColor(),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 10),
                        /////white bar
                        Center(
                          child: Container(
                              height: 3, width: 100, color: Colors.white70),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Editor",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 15),
                            /////edit button
                            Container(
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.green,
                              ),
                              child: RawMaterialButton(
                                onPressed: () {
                                  print("edit button pressed");
                                },
                                child: Icon(Icons.edit, color: Colors.white),
                                shape: CircleBorder(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 180,
                          width: 120,
                          color: Colors.red,
                        ),
                        // SizedBox(height: 50)
                      ],
                    ),
                  ),
                  // child: ListView(
                  //   shrinkWrap: false,
                  //   physics: ClampingScrollPhysics(),
                  //   controller: scrollController,
                  //   children: <Widget>[
                  //     Center(
                  //         child: Text("ID #1 Editor",
                  //             style: TextStyle(color: Colors.white))),
                  //     Container(
                  //       padding: const EdgeInsets.all(50),
                  //       width: 50,
                  //       height: 50,
                  //       color: Colors.blue,
                  //     ),
                  //     Container(
                  //       width: 50,
                  //       height: 50,
                  //       color: Colors.black,
                  //     ),
                  //     Text('sodfuh'),
                  //   ],
                  // ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.green),
        child: BottomAppBar(
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

/////class for curved container (appbar)
//dropdown button in curved container
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
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, .35),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Styles.getlightPurpleColor(),
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
                    child: Container(
                      child: Text(value, style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}

//circle play button in curved container
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
