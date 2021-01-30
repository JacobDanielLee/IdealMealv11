import 'dart:async';
import 'package:adobe_xd/pinned.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idealmealv11/Loadingpage2.dart';
import 'package:idealmealv11/ProfilePage.dart';
import 'package:idealmealv11/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  void initState() {
    super.initState();
    if (rememberMe) {
      Timer(Duration(seconds: 3), () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())));
    }
    if (firstTime == 0) {
      Timer(Duration(seconds: 3), () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage())));
    }
    else if (firstTime == 1) {
      Timer(Duration(seconds: 3), () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoadingPage2())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xe2b4d4a5),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-70.0, 182.0),
            child: SizedBox(
              width: 540.0,
              height: 429.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 690.0, 429.0),
                    size: Size(540.0, 429.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                    // Adobe XD layer: 'white ideal meal lo…' (shape)
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/logos with text/IdealMealLogoText.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
