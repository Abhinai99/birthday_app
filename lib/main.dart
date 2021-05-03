import 'package:bday/last.dart';
import 'package:bday/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Text('Happy Birthday 💖!'),
          ),
        ),
        // body: ImageBanner(),
        body: ImageBanner(),
      ),
    );
  }
}
