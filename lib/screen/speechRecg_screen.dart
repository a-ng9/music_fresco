import 'package:flutter/material.dart';
//import 'package:music_fresco/utils/styles.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecgScreen extends StatefulWidget {
  @override
  _SpeechRecgScreenState createState() => _SpeechRecgScreenState();
}

class _SpeechRecgScreenState extends State<SpeechRecgScreen> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecogniser();
  }

  void initSpeechRecogniser() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
        (bool result) => setState(() => _isAvailable = result));

    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speechRecognition.setRecognitionResultHandler(
        (String speech) => setState(() => resultText = speech));

    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));

    _speechRecognition
        .activate()
        .then((result) => setState(() => _isAvailable = result));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech Recognition"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  pressed: () {
                    print('stop Button pressed');
                    if (_isListening) {
                      _speechRecognition.cancel().then((result) => setState(() {
                            _isListening = result;
                            resultText = "";
                          }));
                    }
                  },
                  icon: Icon(Icons.stop),
                  color: Colors.blue,
                  size: 40,
                ),
                SizedBox(width: 10),
                CustomButton(
                  pressed: () {
                    //The below IF function will activate the mic and listen for audio
                    if (_isAvailable && !_isListening) {
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => ('$result'));
                    }
                    /*The below IF function will 'stop' listening when the mic is available (pressed a 2nd time)*/
                    // else if (_isListening) {
                    //   _speechRecognition.stop().then(
                    //       (result) => setState(() => _isListening = result));
                    // }
                  },
                  icon: Icon(
                    (_isAvailable && !_isListening) ? Icons.mic : Icons.pause,
                    size: 40,
                    color: (_isAvailable && !_isListening)
                        ? Colors.black
                        : Colors.white,
                  ),
                  color: Colors.blue,
                  size: 60,
                ),
                SizedBox(width: 10),
                CustomButton(
                  pressed: () {
                    if (_isListening) {
                      _speechRecognition.stop().then(
                          (result) => setState(() => _isListening = result));
                    }
                  },
                  icon: Icon(Icons.pause),
                  color: Colors.blue,
                  size: 40,
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              width: MediaQuery.of(context).size.width * .8,
              // color: Colors.red,
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            )
          ],
        ),
      ),
    );
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
