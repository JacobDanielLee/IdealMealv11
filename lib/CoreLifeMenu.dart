import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './GreenBowls.dart';
import 'package:adobe_xd/page_link.dart';
import './GrainBowls.dart';
import './BrothBowls.dart';
import './Home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoreLifeMenu extends StatelessWidget {
  CoreLifeMenu({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.5, 254.5),
            child: SvgPicture.string(
              _svg_fpskey,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(21.6, 276.0),
            child: SizedBox(
              width: 53.0,
              child: Text(
                'DIETS',
                style: TextStyle(
                  fontFamily: 'Avenir Next',
                  fontSize: 15,
                  color: const Color(0xff000000),
                  letterSpacing: 0.46499999999999997,
                  fontWeight: FontWeight.w700,
                  height: 3.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 31.0),
            child: SizedBox(
              width: 296.0,
              height: 128.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 296.0, 97.0),
                    size: Size(296.0, 128.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'corelife eatery log…' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(8.0, 97.0, 82.0, 15.0),
                    size: Size(296.0, 128.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '(217) 693-6993',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 11,
                        color: const Color(0xff000000),
                        letterSpacing: 0.34099999999999997,
                        height: 4.818181818181818,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(45.0, 113.0, 194.0, 15.0),
                    size: Size(296.0, 128.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '2512 N Prospect Ave, Champaign, IL',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 11,
                        color: const Color(0xff000000),
                        letterSpacing: 0.34099999999999997,
                        height: 4.818181818181818,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(116.0, 97.0, 166.0, 15.0),
                    size: Size(296.0, 128.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'https://www.corelifeeatery.com',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 11,
                        color: const Color(0xff000000),
                        letterSpacing: 0.34099999999999997,
                        height: 4.818181818181818,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(100.0, 77.0, 6.0, 36.0),
                    size: Size(296.0, 128.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 26,
                        color: const Color(0xff000000),
                        letterSpacing: 0.806,
                        height: 1.9230769230769231,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-10.0, 429.0),
            child: SizedBox(
              width: 395.0,
              height: 343.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 274.0, 336.0, 61.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x59cee5c9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(20.0, 292.0, 375.0, 51.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(27.0, 1.0, 90.0, 20.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'KIDS MENU',
                            style: TextStyle(
                              fontFamily: 'Avenir Next',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              letterSpacing: 0.46499999999999997,
                              fontWeight: FontWeight.w700,
                              height: 3.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(322.0, 7.0, 7.4, 12.0),
                          size: Size(375.0, 51.0),
                          pinRight: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'ic_chevron_right_24…' (shape)
                              SvgPicture.string(
                            _svg_mm0afy,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 51.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 0.0, 336.0, 61.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.SlideLeft,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => GreenBowls(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0x809dcc93),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(47.0, 20.0, 114.0, 20.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'GREEN BOWLS',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 15,
                        color: const Color(0xff000000),
                        letterSpacing: 0.46499999999999997,
                        fontWeight: FontWeight.w700,
                        height: 3.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(342.0, 25.0, 7.4, 12.0),
                    size: Size(395.0, 343.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'ic_chevron_right_24…' (shape)
                        SvgPicture.string(
                      _svg_6j12w5,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 3.0, 336.0, 55.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 336.0, 55.0),
                          size: Size(336.0, 55.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 67.0, 336.0, 61.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.SlideLeft,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => GrainBowls(),
                        ),
                      ],
                      child: SvgPicture.string(
                        _svg_gybfa,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 85.0, 375.0, 51.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(48.0, 0.0, 112.0, 20.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'GRAIN BOWLS',
                            style: TextStyle(
                              fontFamily: 'Avenir Next',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              letterSpacing: 0.46499999999999997,
                              fontWeight: FontWeight.w700,
                              height: 3.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(342.0, 7.0, 7.4, 12.0),
                          size: Size(375.0, 51.0),
                          pinRight: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'ic_chevron_right_24…' (shape)
                              SvgPicture.string(
                            _svg_mm0afy,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 51.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 136.0, 336.0, 61.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x99cee5c9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 154.0, 375.0, 51.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.SlideLeft,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => BrothBowls(),
                        ),
                      ],
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(46.0, 0.0, 116.0, 20.0),
                            size: Size(375.0, 51.0),
                            pinLeft: true,
                            pinTop: true,
                            fixedWidth: true,
                            fixedHeight: true,
                            child: Text(
                              'BROTH BOWLS',
                              style: TextStyle(
                                fontFamily: 'Avenir Next',
                                fontSize: 15,
                                color: const Color(0xff000000),
                                letterSpacing: 0.46499999999999997,
                                fontWeight: FontWeight.w700,
                                height: 3.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(342.0, 7.0, 7.4, 12.0),
                            size: Size(375.0, 51.0),
                            pinRight: true,
                            pinTop: true,
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'ic_chevron_right_24…' (shape)
                                SvgPicture.string(
                              _svg_mm0afy,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 51.0),
                            size: Size(375.0, 51.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(31.0, 205.0, 336.0, 61.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x80cee5c9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(20.0, 223.0, 375.0, 51.0),
                    size: Size(395.0, 343.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(25.0, 3.0, 154.0, 20.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'WARM RICE BOWLS',
                            style: TextStyle(
                              fontFamily: 'Avenir Next',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              letterSpacing: 0.46499999999999997,
                              fontWeight: FontWeight.w700,
                              height: 3.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(322.0, 7.0, 7.4, 12.0),
                          size: Size(375.0, 51.0),
                          pinRight: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'ic_chevron_right_24…' (shape)
                              SvgPicture.string(
                            _svg_mm0afy,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 51.0),
                          size: Size(375.0, 51.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-8.5, 741.5),
            child: SizedBox(
              width: 384.0,
              height: 111.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(4.5, 0.5, 376.0, 67.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 376.0, 67.0),
                          size: Size(376.0, 67.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 384.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_ekywa8,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(49.5, 9.5, 29.0, 33.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 2.0, color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(317.5, 9.5, 28.5, 29.0),
                    size: Size(384.0, 110.5),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'ic_face_24px' (shape)
                        SvgPicture.string(
                      _svg_u8nhh1,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(315.5, 47.5, 34.0, 13.0),
                    size: Size(384.0, 110.5),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Shree Devanagari 714',
                        fontSize: 10,
                        color: const Color(0xff000000),
                        letterSpacing: 0.95,
                        height: 4.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(55.0, 21.0, 18.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_au3ug0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(55.0, 16.0, 18.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_8i0ne2,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(55.0, 26.0, 18.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_p6z59o,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(55.0, 31.0, 18.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_rj2cbm,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(55.0, 36.0, 18.0, 1.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_t56etu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(47.5, 48.5, 34.0, 61.0),
                    size: Size(384.0, 110.5),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Menus\n',
                      style: TextStyle(
                        fontFamily: 'Shree Devanagari 714',
                        fontSize: 10,
                        color: const Color(0xff000000),
                        letterSpacing: 0.95,
                        height: 4.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(123.6, 8.2, 60.6, 54.4),
                    size: Size(384.0, 110.5),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(125.5, 46.5, 61.0, 14.0),
                    size: Size(384.0, 110.5),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(140.5, 49.5, 26.0, 61.0),
                    size: Size(384.0, 110.5),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Diets\n',
                      style: TextStyle(
                        fontFamily: 'Shree Devanagari 714',
                        fontSize: 10,
                        color: const Color(0xff000000),
                        letterSpacing: 0.95,
                        height: 4.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(227.5, 13.5, 26.1, 26.0),
                    size: Size(384.0, 110.5),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'ic_near_me_24px' (shape)
                        SvgPicture.string(
                      _svg_d0xbfu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(228.5, 47.5, 28.0, 13.0),
                    size: Size(384.0, 110.5),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Maps',
                      style: TextStyle(
                        fontFamily: 'Shree Devanagari 714',
                        fontSize: 10,
                        color: const Color(0xff000000),
                        letterSpacing: 0.95,
                        height: 4.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(43.0, 183.0),
            child: SizedBox(
              width: 289.0,
              height: 57.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 289.0, 39.0),
                    size: Size(289.0, 57.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xb4badbb3),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(264.0, 13.0, 12.2, 12.2),
                    size: Size(289.0, 57.0),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 9.0, 10.0),
                          size: Size(12.2, 12.2),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(8.1, 8.2, 4.0, 4.0),
                          size: Size(12.2, 12.2),
                          pinRight: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_pahtkf,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(248.0, 45.0, 32.0, 12.0),
                    size: Size(289.0, 57.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '+ filters',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 9,
                        color: const Color(0xb1000000),
                        letterSpacing: 0.279,
                        height: 3.7777777777777777,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(60.0, 195.0),
            child: Text(
              'Search CoreLife Menu',
              style: TextStyle(
                fontFamily: 'Avenir Next',
                fontSize: 10,
                color: const Color(0xff848484),
                letterSpacing: 0.3,
                height: 4,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.5, 403.5),
            child: SvgPicture.string(
              _svg_ridz3a,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(9.0, 9.0),
            child:
                // Adobe XD layer: 'ic_chevron_left_24px' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideRight,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Home(),
                ),
              ],
              child: SvgPicture.string(
                _svg_6pkesn,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_fpskey =
    '<svg viewBox="0.5 254.5 375.0 1.0" ><path transform="translate(0.5, 254.5)" d="M 0 1 L 375 0" fill="none" stroke="#dbd8d8" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mm0afy =
    '<svg viewBox="342.0 616.0 7.4 12.0" ><path transform="translate(333.41, 610.0)" d="M 10 6 L 8.590000152587891 7.409999847412109 L 13.17000007629395 12 L 8.590000152587891 16.59000015258789 L 10 18 L 16 12 L 10 6 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6j12w5 =
    '<svg viewBox="332.0 454.0 7.4 12.0" ><path transform="translate(323.41, 448.0)" d="M 10 6 L 8.590000152587891 7.409999847412109 L 13.17000007629395 12 L 8.590000152587891 16.59000015258789 L 10 18 L 16 12 L 10 6 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gybfa =
    '<svg viewBox="21.0 496.0 336.0 61.0" ><path transform="translate(21.0, 496.0)" d="M 0 0 L 336 0 L 336 61 L 0 61 L 0 0 Z" fill="#cee5c9" fill-opacity="0.85" stroke="none" stroke-width="1" stroke-opacity="0.85" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ekywa8 =
    '<svg viewBox="-5.5 744.5 384.0 1.0" ><path transform="translate(-5.5, 744.5)" d="M 0 1 L 384 0" fill="none" fill-opacity="0.25" stroke="#211f1f" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8nhh1 =
    '<svg viewBox="312.0 754.0 28.5 29.0" ><path transform="translate(310.0, 752.0)" d="M 11.95814514160156 16.13750076293945 C 10.9765567779541 16.13750076293945 10.17990493774414 16.94950103759766 10.17990493774414 17.95000076293945 C 10.17990493774414 18.95050048828125 10.9765567779541 19.76250076293945 11.95814514160156 19.76250076293945 C 12.93973350524902 19.76250076293945 13.73638534545898 18.95050048828125 13.73638534545898 17.95000076293945 C 13.73638534545898 16.94950103759766 12.93973350524902 16.13750076293945 11.95814514160156 16.13750076293945 Z M 20.49369812011719 16.13750076293945 C 19.51210975646973 16.13750076293945 18.71545791625977 16.94950103759766 18.71545791625977 17.95000076293945 C 18.71545791625977 18.95050048828125 19.51210975646973 19.76250076293945 20.49369812011719 19.76250076293945 C 21.47528648376465 19.76250076293945 22.27193832397461 18.95050048828125 22.27193832397461 17.95000076293945 C 22.27193832397461 16.94950103759766 21.47528648376465 16.13750076293945 20.49369812011719 16.13750076293945 Z M 16.22592163085938 2 C 8.373212814331055 2 2 8.496000289916992 2 16.50000190734863 C 2 24.50400161743164 8.373212814331055 31.00000190734863 16.22592163085938 31.00000190734863 C 24.0786304473877 31.00000190734863 30.45184326171875 24.50400161743164 30.45184326171875 16.50000190734863 C 30.45184326171875 8.496000289916992 24.0786304473877 2 16.22592163085938 2 Z M 16.22592163085938 28.10000038146973 C 9.952290534973145 28.10000038146973 4.845184326171875 22.89450073242188 4.845184326171875 16.50000190734863 C 4.845184326171875 16.07950019836426 4.873636245727539 15.65900039672852 4.916314125061035 15.25300216674805 C 8.27363109588623 13.73050117492676 10.93387985229492 10.93200016021729 12.32801914215088 7.466500759124756 C 14.90291023254395 11.17850112915039 19.14223670959473 13.60000038146973 23.93637084960938 13.60000038146973 C 25.04599380493164 13.60000038146973 26.11293792724609 13.46950054168701 27.13720321655273 13.22300052642822 C 27.43594741821289 14.25250053405762 27.60665893554688 15.35450172424316 27.60665893554688 16.50000190734863 C 27.60665893554688 22.89450073242188 22.49955368041992 28.10000038146973 16.22592163085938 28.10000038146973 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_au3ug0 =
    '<svg viewBox="49.5 765.5 18.0 1.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8i0ne2 =
    '<svg viewBox="49.5 760.5 18.0 1.0" ><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p6z59o =
    '<svg viewBox="49.5 770.5 18.0 1.0" ><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rj2cbm =
    '<svg viewBox="49.5 775.5 18.0 1.0" ><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t56etu =
    '<svg viewBox="49.5 780.5 18.0 1.0" ><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0xbfu =
    '<svg viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pahtkf =
    '<svg viewBox="7.7 8.2 4.0 4.0" ><path transform="translate(7.73, 8.18)" d="M 0 0 L 4.045744895935059 4.045744895935059" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ridz3a =
    '<svg viewBox="0.5 403.5 375.0 1.0" ><path transform="translate(0.5, 403.5)" d="M 0 1 L 375 0" fill="none" stroke="#dbd8d8" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6pkesn =
    '<svg viewBox="9.0 9.0 7.4 12.0" ><path transform="translate(1.0, 3.0)" d="M 15.40999984741211 7.409999847412109 L 14 6 L 8 12 L 14 18 L 15.40999984741211 16.59000015258789 L 10.82999992370605 12 L 15.40999984741211 7.409999847412109 Z" fill="#818181" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
