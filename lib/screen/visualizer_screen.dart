import 'package:flutter/material.dart';
import 'package:music_fresco/utils/styles.dart';

class Visualizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.getDarkBlueMaterialColor,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 40, right: 40),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Visualizer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Material(
                    shape: CircleBorder(),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                      iconSize: 30,
                    ))
              ],
            ),
            SizedBox(height: 25),
            VisualiserList(),
          ],
        ),
      ),
    );
  }
}

class VisualiserList extends StatelessWidget {
  final List<String> entries = <String>['1', '2', '3'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 110,
                      // height: MediaQuery.of(context).size.height * 100,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      title: Text(
                        'Project ${entries[index]}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Last saved...'),
                    ),
                  ),
                ),
              ],
            );
            // return Container(
            //   height: 50,
            //   color: Colors.amber[colorCodes[index]],
            //   child: Center(child: Text('Entry ${entries[index]}')),
            // );
          }),
    );
  }
}
