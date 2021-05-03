import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mainscreen.dart';
import './quiz.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  // state is here;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('You are the Best!!'),
      ),
      body: TopImage(),
      floatingActionButton: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetJson()),
          );
        },
        child: new Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 30.0,
        ),
        shape: new CircleBorder(),
        color: Colors.blue,
      ),
    );
  }

  // Everything should be inside this class only
}

class TopImage extends StatefulWidget {
  @override
  _TopImageState createState() => _TopImageState();
}

class _TopImageState extends State<TopImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              width: 350,
              height: 305,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/pic3.jpg'),
                ),
              ),
            ),
            // Paragraph(),
            paragraphWidget(context),
          ],
        ),
      ),
    );
  }
}

Widget paragraphWidget(BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: 'Hello ',
            style: TextStyle(color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                  text:
                      'this is a test for a paragraph i am going to write here i hope i can insert alot of word atleaset 6 lines.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' world!'),
            ],
          ),
        ),
      ],
    ),
  );
}
