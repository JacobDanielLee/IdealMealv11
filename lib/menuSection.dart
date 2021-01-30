import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/main.dart';
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/base_widget.dart';
import 'package:idealmealv11/maps.dart';
import 'package:idealmealv11/Default Text Screen.dart';
import 'package:idealmealv11/Strings.dart';

class menuSection extends StatelessWidget {
  menuSection({
    this.index1,
    Key key,

  }) : super(key: key);

  static List<Dishes> dietList = [];
  final int index1;


  static List<Dishes> listLoader(BuildContext context) {
    dietList = [];
    for (int i = 0; i < restaurantSearch[clickedIndex].categoryList.length; i++) {
      for (int j = 0; j < restaurantSearch[clickedIndex].categoryList[i].dishes.length; j++) {
        if (dietName == "Vegan") {
          if (restaurantSearch[clickedIndex].categoryList[i].dishes[j].vegan) {
            dietList.add(restaurantSearch[clickedIndex].categoryList[i].dishes[j]);
          }
        } else if (dietName == "Vegetarian") {
          if (restaurantSearch[clickedIndex].categoryList[i].dishes[j].vegetarian) {
            dietList.add(
                restaurantSearch[clickedIndex].categoryList[i].dishes[j]);
          }
        } else if (dietName == "Pescatarian") {
          if (restaurantSearch[clickedIndex].categoryList[i].dishes[j]
              .pescaterian) {
            dietList.add(
                restaurantSearch[clickedIndex].categoryList[i].dishes[j]);
          }
        } else if (dietName == "Low Carb") {
          if (restaurantSearch[clickedIndex].categoryList[i].dishes[j]
              .lowCarb) {
            dietList.add(
                restaurantSearch[clickedIndex].categoryList[i].dishes[j]);
          }
        } else if (dietName == "Keto") {
          if (restaurantSearch[clickedIndex].categoryList[i].dishes[j].keto) {
            dietList.add(
                restaurantSearch[clickedIndex].categoryList[i].dishes[j]);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (context, sizingInformation) {
          return Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: Stack(
              children: <Widget>[
                Stack(children: <Widget>[
                  SvgPicture.string(
                    _svg_svq73u,
                    allowDrawingOutsideViewBox: true,
                  ),
                  Transform.translate(
                    offset: Offset(sizingInformation.screenSize.width/2 - 153.5, 25.0),
                    child: Container(
                      width: 320.0,
                      height: 102.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: const Color(
                            0xffbadbb3)),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(sizingInformation.screenSize.width/2 - 141.5, 36.0),
                    child: Container(
                      width: 320.0,
                      height: 102.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: const Color(
                            0xffbadbb3)),
                      ),
                    ),
                  ),
                ]),

                if (index1 == null)
                  Transform.translate(
                    offset: Offset(sizingInformation.screenSize.width/2 - 135.5, 41.0),
                    child:
                    Container(
                      width: 295.0,
                      height: 86.0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          dietName,
                          style: TextStyle(
                            fontFamily: 'Avenir Next',
                            fontSize: 35,
                            color: const Color(0xff000000),
                            letterSpacing: 1.085,
                            fontWeight: FontWeight.w700,
                            height: 1.3714285714285714,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                if (index1 != null)
                  Transform.translate(
                    offset: Offset(52.0, 41.0),
                    child: SizedBox(
                      width: 295.0,
                      height: 86.0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          restaurantSearch[clickedIndex].categoryList[index1]
                              .name ?? 'Menu',
                          style: TextStyle(
                            fontFamily: 'Avenir Next',
                            fontSize: 35,
                            color: const Color(0xff000000),
                            letterSpacing: 1.085,
                            fontWeight: FontWeight.w700,
                            height: 1.3714285714285714,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),


                if (index1 != null)
                  Transform.translate(offset: Offset(0.0, 151.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                        child: ListView.builder(
                            itemCount: restaurantSearch[clickedIndex].categoryList[index1].dishes.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              var nameBit;
                              if (restaurantSearch[clickedIndex].categoryList[index1].dishes[index].dish.length > 30) {
                                nameBit = restaurantSearch[clickedIndex].categoryList[index1].dishes[index].dish.substring(0, 30);
                              } else {
                                nameBit = restaurantSearch[clickedIndex].categoryList[index1].dishes[index].dish;
                              }
                              return Padding(padding: const EdgeInsets.fromLTRB(
                                  0, 0, 0, 10),
                                  child: Container(width: 375, height: 198,
                                    color: const Color(0xffffffff),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(top: BorderSide(
                                              width: 1.0, color: Colors.grey))
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Transform.translate(
                                            offset: Offset(24.0, 20.0),
                                            child: Text(nameBit != null
                                                ? nameBit
                                                : 'Menu Item',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Avenir Next',
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff000000),
                                              ),
                                            ),),
                                          Transform.translate(
                                              offset: Offset(24.0, 79.0),
                                              child: Container(
                                                width: 190, height: 74, child:
                                              Text(
                                                restaurantSearch[clickedIndex]
                                                    .categoryList[index1]
                                                    .dishes[index]
                                                    .dishdescription
                                                    != null
                                                    ? restaurantSearch[clickedIndex]
                                                    .categoryList[index1]
                                                    .dishes[index]
                                                    .dishdescription
                                                    : '',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir Next',
                                                  fontSize: 14,
                                                  color: Color(0xff000000),
                                                ),
                                              ),)
                                          ),
                                          if (restaurantSearch[clickedIndex]
                                              .categoryList[index1]
                                              .dishes[index].calories != 'null')
                                            Transform.translate(
                                                offset: Offset(24.0, 50.0),
                                                child: Container(
                                                  width: 201, height: 43, child:
                                                Text(
                                                  restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index].calories +
                                                      ' Calories',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 10,
                                                    color: Color(0xff000000),),
                                                ),)
                                            ),
                                          if (restaurantSearch[clickedIndex]
                                              .categoryList[index1]
                                              .dishes[index].price != 'null')
                                            Transform.translate(
                                                offset: Offset(24.0, 67.0),
                                                child: Container(
                                                  width: 201, height: 43, child:
                                                Text('Price: ' +
                                                    restaurantSearch[clickedIndex]
                                                        .categoryList[index1]
                                                        .dishes[index].price,
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir Next',
                                                    fontSize: 10,
                                                    color: Color(0xff000000),),
                                                ),)
                                            ),
                                          Align(alignment: Alignment.topRight,
                                            child: Transform.translate(
                                                offset: Offset(250.0, 56.0),
                                                child: Row(children: <Widget>[
                                                  if (restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index].vegan)
                                                    Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/VeganLogo.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  if (restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index].vegetarian)
                                                    Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/VegetarianLogo.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  if (restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index]
                                                      .pescaterian)
                                                    Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/PescaterianLogo.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  if (restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index].lowCarb)
                                                    Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/LowCarbLogo.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  if (restaurantSearch[clickedIndex]
                                                      .categoryList[index1]
                                                      .dishes[index].keto)
                                                    Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/KetoLogo.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                ],)),
                                          )
                                        ],
                                      ),
                                    ), //thumbnail,
                                  )
                              );
                            }),
                      )
                  ),


                if (index1 == null)
                  Transform.translate(offset: Offset(0.0, 151.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                        child: ListView.builder(
                            itemCount: dietList.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              var nameBit;
                              double heightV;
                              if (dietList[index].dish.length > 30) {
                                nameBit = dietList[index].dish.substring(0, 30);
                              } else {
                                nameBit = dietList[index].dish;
                              }
                              if (dietList[index].dishdescription != null && dietList[index].dishdescription.length > 30) {
                                heightV = 170;
                              } else {
                                heightV = 100;
                              }
                              try {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 0, 0, 10),
                                  child: Container(width: 375, height: heightV,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          border: Border(top: BorderSide(
                                              width: 1.0, color: Colors.grey))
                                      ),
                                      child: Stack(
                                          children: <Widget>[
                                            Transform.translate(
                                              offset: Offset(24.0, 20.0),
                                              child: Text(nameBit != null
                                                  ? nameBit
                                                  : 'Menu Item',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Avenir Next',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000),
                                                ),
                                              ),),
                                            if (dietList[index].dishdescription != null)
                                              Transform.translate(
                                                offset: Offset(24.0, 79.0),
                                                child: Container(
                                                  width: 190, height: 74,
                                                  child:
                                                  Text(dietList[index].dishdescription,
                                                    style: TextStyle(
                                                      fontFamily: 'Avenir Next',
                                                      fontSize: 14,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),)
                                            ),
                                            if (dietList[index].calories !=
                                                'null')
                                              Transform.translate(
                                                  offset: Offset(24.0, 50.0),
                                                  child: Container(
                                                    width: 201,
                                                    height: 43,
                                                    child:
                                                    Text(
                                                      dietList[index].calories +
                                                          ' Calories',
                                                      style: TextStyle(
                                                        fontFamily: 'Avenir Next',
                                                        fontSize: 10,
                                                        color: Color(
                                                            0xff000000),),
                                                    ),)
                                              ),
                                            if (dietList[index].price != 'null')
                                              Transform.translate(
                                                  offset: Offset(24.0, 67.0),
                                                  child: Container(
                                                    width: 201,
                                                    height: 43,
                                                    child:
                                                    Text('Price: ' +
                                                        dietList[index].price,
                                                      style: TextStyle(
                                                        fontFamily: 'Avenir Next',
                                                        fontSize: 10,
                                                        color: Color(
                                                            0xff000000),),
                                                    ),)
                                              ),
                                            Align(alignment: Alignment.topRight,
                                              child: Transform.translate(
                                                  offset: Offset(250.0, 56.0),
                                                  child: Row(children: <Widget>[
                                                    if (dietList[index].vegan)
                                                      Container(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/VeganLogo.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    if (dietList[index]
                                                        .vegetarian)
                                                      Container(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/VegetarianLogo.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    if (dietList[index]
                                                        .pescaterian)
                                                      Container(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/PescaterianLogo.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    if (dietList[index].lowCarb)
                                                      Container(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/LowCarbLogo.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    if (dietList[index].keto)
                                                      Container(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/KetoLogo.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                  ],)),
                                            )
                                          ],
                                        ),) //thumbnail,
                                );
                              } catch (e) {
                                print(e);
                                return null;
                              }
                            }),
                      )
                  ),


                Column(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0.0, 30.0),
                      child:
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },),
                    ),
                  ],)
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

const String _svg_svq73u =
    '<svg viewBox="0.0 0.0 375.0 152.0" ><path  d="M 0 0 L 375 0 L 375 152 L 0 152 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9xdj2t =
    '<svg viewBox="49.5 760.5 18.0 20.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0xbfu =
    '<svg viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
