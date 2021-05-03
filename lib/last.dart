import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  String imagePath;
  int currentImage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePath = 'assets/images/pic5.jpg';
  }

  void onClickImage() {
    try {
      String img;

      if (currentImage == 6) {
        setState(() {
          currentImage = 1;
        });
      } else {
        setState(() {
          currentImage++;
        });
      }

      switch (currentImage) {
        case 1:
          img = 'assets/images/pic5.jpg';
          break;
        case 2:
          img = 'assets/images/pic6.jpg';
          break;
        case 3:
          img = 'assets/images/pic7.jpg';
          break;
        case 4:
          img = 'assets/images/pic8.jpg';
          break;
        case 5:
          img = 'assets/images/pic9.jpg';
          break;
        default:
          img = 'assets/images/pic5.jpg';
          break;
      }

      setState(() {
        imagePath = img;
      });
    } catch (e) {
      print('Exception: $e');
    }
  }

  // ignore: missing_return
  Widget imageBanner(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onClickImage();
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              imagePath,
              width: 300,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageBanner(context);
  }
}
