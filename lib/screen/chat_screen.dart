import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 100, right: 100),
          child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: .5,
            builder: (context, scrollController) {
              return Container(
                color: Colors.red,
                child: ListView(
                  shrinkWrap: false,
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
                  children: <Widget>[
                    Center(child: Text("ID #1 Editor")),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
