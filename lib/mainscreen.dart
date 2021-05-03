import 'package:bday/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageBanner extends StatefulWidget {
  @override
  _ImageBannerState createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Container(
        // height: 500,
        //   color: Colors.black,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            'assets/images/pic.jpg',
            width: 300,
            height: 500,
          ),
        ),
        Center(
          child: ArrowButton(),
        ),
      ],
    ));
  }
}

class ArrowButton extends StatefulWidget {
  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        //color: Colors.black,
        child: FlatButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
          child: new Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30.0,
          ),
          shape: new CircleBorder(),
          color: Colors.blue,
        ));
  }
}
