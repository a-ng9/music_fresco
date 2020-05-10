import 'dart:async';
import 'dart:io' as io;

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
  Recording _recording = Recording();
  bool _isRecording = false;
  TextEditingController _controller = TextEditingController();

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
                        _recording.duration != null
                            ? "Audio Recording duration: ${_recording.duration.toString()}"
                            : "Audio Recording duration:",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
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
                      print('button pressed');
                    } else if (_isRecording) {
                      _stop();
                      print('button pressed to stop mic');
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
        AudioRecorder.start(audioOutputFormat: AudioOutputFormat.AAC);
        bool isRecording = await AudioRecorder.isRecording;

        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        print('path: $appDocDirectory');

        setState(() {
          _recording = Recording(duration: Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Accept microphone permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();

    print("Stop recording: ${recording.path}");

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
