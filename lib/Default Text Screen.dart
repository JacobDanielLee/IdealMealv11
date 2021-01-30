import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/main.dart';
import 'package:idealmealv11/maps.dart';
import 'package:idealmealv11/base_widget.dart';

class TextScreen extends StatelessWidget {

  TextScreen({
    this.title,
    this.text,
  });

  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, sizingInformation)
    {
      return Scaffold(
        backgroundColor: const Color(0xffb4d4a5).withOpacity(1),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: const Text('IdealMeal',
            style: TextStyle(color: Colors.black),),
          backgroundColor: const Color(0xffffffff),
        ),
        body: Stack(children: [

          Transform.translate(offset: Offset(0.0, 55.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ),


          Transform.translate(offset: Offset(0.0, 100.0),
            child:
            Container(
              width: sizingInformation.screenSize.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 2.0),
                      child: Text(text, style: TextStyle(
                        fontSize: 15.0,
                        wordSpacing: 1.0,
                      )
                  ),
                )
            ),
          ),
        ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xffffffff),
          child: Container(
            width: 376.0,
            height: 70.0,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: const Color(0xff000000)),
              ),),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                        child: Container()),
                    Expanded(child: FlatButton(child: Container(
                      width: 29.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 2.0, color: const Color(0xff000000)),
                      ),
                      child: SvgPicture.string(
                        _svg_9xdj2t,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>
                            TextScreen(title: texts[0].title,
                                text: texts[0].text)));
                      },),
                      flex: 2,),
                    Expanded(child: Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 10,
                        color: const Color(0xff000000),
                        letterSpacing: 0.31,
                        height: 1.3,
                      ),
                    ), flex: 1,)
                  ],),
                  Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                            child: Container()),
                        Expanded(child: FlatButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                        },
                          child: Container(
                            width: 45.0,
                            height: 45.0,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                  'assets/images/IdealMealLogo.png'),),
                          ),),
                          flex: 2,),
                        Expanded(child: Container(
                          height: 15.0,
                          child: Text(
                            'Menus',
                            style: TextStyle(
                              fontFamily: 'Avenir Next',
                              fontSize: 10,
                              color: const Color(0xff000000),
                            ),
                          ),), flex: 1,),
                      ]),
                  Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                        child: Container()),
                    Expanded(child: Container(
                      child: FlatButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Maps()));
                      },
                        child: SvgPicture.string(
                          _svg_d0xbfu,
                        ),
                      ),
                    ),
                      flex: 2,),
                    Expanded(child: SizedBox(
                      width: 30.0,
                      child: Text(
                        'Maps',
                        style: TextStyle(
                          fontFamily: 'Avenir Next',
                          fontSize: 10,
                          color: const Color(0xff000000),
                          letterSpacing: 0.31,
                          height: 1.0,
                        ),
                      ),
                    ), flex: 1,),
                  ],),
                ]
            ),
          ),
        ),
      );
    }
    );
  }

  String _svg_9xdj2t =
      '<svg viewBox="49.5 760.5 18.0 20.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_d0xbfu =
      '<svg viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

}
