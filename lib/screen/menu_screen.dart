import 'package:flutter/material.dart';

import 'package:music_fresco/screen/myProjects_screen.dart';
import 'package:music_fresco/screen/newProjectLabel_screen.dart';
import 'package:music_fresco/screen/visualizer_screen.dart';
import 'package:music_fresco/utils/styles.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.getDarkBlueColor(),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.format_align_justify)),
        ],
        // flexibleSpace: Text('Hi Jane,'),
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuButton(
                  color: Styles.getlightPurpleColor(),
                  label: 'New Project',
                  icon: Icon(Icons.add, color: Colors.white, size: 35),
                  path: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LabelProject()));
                  }),
              MenuButton(
                  color: Styles.getDarkBlueColor(),
                  label: 'My Projects',
                  icon: Icon(Icons.queue_music, color: Colors.white, size: 35),
                  path: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProjects()));
                  }),
              MenuButton(
                  color: Styles.getNavyBlueColor(),
                  label: 'Visualiser',
                  icon:
                      Icon(Icons.remove_red_eye, color: Colors.white, size: 35),
                  path: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Visualizer()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final Color color;
  final String label;
  final Icon icon;
  final GestureTapCallback path;

  const MenuButton({Key key, this.color, this.label, this.icon, this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 90,
      // minWidth: 250,
      child: RaisedButton(
        onPressed: path,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
