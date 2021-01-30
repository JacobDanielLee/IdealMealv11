import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/main.dart';
import 'package:idealmealv11/maps.dart';
import 'package:idealmealv11/menuSection.dart';
import './Homepage5.dart';
import 'package:idealmealv11/MenuSearch.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:idealmealv11/DataSearch.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:idealmealv11/Strings.dart';
import 'package:idealmealv11/Default Text Screen.dart';
import 'package:idealmealv11/base_widget.dart';

class CoreLifeMenu1 extends StatelessWidget {
  CoreLifeMenu1({
    Key key,
  }) : super(key: key);

  String websiteBit;
  String sampleBit;
  dynamic image;

  @override
  Widget build(BuildContext context) {
    if (restaurantSearch[clickedIndex].website.length > 20) {
      websiteBit =
          restaurantSearch[clickedIndex].website.substring(0, 20) + '...';
    } else {
      websiteBit = restaurantSearch[clickedIndex].website;
    }

    if (restaurantSearch[clickedIndex].validLink) {
      image = true;
    } else {
      image = false;
    }
    return BaseWidget(
        builder: (context, sizingInformation) {
          return Scaffold(
            backgroundColor: const Color(0xffffffff),
            appBar: AppBar(
              leading:
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontFamily: 'Avenir Next',
                    fontSize: 15,
                    color: Color(0xff848484),

                  ),
                ),
              ),
              backgroundColor: const Color(0xffffffff),
              actions: <Widget>[
                Stack(children: [
                  Transform.translate(offset: Offset(0.0, 0.0), child:
                  Container(
                    width: sizingInformation.screenSize.width,
                    height: 70,
                    child: Container(
                      width: 331,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff).withOpacity(0.51),
                      ),
                      child:
                      IconButton(
                          alignment: Alignment.centerRight,
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          onPressed: () {
                            showSearch(context: context,
                                delegate: MenuSearch(index: clickedIndex));
                          }),
                    ),
                  )
                  )
                ],),
              ],
            ),
            body:
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                    children: <Widget>[
                      if (image)
                        Transform.translate(offset: Offset(sizingInformation.screenSize.width/2 - 150, 31.0),
                          child: Container(
                            width: 300.0,
                            height: 97.0,
                            child:
                            Container(
                              child: Image.network(
                                  restaurantSearch[clickedIndex].imageUrl),
                            ),
                          ),),
                      if (!image)
                        Transform.translate(offset: Offset(40.0, 31.0),
                          child: Container(
                            width: 300.0,
                            height: 97.0,
                            child:
                            FittedBox(
                              alignment: Alignment.center,
                              fit: BoxFit.fitWidth,
                              child: Text(
                                  restaurantSearch[clickedIndex].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),),
                      Transform.translate(
                        offset: Offset(0.0, 2.0),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Transform.translate(
                                  offset: Offset(2.0, 15.0),
                                  child:
                                  IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
                Transform.translate(
                  offset: Offset(10.0, 120.0),
                  child: SizedBox(
                    width: 52.0,
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
                    ),
                  ),
                ),
                new Container(
                  height: 60.0,
                  padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(48, 0),
                              child: Container(
                                height: 20,
                                padding: EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: FlatButton(child: SizedBox(
                                  width: 90,
                                  child: Text(
                                    restaurantSearch[clickedIndex].phoneNumber,
                                    style: TextStyle(
                                      fontFamily: 'Avenir Next',
                                      fontSize: 11,
                                      color: const Color(0xff000000),
                                      letterSpacing: 0.34099999999999997,
                                      height: 1.818181818181818,
                                    ),
                                  ),
                                ), onPressed: () {
                                  String substitute = NumberParser.numberParser(
                                      restaurantSearch[clickedIndex]
                                          .phoneNumber);
                                  String total = "tel:+" +
                                      substitute.toString();
                                  print(total);
                                  UrlLauncher.launch(total);
                                },),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(40, -10),
                              child: SizedBox(
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                    fontFamily: 'Avenir Next',
                                    fontSize: 26,
                                    color: const Color(0xff000000),
                                    letterSpacing: 0.806,
                                    height: 1.9230769230769231,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(30, 0),
                              child: Container(
                                  height: 20,
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0),
                                  child: FlatButton(onPressed: () {
                                    if (restaurantSearch[clickedIndex].website.substring(0,4)
                                         == "http") {
                                      UrlLauncher.launch(
                                          restaurantSearch[clickedIndex]
                                              .website);
                                    } else {
                                      String substitute = 'http://' +
                                          restaurantSearch[clickedIndex]
                                              .website;
                                      UrlLauncher.launch(substitute);
                                    }
                                  },
                                    child: SizedBox(
                                      child: Text(websiteBit,
                                        style: TextStyle(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 11,
                                          color: const Color(0xff000000),
                                          letterSpacing: 0.34099999999999997,
                                          height: 1.818181818181818,
                                        ),
                                      ),
                                    ),)
                              ),
                            ),

                          ])
                  ),
                ),
                Transform.translate(offset: Offset(0.0, -10.0),
                  child:
                  Container(
                      height: 20,
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: FlatButton(onPressed: () {
                        print('press3');
                        MapsLauncher.launchQuery(
                            restaurantSearch[clickedIndex].address);
                      }, child:
                      SizedBox(child:
                      Text(
                        restaurantSearch[clickedIndex].address,
                        style: TextStyle(
                          fontFamily: 'Avenir Next',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.34099999999999997,
                          height: 1.818181818181818,
                        ),
                      ),
                        width: 250.0,
                      ))
                  ),
                ),

                new Container(
                  height: 150.0,
                  padding: EdgeInsets.fromLTRB(0.0, 50, 0, 0),
                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(
                          children: <Widget>[
                            Column(children: <Widget>[
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: IconButton(icon: Image.asset(
                                      'assets/images/logos with text/veganLogoText.png'),
                                    onPressed: () {
                                      dietName = 'Vegan';
                                      menuSection.listLoader(context);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => menuSection()));
                                    },)),
                              Text(restaurantSearch[clickedIndex].vegan
                                  .toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.403,
                                  height: .6923076923076925,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                            ),
                            Column(children: <Widget>[
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child:
                                  IconButton(icon: Image.asset(
                                      'assets/images/logos with text/vegetarianLogoText.png'),
                                    onPressed: () {
                                      dietName = 'Vegetarian';
                                      menuSection.listLoader(context);
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) => menuSection()));
                                    },
                                  )
                              ),
                              Text(
                                restaurantSearch[clickedIndex].vegetarian
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.403,
                                  height: .6923076923076925,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            Column(children: <Widget>[
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: IconButton(icon: Image.asset(
                                      'assets/images/logos with text/pescatarianLogoText.png'),
                                    onPressed: () {
                                      dietName = 'Pescatarian';
                                      menuSection.listLoader(context);
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) => menuSection()));
                                    },
                                  )
                              ),
                              Text(
                                restaurantSearch[clickedIndex].pescaterian
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.403,
                                  height: .6923076923076925,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            Column(children: <Widget>[
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: IconButton(icon: Image.asset(
                                      'assets/images/logos with text/lowCarbLogoText.png'),
                                    onPressed: () {
                                      dietName = 'Low Carb';
                                      menuSection.listLoader(context);
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) => menuSection()));
                                    },
                                  )
                              ),
                              Text(
                                restaurantSearch[clickedIndex].lowCarb
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.403,
                                  height: .6923076923076925,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            Column(children: <Widget>[
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: IconButton(icon: Image.asset(
                                      'assets/images/logos with text/ketoLogoText.png'),
                                    onPressed: () {
                                      dietName = 'Keto';
                                      menuSection.listLoader(context);
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) => menuSection()));
                                    },
                                  )
                              ),
                              Text(
                                restaurantSearch[clickedIndex].keto.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir Next',
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.403,
                                  height: .6923076923076925,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ])
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 100.0),
                  child:
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 6,
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: restaurantSearch[clickedIndex].categoryList
                            .length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          String tileName;
                          if (restaurantSearch[clickedIndex].categoryList[index]
                              .name.length > 30) {
                            tileName = restaurantSearch[clickedIndex]
                                .categoryList[index].name.substring(0, 30) +
                                '...';
                          } else {
                            tileName = restaurantSearch[clickedIndex]
                                .categoryList[index].name;
                          }
                          return
                            Card(
                              margin: EdgeInsets.fromLTRB(10,0,10,0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffcee5c9).withOpacity(0.85)
                                ),
                                child: ListTile(
                                    title: Text(tileName ?? 'Menu',
                                        style: TextStyle(
                                            fontFamily: 'Avenir Next',
                                            fontWeight: FontWeight.bold)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) =>
                                              menuSection(index1: index)));
                                    }),
                              )
                            );
                        }),
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
                                context, MaterialPageRoute(
                                builder: (context) => Maps()));
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
        });
  }
}

class NumberParser {

  static String numberParser(String input) {
    List integers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    dynamic outputString = '';
    for (int i = 0; i < input.length; i++) {
      if (integers.contains(input[i])) {
        outputString = outputString + input[i];
      }
    }
    return outputString;
  }
}

const String _svg_nuvas8 =
    '<svg viewBox="0.5 330.5 375.0 1.0" ><path transform="translate(0.5, 330.5)" d="M 0 1 L 375 0" fill="none" stroke="#dbd8d8" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8nhh1 =
    '<svg viewBox="312.0 754.0 28.5 29.0" ><path transform="translate(310.0, 752.0)" d="M 11.95814514160156 16.13750076293945 C 10.9765567779541 16.13750076293945 10.17990493774414 16.94950103759766 10.17990493774414 17.95000076293945 C 10.17990493774414 18.95050048828125 10.9765567779541 19.76250076293945 11.95814514160156 19.76250076293945 C 12.93973350524902 19.76250076293945 13.73638534545898 18.95050048828125 13.73638534545898 17.95000076293945 C 13.73638534545898 16.94950103759766 12.93973350524902 16.13750076293945 11.95814514160156 16.13750076293945 Z M 20.49369812011719 16.13750076293945 C 19.51210975646973 16.13750076293945 18.71545791625977 16.94950103759766 18.71545791625977 17.95000076293945 C 18.71545791625977 18.95050048828125 19.51210975646973 19.76250076293945 20.49369812011719 19.76250076293945 C 21.47528648376465 19.76250076293945 22.27193832397461 18.95050048828125 22.27193832397461 17.95000076293945 C 22.27193832397461 16.94950103759766 21.47528648376465 16.13750076293945 20.49369812011719 16.13750076293945 Z M 16.22592163085938 2 C 8.373212814331055 2 2 8.496000289916992 2 16.50000190734863 C 2 24.50400161743164 8.373212814331055 31.00000190734863 16.22592163085938 31.00000190734863 C 24.0786304473877 31.00000190734863 30.45184326171875 24.50400161743164 30.45184326171875 16.50000190734863 C 30.45184326171875 8.496000289916992 24.0786304473877 2 16.22592163085938 2 Z M 16.22592163085938 28.10000038146973 C 9.952290534973145 28.10000038146973 4.845184326171875 22.89450073242188 4.845184326171875 16.50000190734863 C 4.845184326171875 16.07950019836426 4.873636245727539 15.65900039672852 4.916314125061035 15.25300216674805 C 8.27363109588623 13.73050117492676 10.93387985229492 10.93200016021729 12.32801914215088 7.466500759124756 C 14.90291023254395 11.17850112915039 19.14223670959473 13.60000038146973 23.93637084960938 13.60000038146973 C 25.04599380493164 13.60000038146973 26.11293792724609 13.46950054168701 27.13720321655273 13.22300052642822 C 27.43594741821289 14.25250053405762 27.60665893554688 15.35450172424316 27.60665893554688 16.50000190734863 C 27.60665893554688 22.89450073242188 22.49955368041992 28.10000038146973 16.22592163085938 28.10000038146973 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9xdj2t =
    '<svg viewBox="49.5 760.5 18.0 20.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0xbfu =
    '<svg viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
