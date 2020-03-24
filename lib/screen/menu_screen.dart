import 'package:flutter/material.dart';

import 'package:music_fresco/utils/styles.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.format_align_justify)),
        ],
        // flexibleSpace: Text('Hi Jane,'),
      ),
      body: Center(
        child: SizedBox(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuButton(
                color: Colors.blue,
                label: 'Create a New Project',
                icon: Icon(Icons.add),
              ),
              Container(
                color: Styles.getlightPurpleColor(),
                height: 100,
                width: 300,
                child: Row(
                  children: <Widget>[
                    Text('Create a New Project',
                        style: TextStyle(color: Colors.white)),
                    Icon(Icons.add)
                  ],
                ),
              ),
              Container(
                color: Styles.getDarkBlueColor(),
                height: 100,
                width: 300,
              ),
              Container(
                color: Styles.getNavyBlueColor(),
                height: 100,
                width: 300,
              ),
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

  const MenuButton({Key key, this.color, this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      width: 300,
      child: Row(
        children: <Widget>[
          Text(label, style: TextStyle(color: Colors.white)),
          icon
        ],
      ),
    );
  }
}
