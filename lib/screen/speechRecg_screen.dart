import 'package:flutter/material.dart';
import 'package:music_fresco/utils/styles.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechRecgScreen extends StatefulWidget {
  @override
  _SpeechRecgScreenState createState() => _SpeechRecgScreenState();
}

class _SpeechRecgScreenState extends State<SpeechRecgScreen> {
  bool _hasSpeech = false;
  double level = 0.0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "en_UK";
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Recognition'),
      ),
      body: Column(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: Text(
                    lastWords,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 45),
            CustomButton(
              pressed: () {
                if (!_hasSpeech || !speech.isListening) {
                  startListening();
                  print('mic started');
                } else if (speech.isListening) {
                  stopListening();
                  print('mic stopped');
                }
              },
              icon: (!_hasSpeech || speech.isListening)
                  ? Icon(Icons.pause, color: Colors.white)
                  : Icon(Icons.mic, color: Colors.white),
              color: (!_hasSpeech || speech.isListening)
                  ? Colors.red
                  : Styles.getDarkBlueColor(),
              size: 60,
            ),
            SizedBox(width: 5),
            CustomButton(
              pressed: cancelListening,
              icon: Icon(Icons.stop, color: Colors.white),
              color: Colors.red,
              size: 40,
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: speech.isListening
                ? Text(
                    "Listening...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  )
                : Text(
                    'Not listening',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
          ),
        ),
      ]),
    );
  }

  void startListening() {
    // lastWords = "";
    // lastError = "";
    speech.listen(
      onResult: resultListener,
      listenFor: Duration(seconds: 10),
      localeId: _currentLocaleId,
      onSoundLevelChange: soundLevelListener,
      //cancelOnError: true,
      //partialResults: true
    );
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    lastWords = "";
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
    });
  }

  void soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }
}

class CustomButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final VoidCallback pressed;
  final double size;

  const CustomButton({
    Key key,
    this.pressed,
    this.icon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          splashColor: Colors.red,
          child: SizedBox(width: size, height: size, child: icon),
          onTap: pressed,
        ),
      ),
    );
  }
}
