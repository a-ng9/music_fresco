import 'dart:async';
import 'dart:io';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:music_fresco/screen/speechRecg_screen.dart';
import 'package:music_fresco/utils/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AudioRecScreen extends StatefulWidget {
  @override
  _AudioRecScreenState createState() => _AudioRecScreenState();
}

class _AudioRecScreenState extends State<AudioRecScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin audio recorder'),
      ),
      body: AudioRec(),
    );
  }
}

class AudioRec extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  AudioRec({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _AudioRecState createState() => _AudioRecState();
}

class _AudioRecState extends State<AudioRec> {
  //int _counter = 0;

  Recording _recording = Recording();
  bool _isRecording = false;
  TextEditingController _controller = TextEditingController();

  // void incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Column(children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Center(
                      child: Text(
                        "Audio Recording duration: ${_recording.duration.toString()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  //Text('$_counter'),
                  // TextField(
                  //   controller: _controller,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter a custom path',
                  //   ),
                  // ),
                  Center(
                      child: Text(
                    "File path of the record: ${_recording.path}",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  pressed: () {
                    if (!_isRecording) {
                      _start();
                      //incrementCounter();
                      //print('mic started');
                    } else if (_isRecording) {
                      _stop();
                      //print('mic stopped');
                    }
                  },
                  icon: _isRecording
                      ? Icon(Icons.stop, color: Colors.white, size: 35)
                      : Icon(Icons.mic, color: Colors.white, size: 35),
                  color: _isRecording ? Colors.red : Styles.getDarkBlueColor(),
                  size: 70,
                ),
              ],
            ),
          ])),
    );
  }

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_isRecording == true) {}
        print('mic on');

        await AudioRecorder.start(audioOutputFormat: AudioOutputFormat.AAC);

        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording =
              Recording(duration: Duration(hours: 0, minutes: 0, seconds: 0));
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    Recording recording = await AudioRecorder.stop();

    print("Stop recording: ${recording.path}");

    /*String dir = path.dirname(recording.path);
    String newPath = path.join(dir, 'Record_' + '$_counter');
    print('NewPath: $newPath');
     dir.renameSync(newPath);*/

    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }
}
