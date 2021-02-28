import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MagicBall());
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;
  List ballAnswers = [
    'Maybe',
    'Possible',
    'Yes',
    'No',
    'Ask him/her',
    'Doubt it',
    'Obviously',
    'Could be',
    'Nope',
    'Never',
    'Impossible',
    'Up to you',
  ];

  int index = 0;

  Random random = new Random();
  void changeIndex() {
    setState(() => index = random.nextInt(12));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '8BALL',
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.purple[300],
                      Colors.purple[500],
                      Colors.purple[700],
                      Colors.purple[900],
                      Colors.blue[900],
                      Colors.blue[900],
                      Colors.black,
                    ])),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.purple, Colors.blue])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        ballNumber = Random().nextInt(10) + 1;
                        changeIndex();
                      });

                      print('$ballNumber');
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'images/8Ball_0.png',
                          ),
                        ),
                        Center(
                          child: ClipPath(
                            clipper: BackgroundClipper(),
                            child: Container(
                              // color: Colors.white,
                              height: 115,
                              width: 140,
                              child: Center(
                                  child: Text(
                                    ballAnswers[index],
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Lato',
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(85, size.height);
    path.lineTo(60, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
