import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idealmealv11/DataSearch.dart';
import 'package:idealmealv11/DefaultMenu.dart';
import 'package:idealmealv11/base_widget.dart';
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/dishes_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/category.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:http/http.dart' as http;
import 'package:idealmealv11/maps.dart';
import 'package:idealmealv11/Default Text Screen.dart';
import 'package:idealmealv11/ProfilePage.dart';
import 'package:idealmealv11/splashScreen.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:idealmealv11/Strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';


//List of global Strings that will be called throughout application depending on button or context
List<StringsList> texts = [
  StringsList(title: 'IdealMeal', text: 'Hello and welcome to Ideal Meal’s first app! A little bit of background about us; we’re a group of UIUC college students looking to help connect health conscious diners to restaurants in Champaign-Urbana. '
      'Our first app has almost all of Champaign-Urbana’s restaurants and menu items sorted by five diets; Pollotarian, Pescatarian, Vegetarian, Vegan, and Whole Foods Plant Based. If your favorite restaurant or menu item is missing or you spot a mistake, let us know and we’ll fix it as soon as possible.'
      ),
  StringsList(title: 'Vegetarian', text: 'We use the lacto-ovo vegetarian definition which is a diet the excludes any type of meat but includes dairy products, eggs, fruits, vegetables, and other non-meat products. Be sure to classify your dishes accordingly.'),
  StringsList(title: 'Vegan', text: 'The Vegan diet we use excludes all animal products. As well as absolutely no meat, this means no dairy, no eggs, no honey, no gelatin, and nothing that comes from an animal in any way.'),
  StringsList(title: 'Pescaterian', text: 'The Pescatarian diet excludes all meat other than fish and seafood.'),
  StringsList(title: 'Pollotarian', text: 'The Pollotarian diet excludes all meat other than poultry.'),
  StringsList(title: 'Whole Foods Plant Based', text: 'Our Whole Foods Plant Based definition excludes all heavily processed foods and includes only food that comes from plants. This means no animal products and only whole, unrefined, or minimally refined ingredients.'),
  StringsList(title: 'COMING SOON', text: ''),

];

//Storage of recent searches (Not Used)
var recentSearches = <String>[];
//Essential to keeping a current register storage of all restaurant information
var restaurantSearch = [];
//Index that tracks which restaurant was clicked on homepage. Used to deliver context.
int clickedIndex;
//Diet string index that identifies which diet was chosen on menu page
String dietName = '';
//Variable used to track whether app is launched for the first time by used. Should prompt initial login screen.
int firstTime = 0;
//Variable used to store user's information and bypass login screen
bool rememberMe = false;
var profile;


void main() {

  //DishService and its respective functions are called to load applicable JSON information (see dishes_service.dart)
  Dish_Service.getDishes().then((dishes) {
    Dish_Service.getRestaurants().then((restaurants) {

      //For every item in the restaurants list a count of each diet type is started in
      //addition to a list of categories, which each have a respective list of dishes.
      //For example, a list of categories may include tacos, burritos, tortas, etc.
      //Within each category list there are dishes such as steak tacos, pollo tacos, etc.
      for (int i = 0; i < restaurants.length; i++) {
        int Vegancount = 0;
        int Vegetariancount = 0;
        int Plantcount = 0;
        int Pescateriancount = 0;
        int Polloteriancount = 0;
        int ketoCount = 0;
        int lowCarbcount = 0;
        var listAdd = <Category>[];
        var listAddCategory = <Dishes>[];
        for (int j = 0; j < dishes.length; j++) {
          //Checks to see whether dish in the list belongs to restaurant
          if (restaurants[i].name == dishes[j].restaurant) {
            //Adds counts to total tally if diet type is true
            if (dishes[j].vegan == true) {
              Vegancount++;
            }
            if (dishes[j].vegetarian == true) {
              Vegetariancount++;
            }
            if (dishes[j].plantbased == true) {
              Plantcount++;
            }
            if (dishes[j].pescaterian == true) {
              Pescateriancount++;
            }
            if (dishes[j].polloterian == true) {
              Polloteriancount++;
            }
            if (dishes[j].keto == true) {
              ketoCount++;
            }
            if (dishes[j].lowCarb == true) {
              lowCarbcount++;
            }


            if (listAddCategory.isNotEmpty) {
              if (!listAddCategory.contains(dishes[j]) && dishes[j].menusection == listAddCategory[0].menusection) {
                listAddCategory.add(dishes[j]);
              }
            } else {
              listAddCategory.add(dishes[j]);
            }

            if (listAddCategory[0].menusection != dishes[j].menusection) {
              listAdd.add(Category(
                name: listAddCategory[0].menusection,
                dishes: listAddCategory,
              ));
              listAddCategory = [];
            }
          }
        }
        restaurants[i].vegan = Vegancount;
        restaurants[i].vegetarian = Vegetariancount;
        restaurants[i].plantbased = Plantcount;
        restaurants[i].pescaterian = Pescateriancount;
        restaurants[i].polloterian = Polloteriancount;
        restaurants[i].keto = ketoCount;
        restaurants[i].lowCarb = lowCarbcount;
        restaurants[i].categoryList = listAdd;


      }

      for (int i = 0; i < restaurants.length; i++) {
        restaurantSearch.add(restaurants[i]);
      }


      //Tests image links
      restaurantSearch.forEach((i) {
        if(i.imageUrl != null) {
          MyApp.imageValidator(i.imageUrl).then((value) {
            var urlTest;
            urlTest = value;
            i.validLink = urlTest;
          }
          ).catchError((e) {
            print('something went wrong');
            var urlTest;
            urlTest = false;
            i.validLink = urlTest;
          });
        } else {
          i.validLink = false;
        }

      });

      //Testing outputs
      print(restaurants[1].categoryList[1].dishes[1].vegan);
      print(restaurantSearch[10].validLink);
      //Runs the App
      runApp(MyApp());
    });
  });

}

//Class that runs the app
class MyApp extends StatelessWidget {

//Function used to validate whether the image link respective to restaurant is valid for use. Returns true or false.
  static Future<bool> imageValidator(String url) async {
     final response = await http.get(url);
     if (200 == response.statusCode) {
       var test = Image.network(url);
       WidgetTester tester;
       provideMockedNetworkImages(() async {await tester.pumpWidget(
           MaterialApp(
             home: Image.network(url),
           ));});
       return true;
     } else {
       print('something went wrong');
       return false;
     }
  }
  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            leading: Container(
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
            actions: <Widget>[

              Stack(children: [
                Container(
                  width: sizingInformation.screenSize.width,
                  height: 70,
                  child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.search),
                      color: Colors.black,
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      }),
                )
              ],),

            ],

          ),
          body:
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //Buildings and Logo
                  Transform.translate(
                    offset: Offset(10.0, 5.0),
                    child: Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(-10.0, -10.0),
                          child: Container(
                            width: 438.0,
                            height: 305.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage('assets/images/logos with text/IdealMealLogoText.png'),
                              ),),
                          ),
                        ),
                        // Adobe XD layer: 'green cloud' (shape)
                        Transform.translate(offset: Offset(-68.0, -39.0),
                            child: Container(
                              width: 136,
                              height: 79.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(59.0),
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/cloud1.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.4), BlendMode.dstIn),
                                ),
                              ),
                            )
                        ),
                        // Adobe XD layer: 'green cloud' (shape)
                        Transform.translate(offset: Offset(28.0, 45.0),
                            child: Container(
                              width: 136.0,
                              height: 79.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(59.0),
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/cloud1.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.4), BlendMode.dstIn),
                                ),
                              ),
                            )
                        ),
                        // Adobe XD layer: 'green cloud' (shape)
                        Transform.translate(offset: Offset(188.0, -27.0),
                            child: Container(
                              width: 136.0,
                              height: 79.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(59.0),
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/cloud1.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.4), BlendMode.dstIn),
                                ),
                              ),
                            )
                        ),
                        // Adobe XD layer: 'green cloud' (shape)
                        Transform.translate(offset: Offset(295.0, 55.0),
                            child: Container(
                              width: 136.0,
                              height: 79.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(59.0),
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/cloud1.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.4), BlendMode.dstIn),
                                ),
                              ),
                            )
                        ),
                        //Building 1
                        Transform.translate(
                          offset: Offset(-10.0, 284.66),
                          child: Container(
                            width: 96.9,
                            height: 153.6,
                            color: const Color(0xb29dcc93),
                          ),
                        ),
                        //Building 2
                        Transform.translate(
                          offset: Offset(87.41, 229.91),
                          child: Container(
                            width: 87.6,
                            height: 207.8,
                            color: const Color(0x739dcc93),
                          ),
                        ),
                        //Building 3
                        Transform.translate(
                          offset: Offset(174.97, 260.77),
                          child: Container(
                            width: 108.0,
                            height: 176.9,
                            color: const Color(0xb29dcc93),
                          ),
                        ),
                        //Building 4
                        Transform.translate(
                          offset: Offset(282.83, 302.84),
                          child: Container(
                            width: 63.6,
                            height: 134.9,
                            color: const Color(0xff9dcc93),
                          ),
                        ),
                        //Building 5
                        Transform.translate(
                          offset: Offset(346.39, 267.18),
                          child: Container(
                            width: 56.5,
                            height: 170.4,
                            color: const Color(0xbf9dcc93),
                          ),
                        ),

                        //Windows of 1st building
                        Transform.translate(
                          offset: Offset(10.57, 297.54),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 297.54),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 297.9),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 297.54),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 312.72),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 312.72),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 312.72),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 312.72),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 327.55),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 327.55),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 327.55),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 327.91),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 342.38),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 342.38),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 342.38),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 342.38),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 355.8),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 355.8),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 356.15),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 355.8),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 370.98),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 370.98),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 370.98),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 370.98),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 385.81),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 385.81),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 385.81),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 386.16),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(10.57, 400.64),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(27.51, 400.64),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(44.46, 400.64),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(60.35, 400.64),
                          child: Container(
                            width: 10.9,
                            height: 10.9,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 242.82),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 242.82),
                          child: SvgPicture.string(
                            _svg_k0xxu0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 242.82),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 242.82),
                          child: SvgPicture.string(
                            _svg_bi34fn,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(149.91, 242.82),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(149.91, 242.82),
                          child: SvgPicture.string(
                            _svg_6apqzh,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(183.09, 272.12),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(216.28, 272.12),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(248.76, 271.06),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          //Area for diet scroll
                          offset: Offset(152.6, 109.23),
                          child: Text(''),
                        ),
                        Transform.translate(
                          offset: Offset(184.5, 273.5),
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
                          offset: Offset(185.57, 274.06),
                          child: SvgPicture.string(
                            _svg_5ej1ht,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(218.4, 274.21),
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
                          offset: Offset(218.93, 274.21),
                          child: SvgPicture.string(
                            _svg_u7u51r,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(250.89, 273.15),
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
                          offset: Offset(251.42, 273.15),
                          child: SvgPicture.string(
                            _svg_763qbg,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(183.51, 302.98),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(216.7, 302.98),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(249.18, 301.92),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(185.46, 304.92),
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
                          offset: Offset(185.99, 304.92),
                          child: SvgPicture.string(
                            _svg_trayzy,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(218.82, 305.07),
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
                          offset: Offset(219.35, 305.06),
                          child: SvgPicture.string(
                            _svg_h2628k,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(251.31, 304.01),
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
                          offset: Offset(251.84, 304.01),
                          child: SvgPicture.string(
                            _svg_d1ok29,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(183.16, 333.7),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(216.35, 333.7),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(248.83, 332.64),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(185.1, 335.64),
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
                          offset: Offset(185.63, 335.64),
                          child: SvgPicture.string(
                            _svg_n6dqlq,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(218.47, 335.78),
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
                          offset: Offset(219.0, 335.78),
                          child: SvgPicture.string(
                            _svg_fgvmc0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(250.95, 334.72),
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
                          offset: Offset(251.48, 334.72),
                          child: SvgPicture.string(
                            _svg_4ntxmg,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(183.16, 365.83),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(216.35, 365.83),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(248.83, 364.77),
                          child: Container(
                            width: 25.4,
                            height: 25.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(185.1, 367.77),
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
                          offset: Offset(185.63, 367.77),
                          child: SvgPicture.string(
                            _svg_7d6h5u,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(218.47, 367.91),
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
                          offset: Offset(219.0, 367.91),
                          child: SvgPicture.string(
                            _svg_rh0ol,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(250.95, 366.85),
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
                          offset: Offset(251.48, 366.85),
                          child: SvgPicture.string(
                            _svg_hkqrck,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.01, 318.13),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.01, 310.25),
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
                          offset: Offset(307.72, 317.7),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(307.72, 309.9),
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
                          offset: Offset(326.08, 317.7),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(326.08, 309.82),
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
                          offset: Offset(288.48, 309.02),
                          child: SvgPicture.string(
                            _svg_xip6qt,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.22, 345.59),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.22, 337.71),
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
                          offset: Offset(307.93, 345.16),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(307.93, 337.36),
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
                          offset: Offset(326.29, 345.16),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(326.29, 337.28),
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
                          offset: Offset(288.69, 336.48),
                          child: SvgPicture.string(
                            _svg_w87z0w,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.73, 372.22),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.73, 364.35),
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
                          offset: Offset(308.44, 371.79),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(308.44, 363.99),
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
                          offset: Offset(326.8, 371.79),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(326.8, 363.91),
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
                          offset: Offset(289.2, 363.11),
                          child: SvgPicture.string(
                            _svg_vbtq3m,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.38, 400.47),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(289.38, 392.59),
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
                          offset: Offset(308.09, 400.04),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(308.09, 392.24),
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
                          offset: Offset(326.44, 400.04),
                          child: Container(
                            width: 14.5,
                            height: 14.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(326.44, 392.16),
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
                          offset: Offset(288.85, 391.36),
                          child: SvgPicture.string(
                            _svg_9i4ra,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 272.12),
                          child: Container(
                            width: 25.4,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(383.63, 272.12),
                          child: Container(
                            width: 11.3,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 268.59),
                          child: SvgPicture.string(
                            _svg_vukdjv,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 283.42),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 283.42),
                          child: SvgPicture.string(
                            _svg_ghcd8g,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 283.42),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 283.42),
                          child: SvgPicture.string(
                            _svg_upbglh,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(149.91, 283.42),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 283.42),
                          child: SvgPicture.string(
                            _svg_ennpk1,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 324.02),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 324.02),
                          child: SvgPicture.string(
                            _svg_tsvsct,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 324.02),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 324.02),
                          child: SvgPicture.string(
                            _svg_p6bj72,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(149.91, 324.02),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 324.02),
                          child: SvgPicture.string(
                            _svg_gz3ew,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 364.27),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 364.27),
                          child: SvgPicture.string(
                            _svg_mz4wce,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 364.27),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(124.13, 364.27),
                          child: SvgPicture.string(
                            _svg_4fmfe5,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(149.91, 364.27),
                          child: Container(
                            width: 16.6,
                            height: 36.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(98.36, 271.06),
                          child: SvgPicture.string(
                            _svg_rese9d,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 310.96),
                          child: Container(
                            width: 25.4,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(383.63, 310.96),
                          child: Container(
                            width: 11.3,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 309.9),
                          child: SvgPicture.string(
                            _svg_8vzkqf,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 349.44),
                          child: Container(
                            width: 25.4,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(383.63, 349.44),
                          child: Container(
                            width: 11.3,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 349.44),
                          child: SvgPicture.string(
                            _svg_drukb1,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 387.22),
                          child: Container(
                            width: 25.4,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(383.63, 387.22),
                          child: Container(
                            width: 11.3,
                            height: 34.6,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(351.5, 387.22),
                          child: SvgPicture.string(
                            _svg_m3ayj,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(10.0, 580.0),
                    child: SizedBox(
                      width: 256.0,
                      child: Text(
                        'RESTAURANTS NEAR ME',
                        style: TextStyle(
                          fontFamily: 'Avenir Next',
                          fontSize: 17,
                          backgroundColor: const Color(0xffffffff),
                          color: const Color(0xff000000),
                          letterSpacing: 0.527,
                          fontWeight: FontWeight.w700,
                          height: 2.823529411764706,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(10.0, 440.0),
                    child: SizedBox(
                      width: 256.0,
                      child: Text(
                        'DIETS',
                        style: TextStyle(
                          fontFamily: 'Avenir Next',
                          fontSize: 17,
                          backgroundColor: const Color(0xffffffff),
                          color: const Color(0xff000000),
                          letterSpacing: 0.527,
                          fontWeight: FontWeight.w700,
                          height: 2.823529411764706,
                        ),
                      ),
                    ),
                  ),
                  //second border
                  Transform.translate(
                    offset: Offset(0, 580.5),
                    child: SizedBox(
                      width: sizingInformation.screenSize.width,
                      child: SvgPicture.string(
                        _svg_6kfvt,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],),
              //Interactive Row (Border midpoint)
              Transform.translate(
                offset: Offset(0, 90),
                child: Container(
                  width: 175.0,
                  height: 44.0,
                  alignment: Alignment.center,
                  child: Text(
                    'CHAMPAIGN-URBANA',
                    style: TextStyle(
                      fontFamily: 'Avenir Next',
                      fontSize: 10,
                      color: const Color(0xff000000),
                      letterSpacing: 0.31,
                      fontWeight: FontWeight.w700,
                      height: 4.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              new Container(height: 270.0,
                padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0), child:
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Row(
                        children: <Widget> [
                          GestureDetector(
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage('assets/images/logos with text/veganLogoText.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen(title: texts[2].title, text: texts[2].text)));
                              }
                          ),
                          GestureDetector(
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage('assets/images/logos with text/vegetarianLogoText.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen(title: texts[1].title, text: texts[1].text)));}
                          ),
                          GestureDetector(
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage('assets/images/logos with text/pescatarianLogoText.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen(title: texts[3].title, text: texts[3].text)));}
                          ),
                        ]
                    )),),
              Transform.translate(
                  offset: Offset(0.0, 31.0),
                  child:
                  Padding(child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 8,
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurantSearch.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        String nameBit;
                        if (restaurantSearch[index].name.length > 25) {
                          nameBit = restaurantSearch[index].name.substring(0,25) + '...';
                        } else {
                          nameBit = restaurantSearch[index].name;
                        }
                        return
                          Card(
                            margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                            child:
                            Container(
                                alignment: Alignment.center,
                                width: 332.0,
                                height: 109.0,
                                decoration: BoxDecoration(
                                  color: Color(0xffd3e8ce).withOpacity(0.45),
                                ),
                                child:
                                Column(children: <Widget>[
                                  Expanded(
                                      flex: 5,
                                      child: CustomListItem(name: nameBit, index: index,
                                        vegan: restaurantSearch[index].vegan, vegetarian: restaurantSearch[index].vegetarian,
                                        pescaterian: restaurantSearch[index].pescaterian,
                                        keto: restaurantSearch[index].keto,
                                        lowCarb: restaurantSearch[index].lowCarb,
                                        polloterian: restaurantSearch[index].polloterian,
                                        url: restaurantSearch[index].imageUrl,
                                        validLink: restaurantSearch[index].validLink,
                                      )
                                  )
                                ]
                                )
                            )
                          );
                          }),
                    padding:  EdgeInsets.fromLTRB(0.0, 0, 0, 100),
                  )

              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: const Color(0xffffffff),
            child: Container(
              width: 376.0,
              height: 70.0,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1.0, color: const Color(0xff000000)),
                ),),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                          child: Container()),
                      Expanded(child: FlatButton(child:Container(
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
                              context, MaterialPageRoute(builder: (
                              context) =>
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
                      ),flex: 1,)
                    ],),
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                            child: Container()),
                        Expanded(child: FlatButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                        },
                          child: Container(
                            width: 45.0,
                            height: 45.0,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset('assets/images/IdealMealLogo.png'),),
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
                            context, MaterialPageRoute(builder: (context) => Maps()));
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
}


class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.name,
    this.plantbased,
    this.vegan,
    this.vegetarian,
    this.pescaterian,
    this.polloterian,
    this.keto,
    this.lowCarb,
    this.index,
    this.url,
    this.validLink
  });

  //final Widget thumbnail;
  final String name;
  final String url;
  final dynamic plantbased;
  final dynamic vegan;
  final dynamic vegetarian;
  final dynamic pescaterian;
  final dynamic polloterian;
  final dynamic keto;
  final dynamic lowCarb;
  final int index;
  final validLink;
  

  @override
  Widget build(BuildContext context) {
    bool test = validLink;


    if (url != null) {
      if (test) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (url != null)
                Expanded(
                    flex: 1,
                    child:
                    Container(decoration: BoxDecoration(
                        color: Color(0xffd3e8ce).withOpacity(0.45)),
                      height: 65.0,
                      child: GestureDetector(
                          child:
                            Image(image: NetworkImage(url)),
                          onTap: () {
                            clickedIndex = index;
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                CoreLifeMenu1()));
                          }
                      ),)),
              Expanded(
                flex: 2,
                child: _RestaurantTile(
                  restaurant: name,
                  plantbased: plantbased,
                  vegan: vegan,
                  vegetarian: vegetarian,
                  pescaterian: pescaterian,
                  polloterian: polloterian,
                  keto: keto,
                  lowCarb: lowCarb,
                ),
              ),
            ],
          ),
        );
      } else {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child:
                FlatButton(
                    child: Text(name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir Next',
                      ),
                      textAlign: TextAlign.center,),
                    onPressed: () {
                      clickedIndex = index;
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => CoreLifeMenu1()));
                    }
                ), //thumbnail,
              ),

              Expanded(
                flex: 4,
                child: _RestaurantTile(
                  restaurant: name,
                  plantbased: plantbased,
                  vegan: vegan,
                  vegetarian: vegetarian,
                  pescaterian: pescaterian,
                  polloterian: polloterian,
                  keto: keto,
                  lowCarb: lowCarb,
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return Padding(padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child:
              FlatButton(
                  child: Text(name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir Next',
                    ),
                    textAlign: TextAlign.center,),
                  onPressed: () {
                    clickedIndex = index;
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => CoreLifeMenu1()));
                  }
              ), //thumbnail,
            ),

            Expanded(
              flex: 4,
              child: _RestaurantTile(
                restaurant: name,
                plantbased: plantbased,
                vegan: vegan,
                vegetarian: vegetarian,
                pescaterian: pescaterian,
                polloterian: polloterian,
                keto: keto,
                lowCarb: lowCarb,
              ),
            ),
          ],
        ),
      );
    }
  }
}


class _RestaurantTile extends StatelessWidget {
  const _RestaurantTile({
    Key key,
    this.restaurantkey,
    this.restaurant,
    this.plantbased,
    this.vegan,
    this.vegetarian,
    this.pescaterian,
    this.polloterian,
    this.keto,
    this.lowCarb,
  });

  final int restaurantkey;
  final String restaurant;
  final dynamic plantbased;
  final dynamic vegan;
  final dynamic vegetarian;
  final dynamic pescaterian;
  final dynamic polloterian;
  final dynamic keto;
  final dynamic lowCarb;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            restaurant,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'diet totals',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
              children: <Widget> [
                if (vegan != 0)
                  Container(
                    width: 23.0,
                   height: 22.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                       image: const AssetImage('assets/images/VeganLogo.png'),
                       fit: BoxFit.fill,
                      ),
                    ),
                  ),

                if (vegetarian != 0)
                  Container(
                  width: 23.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/VegetarianLogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (pescaterian != 0)
                  Container(
                  width: 23.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/PescaterianLogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                if (keto != 0)
                  Container(
                    width: 23.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/KetoLogo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),),
              ]
          )
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
                  children: <Widget> [
                  ]
              )
          ),
        ],
      ),
    );
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
const String _svg_6kfvt =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0.5 467.5 375.0 1.0" ><path transform="translate(0.5, 467.5)" d="M 0 0 L 375 0" fill="none" fill-opacity="0.25" stroke="#707070" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9xdj2t =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="49.5 760.5 18.0 20.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0xbfu =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
