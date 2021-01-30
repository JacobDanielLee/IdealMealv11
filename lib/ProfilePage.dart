import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/main.dart';
import 'package:idealmealv11/profile.dart';
import 'package:idealmealv11/base_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();


}

  class _ProfilePage extends State<ProfilePage> {

    String Name;
    String Email;
    String Password;
    bool obscurePassword = true;

    void toggle() {
      setState(() {
        obscurePassword = !obscurePassword;
      });
    }

    void checkBox() {
      setState(() {
        rememberMe = !rememberMe;
      });
    }


    @override
    Widget build(BuildContext context) {
      return BaseWidget(
          builder: (context, sizingInformation)
      {
        return Scaffold(
          backgroundColor: Colors.white,
          body:
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Transform.translate(
                    offset: Offset(10.0, 36.0),
                    child:
                    SizedBox(
                      width: 392.0,
                      height: 737.0,
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 146.5, 20.0),
                            child: Container(
                              width: 293.0,
                              height: 132.0,
                              child: Text(
                                'Hello, \nWelcome to \nIdeal Meal.',
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 35,
                                  color: const Color(0xff030504),
                                  letterSpacing: 1.4000000000000001,
                                  fontWeight: FontWeight.w700,
                                  height: 1.1428571428571428,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          //Name
                          Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 146.5, 171.0),
                            child: Container(
                              width: 293.0,
                              height: 55.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x40b4d4a5),
                                ),
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: ' Name',
                                    ),
                                    onChanged: (String str) {
                                      Name = str;
                                    }
                                ),
                              ),
                            ),
                          ),
                          //Email
                          Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 146.5, 225.0),
                            child: Container(
                              width: 293.0,
                              height: 55.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x40b4d4a5),
                                ),
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: ' Email',
                                    ),
                                    onChanged: (String str) {
                                      Email = str;
                                    }
                                ),
                              ),
                            ),
                          ),
                          //Password
                          Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 146.5, 279.0),
                            child: Container(
                              width: 293.0,
                              height: 45.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x40b4d4a5),
                                ),
                                child: TextField(
                                    decoration: InputDecoration(
                                        hintText: ' Password',
                                        suffix:
                                        GestureDetector(child: Text(
                                            obscurePassword ? 'show ' : 'hide '),
                                          onTap: () {
                                            toggle();
                                          },)
                                    ),
                                    obscureText: obscurePassword,
                                    onChanged: (String str) {
                                      Password = str;
                                    }
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(sizingInformation.screenSize.width/2 - 146.5, 330.0),
                            child:
                            Container(
                                width: 293.0,
                                height: 25.0,
                                alignment: Alignment.topCenter,
                                child:
                                Row(children: [
                                  Expanded(child: Text('Remember Me')),
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkBox();
                                      });
                                    },
                                  ),
                                ],)
                            ),
                          ),
                          Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 104.5, 365.0),
                            child: Container(
                              width: 209.0,
                              height: 46.0,
                              decoration: BoxDecoration(
                                color: const Color(0xffb4d4a5).withOpacity(0.55),
                              ),
                              child: FlatButton(
                                  onPressed: () {
                                    firstTime++;
                                    if (rememberMe) {
                                      profile = new Profile(id: 0,
                                          name: Name,
                                          email: Email,
                                          password: Password);
                                    }
                                    Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                                  },
                                  child: Text(
                                    'sign up',
                                    style: TextStyle(
                                      fontFamily: 'Avenir Next',
                                      fontSize: 15,
                                      color: const Color(0xff848484),
                                      letterSpacing: 0.44999999999999996,
                                      height: 2.6666666666666665,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                              ),
                              ),
                            ),
                          //Building 1
                          Transform.translate(
                            offset: Offset(-10.0, 489),
                            child: Container(
                              width: 96.9,
                              height: 153.6,
                              color: const Color(0xb29dcc93),
                            ),
                          ),
                          //Building 2
                          Transform.translate(
                            offset: Offset(87.41, 436),
                            child: Container(
                              width: 87.6,
                              height: 207.8,
                              color: const Color(0x739dcc93),
                            ),
                          ),
                          //Building 3
                          Transform.translate(
                            offset: Offset(174.97, 466),
                            child: Container(
                              width: 108.0,
                              height: 176.9,
                              color: const Color(0xb29dcc93),
                            ),
                          ),
                          //Building 4
                          Transform.translate(
                            offset: Offset(282.83, 508),
                            child: Container(
                              width: 63.6,
                              height: 134.9,
                              color: const Color(0xff9dcc93),
                            ),
                          ),
                          //Building 5
                          Transform.translate(
                            offset: Offset(346.39, 473),
                            child: Container(
                              width: 56.5,
                              height: 170.4,
                              color: const Color(0xbf9dcc93),
                            ),
                          ),

                          //Windows of 1st building
                          Transform.translate(
                            offset: Offset(10.57, 503),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 503),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 503),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 503),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 519),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 519),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 519),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 519),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 533),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 533),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 533),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 533),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 548),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 548),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 548),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 548),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 561),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 561),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 561),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 561),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 577),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 577),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 577),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 577),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 592),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 592),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 592),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 592),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(10.57, 606),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(27.51, 606),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(44.46, 606),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(60.35, 606),
                            child: Container(
                              width: 10.9,
                              height: 10.9,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 448.82),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 448.82),
                            child: SvgPicture.string(
                              _svg_k0xxu0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 448.82),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 448.82),
                            child: SvgPicture.string(
                              _svg_bi34fn,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(149.91, 448.82),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(149.91, 448.82),
                            child: SvgPicture.string(
                              _svg_6apqzh,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(183.09, 478.12),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(216.28, 478.12),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(248.76, 477.06),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            //Area for diet scroll
                            offset: Offset(152.6, 315.23),
                            child: Text(''),
                          ),
                          Transform.translate(
                            offset: Offset(184.5, 479.5),
                            child: Container(
                              width: 22.0,
                              height: 22.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.57, 480.06),
                            child: SvgPicture.string(
                              _svg_5ej1ht,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(218.4, 480.21),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(218.93, 480.21),
                            child: SvgPicture.string(
                              _svg_u7u51r,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(250.89, 479.15),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(251.42, 479.15),
                            child: SvgPicture.string(
                              _svg_763qbg,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(183.51, 508.98),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(216.7, 508.98),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(249.18, 507.92),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.46, 510.92),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.99, 510.92),
                            child: SvgPicture.string(
                              _svg_trayzy,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(218.82, 511.07),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(219.35, 511.06),
                            child: SvgPicture.string(
                              _svg_h2628k,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(251.31, 510.01),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(251.84, 510.01),
                            child: SvgPicture.string(
                              _svg_d1ok29,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(183.16, 539.7),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(216.35, 539.7),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(248.83, 538.64),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.1, 541.64),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.63, 541.64),
                            child: SvgPicture.string(
                              _svg_n6dqlq,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(218.47, 541.78),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(219.0, 541.78),
                            child: SvgPicture.string(
                              _svg_fgvmc0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(250.95, 540.72),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(251.48, 540.72),
                            child: SvgPicture.string(
                              _svg_4ntxmg,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(183.16, 571.83),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(216.35, 571.83),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(248.83, 570.77),
                            child: Container(
                              width: 25.4,
                              height: 25.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.1, 573.77),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(185.63, 573.77),
                            child: SvgPicture.string(
                              _svg_7d6h5u,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(218.47, 573.91),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(219.0, 573.91),
                            child: SvgPicture.string(
                              _svg_rh0ol,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(250.95, 572.85),
                            child: Container(
                              width: 21.5,
                              height: 21.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: const Color(0xb29dcc93)),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(251.48, 572.85),
                            child: SvgPicture.string(
                              _svg_hkqrck,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.01, 524.13),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.01, 516.25),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(307.72, 523.7),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(307.72, 515.9),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.08, 523.7),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.08, 515.82),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(288.48, 515.02),
                            child: SvgPicture.string(
                              _svg_xip6qt,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.22, 551.59),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.22, 543.71),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(307.93, 551.16),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(307.93, 543.36),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.29, 551.16),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.29, 543.28),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(288.69, 542.48),
                            child: SvgPicture.string(
                              _svg_w87z0w,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.73, 578.22),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.73, 570.35),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(308.44, 577.79),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(308.44, 569.99),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.8, 577.79),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.8, 569.91),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.2, 569.11),
                            child: SvgPicture.string(
                              _svg_vbtq3m,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.38, 606.47),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(289.38, 598.59),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(308.09, 606.04),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(308.09, 598.24),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.44, 606.04),
                            child: Container(
                              width: 14.5,
                              height: 14.4,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(326.44, 598.16),
                            child: Container(
                              width: 14.5,
                              height: 14.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(7.24, 7.24)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(288.85, 597.36),
                            child: SvgPicture.string(
                              _svg_9i4ra,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 478.12),
                            child: Container(
                              width: 25.4,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(383.63, 478.12),
                            child: Container(
                              width: 11.3,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 489.59),
                            child: SvgPicture.string(
                              _svg_vukdjv,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 489.42),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 489.42),
                            child: SvgPicture.string(
                              _svg_ghcd8g,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 489.42),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 489.42),
                            child: SvgPicture.string(
                              _svg_upbglh,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(149.91, 489.42),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 489.42),
                            child: SvgPicture.string(
                              _svg_ennpk1,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 530.02),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 530.02),
                            child: SvgPicture.string(
                              _svg_tsvsct,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 530.02),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 530.02),
                            child: SvgPicture.string(
                              _svg_p6bj72,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(149.91, 530.02),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 530.02),
                            child: SvgPicture.string(
                              _svg_gz3ew,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 570.27),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 570.27),
                            child: SvgPicture.string(
                              _svg_mz4wce,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 570.27),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(124.13, 570.27),
                            child: SvgPicture.string(
                              _svg_4fmfe5,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(149.91, 570.27),
                            child: Container(
                              width: 16.6,
                              height: 36.0,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(98.36, 477.06),
                            child: SvgPicture.string(
                              _svg_rese9d,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 516.96),
                            child: Container(
                              width: 25.4,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(383.63, 516.96),
                            child: Container(
                              width: 11.3,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 515.9),
                            child: SvgPicture.string(
                              _svg_8vzkqf,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 555.44),
                            child: Container(
                              width: 25.4,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(383.63, 555.44),
                            child: Container(
                              width: 11.3,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 555.44),
                            child: SvgPicture.string(
                              _svg_drukb1,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 593.22),
                            child: Container(
                              width: 25.4,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(383.63, 593.22),
                            child: Container(
                              width: 11.3,
                              height: 34.6,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(351.5, 593.22),
                            child: SvgPicture.string(
                              _svg_m3ayj,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          //Street and lines
                          Transform.translate(offset: Offset(-10, 654),
                              child: Container(color: const Color(0xb295c27f),
                                width: sizingInformation.screenSize.width, height: 48.1,)
                          ),
                          Transform.translate(offset: Offset(3.7, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(27.8, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(56.4, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(84.8, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(114.8, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(142.8, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(170.4, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(198.5, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(225.9, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(254.2, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(281.4, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(312.6, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(342.9, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Transform.translate(offset: Offset(372.5, 678),
                              child: Container(color: Colors.white,
                                width: 19.7, height: 1.0,)
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 760, 0, 30),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'CHAMPAIGN-URBANA',
                                style: TextStyle(
                                  fontFamily:
                                  'AvenirNext-Bold',
                                  fontSize: 13.5,
                                  color: const Color(
                                      0xff030504),
                                  letterSpacing: 0.4185,
                                  height:
                                  0.8888888888888888,
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                              offset: Offset(29, 596),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(115, 596),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(205, 596),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(290, 596),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(362, 596),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(58, 691),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(144, 691),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(230, 691),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),
                          Transform.translate(
                              offset: Offset(313, 691),
                              child:
                              Container(
                                height: 52.0,
                                width: 9.1,
                                child: Image(
                                    image: AssetImage('assets/images/Lightpost.png')),
                              )
                          ),

                          
                        ],
                      ),
                    ),
                  ),
                    ],
                  ),
        );
      });
    }
  }




const String _svg_k0xxu0 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 242.8 16.6 36.0" ><path transform="translate(106.83, 242.82)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 253.76)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_bi34fn =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="124.1 242.8 16.6 36.0" ><path transform="translate(132.25, 242.82)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(124.13, 253.76)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_6apqzh =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="149.9 242.8 16.6 36.0" ><path transform="translate(158.38, 242.82)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 253.76)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_5ej1ht =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="185.6 274.1 21.2 21.4" ><path transform="translate(196.16, 274.06)" d="M 9.094947017729282e-13 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(185.57, 285.01)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_u7u51r =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="218.9 274.2 21.2 21.4" ><path transform="translate(229.53, 274.21)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(218.93, 285.15)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_763qbg =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="251.4 273.1 21.2 21.4" ><path transform="translate(262.01, 273.15)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(251.42, 284.09)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_trayzy =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="186.0 304.9 21.2 21.4" ><path transform="translate(196.58, 304.92)" d="M 1.818989403545856e-12 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(185.99, 315.87)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_h2628k =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="219.4 305.1 21.2 21.4" ><path transform="translate(229.95, 305.06)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(219.35, 316.01)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_d1ok29 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="251.8 304.0 21.2 21.4" ><path transform="translate(262.43, 304.01)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(251.84, 314.95)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_n6dqlq =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="185.6 335.6 21.2 21.4" ><path transform="translate(196.22, 335.64)" d="M 9.094947017729282e-13 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(185.63, 346.58)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_fgvmc0 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="219.0 335.8 21.2 21.4" ><path transform="translate(229.59, 335.78)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(219.0, 346.73)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_4ntxmg =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="251.5 334.7 21.2 21.4" ><path transform="translate(262.07, 334.72)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(251.48, 345.67)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_7d6h5u =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="185.6 367.8 21.2 21.4" ><path transform="translate(196.22, 367.77)" d="M 9.094947017729282e-13 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(185.63, 378.71)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_rh0ol =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="219.0 367.9 21.2 21.4" ><path transform="translate(229.59, 367.91)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(219.0, 378.86)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_hkqrck =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="251.5 366.9 21.2 21.4" ><path transform="translate(262.07, 366.85)" d="M 0 0 L 0 21.36181831359863" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(251.48, 377.8)" d="M 0 0 L 21.18376541137695 0" fill="none" fill-opacity="0.7" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.7" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_xip6qt =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="288.5 309.0 52.1 24.0" ><path transform="translate(296.07, 310.25)" d="M 0.1765313893556595 22.77254867553711 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(289.01, 317.31)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(288.48, 326.14)" d="M 0 0.1765313893556595 L 15.00516700744629 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(314.96, 309.02)" d="M 0.228877991437912 23.28199195861816 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(307.72, 317.49)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(307.72, 326.32)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.08, 317.14)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.08, 326.32)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(333.32, 309.37)" d="M 0.1958338767290115 22.73927307128906 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_w87z0w =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="288.7 336.5 52.1 24.0" ><path transform="translate(296.28, 337.71)" d="M 0.1765313893556595 22.77254867553711 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(289.22, 344.77)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(288.69, 353.6)" d="M 0 0.1765313893556595 L 15.00516700744629 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(315.17, 336.48)" d="M 0.228877991437912 23.28199195861816 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(307.93, 344.95)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(307.93, 353.78)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.29, 344.6)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.29, 353.78)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(333.53, 336.83)" d="M 0.1958338767290115 22.73927307128906 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_vbtq3m =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="289.2 363.1 52.1 24.0" ><path transform="translate(296.79, 364.35)" d="M 0.1765313893556595 22.77254867553711 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(289.73, 371.41)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(289.2, 380.23)" d="M 0 0.1765313893556595 L 15.00516700744629 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(315.68, 363.11)" d="M 0.228877991437912 23.28199195861816 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(308.44, 371.58)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(308.44, 380.41)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.8, 371.23)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.8, 380.41)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(334.04, 363.46)" d="M 0.1958338767290115 22.73927307128906 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_9i4ra =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="288.8 391.4 52.1 24.0" ><path transform="translate(296.44, 392.59)" d="M 0.1765313893556595 22.77254867553711 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(289.38, 399.65)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(288.85, 408.48)" d="M 0 0.1765313893556595 L 15.00516700744629 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(315.32, 391.36)" d="M 0.228877991437912 23.28199195861816 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(308.09, 399.83)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(308.09, 408.66)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.45, 399.48)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(326.45, 408.66)" d="M 0 0 L 14.47557353973389 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(333.69, 391.71)" d="M 0.1958338767290115 22.73927307128906 L 0 0" fill="none" stroke="#9dcc93" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_vukdjv =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 268.6 68.1 1.0" ><path transform="translate(149.91, 268.59)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(123.78, 268.59)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 268.59)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ghcd8g =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 283.4 16.6 36.0" ><path transform="translate(106.83, 283.42)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 294.37)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_upbglh =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="124.1 283.4 16.6 36.0" ><path transform="translate(132.25, 283.42)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(124.13, 294.37)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ennpk1 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 283.4 68.1 36.0" ><path transform="translate(158.38, 283.42)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 294.37)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 309.19)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(123.78, 309.19)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 309.19)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_tsvsct =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 324.0 16.6 36.0" ><path transform="translate(106.83, 324.02)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 334.97)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_p6bj72 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="124.1 324.0 16.6 36.0" ><path transform="translate(132.25, 324.02)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(124.13, 334.97)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_gz3ew =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 324.0 68.1 36.0" ><path transform="translate(158.38, 324.02)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 334.97)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 349.8)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(123.78, 349.8)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 349.8)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mz4wce =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 364.3 16.6 36.0" ><path transform="translate(106.83, 364.27)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 375.22)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_4fmfe5 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="124.1 364.3 16.6 36.0" ><path transform="translate(132.25, 364.27)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(124.13, 375.22)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_rese9d =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="98.4 271.1 296.6 129.2" ><path transform="translate(158.38, 364.27)" d="M 0 36.01240158081055 L 0 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 375.22)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(149.91, 390.05)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(123.78, 390.05)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(98.36, 390.05)" d="M 0 0 L 16.59395027160645 0" fill="none" fill-opacity="0.45" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(351.5, 289.42)" d="M 0 0 L 25.42051887512207 0" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(364.21, 271.06)" d="M 0 0 L 0 35.65933990478516" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(383.63, 289.42)" d="M 0 0 L 11.29800891876221 0" fill="none" stroke="#9dcc93" stroke-width="2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_8vzkqf =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="351.5 309.9 43.4 36.0" ><path transform="translate(351.5, 328.26)" d="M 0 0 L 25.42051887512207 0" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(364.21, 309.9)" d="M 0 0 L 0 36.01240158081055" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(383.63, 328.26)" d="M 0 0 L 11.29800891876221 0" fill="none" stroke="#9dcc93" stroke-width="2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_drukb1 =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="351.5 349.4 43.4 34.6" ><path transform="translate(351.5, 366.74)" d="M 0 0 L 25.42051887512207 0" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(364.21, 349.44)" d="M 0 0 L 0 34.60015106201172" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(383.63, 366.74)" d="M 0 0 L 11.29800891876221 0" fill="none" stroke="#9dcc93" stroke-width="2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m3ayj =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="351.5 387.2 43.4 34.6" ><path transform="translate(351.5, 404.52)" d="M 0 0 L 25.42051887512207 0" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(364.21, 387.22)" d="M 0 0 L 0 34.60015106201172" fill="none" fill-opacity="0.75" stroke="#9dcc93" stroke-width="2" stroke-opacity="0.75" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(383.63, 404.52)" d="M 0 0 L 11.29800891876221 0" fill="none" stroke="#9dcc93" stroke-width="2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';


const String _svg_a6bj4i =
    '<svg viewBox="5.0 0.0 1.0 1.4" ><path transform="translate(-509.87, -554.98)" d="M 514.8260498046875 555.0150146484375 C 514.9429321289062 555.0906372070312 515.0245971679688 555.2135009765625 515.0701293945312 555.3458862304688 C 515.11572265625 555.4773559570312 515.127685546875 555.6192016601562 515.1285400390625 555.7584838867188 C 515.1294555664062 555.833251953125 515.127685546875 555.9080200195312 515.114013671875 555.9810791015625 C 515.0830078125 556.1417846679688 514.998779296875 556.287109375 514.906005859375 556.4212036132812" fill="none" stroke="#1a1818" stroke-width="0.05000000074505806" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_l1peh2 =
    '<svg viewBox="-4.6 685.1 378.4 1.9" ><path transform="translate(-4.56, 685.13)" d="M 0 1.881927251815796 L 378.3890686035156 0" fill="none" stroke="#1a1818" stroke-width="0.05000000074505806" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_y96q70 =
    '<svg viewBox="-4.6 711.1 12.6 1.0" ><path transform="translate(-4.56, 711.07)" d="M 0 0 L 12.58179664611816 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_wsceb7 =
    '<svg viewBox="19.6 711.1 19.7 1.0" ><path transform="translate(19.6, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_qhvwpz =
    '<svg viewBox="48.2 711.1 19.7 1.0" ><path transform="translate(48.19, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_qax80v =
    '<svg viewBox="76.6 711.1 19.7 1.0" ><path transform="translate(76.62, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_hufsic =
    '<svg viewBox="106.6 711.1 19.7 1.0" ><path transform="translate(106.58, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_qotvxf =
    '<svg viewBox="134.6 711.1 19.7 1.0" ><path transform="translate(134.57, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_v7py53 =
    '<svg viewBox="162.2 711.1 19.7 1.0" ><path transform="translate(162.22, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_opo4w9 =
    '<svg viewBox="190.3 711.1 19.7 1.0" ><path transform="translate(190.27, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_lxzb8z =
    '<svg viewBox="217.6 711.1 19.7 1.0" ><path transform="translate(217.64, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ddx1gj =
    '<svg viewBox="246.0 711.1 19.7 1.0" ><path transform="translate(245.98, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_xxb13m =
    '<svg viewBox="273.2 711.1 19.7 1.0" ><path transform="translate(273.18, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_p73xwn =
    '<svg viewBox="304.4 711.1 19.7 1.0" ><path transform="translate(304.39, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_1tffwh =
    '<svg viewBox="334.7 711.1 19.7 1.0" ><path transform="translate(334.7, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_9u1nxa =
    '<svg viewBox="364.3 711.1 19.7 1.0" ><path transform="translate(364.31, 711.07)" d="M 0 0 L 19.73202705383301 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
