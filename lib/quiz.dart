import 'dart:async';
import 'dart:convert';

import 'package:bday/last.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/quiz.json"),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading" ?? 'default value'),
            ),
          );
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  var mydata;

  QuizPage({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  List mydata = new List();
  _QuizPageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int i = 1;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
  };

  @override
  void initState() {
    super.initState();
  }

  void nextquestion() {
    if (i == 3) {
      push();
    }

    setState(() {
      if (i < 5) {
        i++;
      } else {}
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
    });
  }

  Future push() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LastPage()),
    );
  }

  void checkanswer(String k) {
    if (mydata[2]["1"] == mydata[1]["1"][k]) {
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });

    Timer(Duration(seconds: 1), nextquestion);
  }

  // ignore: non_constant_identifier_names
  Widget ChoiceButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k] ?? '',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Alike',
            fontSize: 16.0,
          ),
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Bday Card'),
                  content: Text('You Can\'t go back here!'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Okay'))
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()] ?? '',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                          ChoiceButton('a'),
                          ChoiceButton('b'),
                          ChoiceButton('c'),
                        ] ??
                        ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
