import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // We are using a function to play the desired sound
  void playSound(soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  // Instead of repeating a lot of code, we can create a function
  // to export a widget, accepting certain parameters
  Expanded createTile({Color color, int soundNumber}) {
    // Named variables should always be enclosed by curly braces
    return Expanded(
      child: FlatButton(
        child: null,
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          createTile(color: Colors.red, soundNumber: 1),
          createTile(color: Colors.orange, soundNumber: 2),
          createTile(color: Colors.yellow, soundNumber: 3),
          createTile(color: Colors.green, soundNumber: 4),
          createTile(color: Colors.teal, soundNumber: 5),
          createTile(color: Colors.blue, soundNumber: 6),
          createTile(color: Colors.purple, soundNumber: 7)
        ],
      ),
    );
  }
}
