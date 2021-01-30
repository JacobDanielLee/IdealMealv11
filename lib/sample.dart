Row(children:<Widget>[Column(children:<Widget>[SvgPicture.asset(
'assets/Path 89.svg',
width: 0.3,
height: 1.41,
),Row(children:<Widget>[Stack(children:<Widget>[
Container(
width: 0.25,
height: 2.6291351318359375,
color: const Color(0xff1a1818),
child:Row(children:<Widget>[SvgPicture.asset(
'assets/Path 56.svg',


),SvgPicture.asset(
'assets/Path 50.svg',


)],),
),
Container(
width: 4.67132568359375,
height: 0.25,
color: const Color(0xff1a1818),
child:Row(children:<Widget>[SvgPicture.asset(
'assets/Path 59.svg',


),SvgPicture.asset(
'assets/Path 57.svg',


)],),
),SvgPicture.asset(
'assets/Path 49.svg',
width: 0.93,
height: 1.12,
),SvgPicture.asset(
'assets/Path 52.svg',
width: 2,
height: 0.87,
),
Container(
width: 0.25,
height: 6.855926513671875,
color: const Color(0xff1a1818),

),
Container(
width: 0.25,
height: 6.40283203125,
color: const Color(0xff1a1818),

),
Container(
width: 0.25,
height: 6.2550811767578125,
color: const Color(0xff1a1818),

),
Container(
width: 5.080078125,
height: 0.25,
color: const Color(0xff1a1818),

),
Container(
width: 4.0325927734375,
height: 0.25,
color: const Color(0xff313133),

),
Container(
width: 4.2398681640625,
height: 0.25,
color: const Color(0xff1a1818),
child:Row(children:<Widget>[SvgPicture.asset(
'assets/Path 63.svg',


),SvgPicture.asset(
'assets/Path 66.svg',
width: 0.46,
height: 0.07,
),SvgPicture.asset(
'assets/Path 68.svg',
width: 0.43,
height: 0.11,
)],),
),
Container(
width: 4.87164306640625,
height: 0.15000000596046448,
color: const Color(0xff313133),
child:Row(children:<Widget>[SvgPicture.asset(
'assets/Path 75.svg',
width: 2.09,
height: 0.75,
),SvgPicture.asset(
'assets/Path 70.svg',


),Column(children:<Widget>[SvgPicture.asset(
'assets/Path 69.svg',


),SvgPicture.asset(
'assets/Path 61.svg',


),SvgPicture.asset(
'assets/Path 65.svg',


)],)],),
),SvgPicture.asset(
'assets/Path 67.svg',
width: 2.91,
height: 0.63,
),SvgPicture.asset(
'assets/Path 71.svg',
width: 0.78,
height: 1.6,
),SvgPicture.asset(
'assets/Path 72.svg',
width: 1.94,
height: 1.05,
),SvgPicture.asset(
'assets/Path 74.svg',
width: 0.65,
height: 1.43,
),SvgPicture.asset(
'assets/Path 76.svg',
width: 1.3,
height: 0.55,
),SvgPicture.asset(
'assets/Path 77.svg',
width: 1.08,
height: 0.52,
),SvgPicture.asset(
'assets/Path 79.svg',
width: 3.85,
height: 1,
),SvgPicture.asset(
'assets/Path 81.svg',
width: 0.96,
height: 1.32,
),SvgPicture.asset(
'assets/Path 82.svg',
width: 2.93,
height: 1.02,
)],),
Container(
width: 0.25,
height: 2.9351348876953125,
color: const Color(0xff1a1818),

)],),Stack(children:<Widget>[Column(children:<Widget>[
Container(
width: 2,
height: 8.014373779296875,
color: const Color(0xff1a1818),
child:Row(children:<Widget>[SvgPicture.asset(
'assets/Path 47.svg',


),SvgPicture.asset(
'assets/Path 46.svg',


)],),
),SvgPicture.asset(
'assets/Path 48.svg',
width: 5.45,
height: 0.06,
)],),SvgPicture.asset(
'assets/Path 41.svg',
width: 0.58,
height: 0.28,
),SvgPicture.asset(
'assets/Path 42.svg',
width: 1.44,
height: 0.54,
),
Container(
width: 7.16473388671875,
height: 2,
color: const Color(0xff1a1818),

)],)],),Column(children:<Widget>[SvgPicture.asset(
'assets/Path 84.svg',
width: 0.16,
height: 1.1,
),
Container(
width: 0.25,
height: 1.6264801025390625,
color: const Color(0xff1a1818),

),
Container(
width: 3,
height: 37.771392822265625,
color: const Color(0xff1a1818),

)],),Stack(children:<Widget>[
Container(
width: 2,
height: 8.200531005859375,
color: const Color(0xff1a1818),
child:SvgPicture.asset(
'assets/Path 40.svg',


),
),SvgPicture.asset(
'assets/Path 45.svg',
width: 1.42,
height: 0.59,
)],)],)

Text(
'Search',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 15,
color: Color(0xff848484),
),
),

//Circle #1
Transform.translate(
offset: Offset(19.0, 374.0),
child: Container(
width: 72.0,
height: 72.0,
child:
IconButton(icon: Image.asset('assets/images/logos with text/veganLogoText.png'),
onPressed: () {
dietName = 'Vegan';
menuSection.listLoader(context);
Navigator.push(
context, MaterialPageRoute(builder: (context) => menuSection()));
},
)
),
),
//#1
Transform.translate(
offset: Offset(48.0, 413.0),
child: SizedBox(
width: 14.0,
child: Text(
restaurantSearch[clickedIndex].vegan.toString(),
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #2
Transform.translate(
offset: Offset(85.0, 373.0),
child: Container(
width: 69.0,
height: 69.0,
child:
IconButton(icon: Image.asset('assets/images/logos with text/vegetarianLogoText.png'),
onPressed: () {
dietName = 'Vegetarian';
menuSection.listLoader(context);
Navigator.push(
context, MaterialPageRoute(builder: (context) => menuSection()));
},
)
),
),
//#2
Transform.translate(
offset: Offset(111.0, 414.0),
child: SizedBox(
width: 14.0,
child: Text(
restaurantSearch[clickedIndex].vegetarian.toString(),
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #3
Transform.translate(
offset: Offset(148.0, 372.0),
child: Container(
width: 69.0,
height: 67.0,
child:  IconButton(icon: Image.asset('assets/images/logos with text/pescatarianLogoText.png'),
onPressed: () {
dietName = 'Pescatarian';
menuSection.listLoader(context);
Navigator.push(
context, MaterialPageRoute(builder: (context) => menuSection()));
},
)
),
),
//#3
Transform.translate(
offset: Offset(177.0, 414.0),
child: SizedBox(
width: 14.0,
child: Text(
restaurantSearch[clickedIndex].pescaterian.toString(),
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #4
Transform.translate(
offset: Offset(217.0, 373.0),
child: Container(
width: 69.0,
height: 69.0,
child:  IconButton(icon: Image.asset('assets/images/logos with text/lowCarbLogoText.png'),
onPressed: () {
dietName = 'Low Carb';
menuSection.listLoader(context);
Navigator.push(
context, MaterialPageRoute(builder: (context) => menuSection()));
},
)
),
),
//#4
Transform.translate(
offset: Offset(243.0, 414.0),
child: SizedBox(
width: 14.0,
child: Text(
restaurantSearch[clickedIndex].lowCarb.toString(),
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #5
Transform.translate(
offset: Offset(285.0, 374.0),
child: Container(
width: 73.0,
height: 71.0,
child:  IconButton(icon: Image.asset('assets/images/logos with text/ketoLogoText.png'),
onPressed: () {
dietName = 'Keto';
menuSection.listLoader(context);
Navigator.push(
context, MaterialPageRoute(builder: (context) => menuSection()));
},
)
),
),
//#5
Transform.translate(
offset: Offset(313.0, 413.0),
child: SizedBox(
width: 14.0,
child: Text(
restaurantSearch[clickedIndex].keto.toString(),
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #6
Transform.translate(
offset: Offset(34.0, 465.0),
child: Container(
width: 42.0,
height: 42.0,
decoration: BoxDecoration(
borderRadius: BorderRadius.all(Radius.elliptical(21.0, 21.0)),
color: const Color(0xffffffff),
border: Border.all(width: 1.5, color: const Color(0xff000000)),
),
),
),
//#6
Transform.translate(
offset: Offset(43.0, 480.0),
child: SizedBox(
width: 22.0,
child: Text(
'Diet',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 9,
color: const Color(0xff000000),
letterSpacing: 0.279,
height: 5.333333333333333,
),
textAlign: TextAlign.center,
),
),
),
//#6
Transform.translate(
offset: Offset(48.0, 496.0),
child: SizedBox(
width: 14.0,
child: Text(
'#',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #7
Transform.translate(
offset: Offset(97.0, 464.0),
child: Container(
width: 42.0,
height: 42.0,
decoration: BoxDecoration(
borderRadius: BorderRadius.all(Radius.elliptical(21.0, 21.0)),
color: const Color(0xffffffff),
border: Border.all(width: 1.5, color: const Color(0xff000000)),
),
),
),
//#7
Transform.translate(
offset: Offset(108.0, 480.0),
child: SizedBox(
width: 22.0,
child: Text(
'Diet',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 9,
color: const Color(0xff000000),
letterSpacing: 0.279,
height: 5.333333333333333,
),
textAlign: TextAlign.center,
),
),
),
//#7
Transform.translate(
offset: Offset(110.0, 496.0),
child: SizedBox(
width: 14.0,
child: Text(
'#',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),
//Circle #8
Transform.translate(
offset: Offset(160.0, 465.0),
child: Container(
width: 42.0,
height: 42.0,
decoration: BoxDecoration(
borderRadius: BorderRadius.all(Radius.elliptical(21.0, 21.0)),
color: const Color(0xffffffff),
border: Border.all(width: 1.5, color: const Color(0xff000000)),
),
),
),
//#8
Transform.translate(
offset: Offset(173.0, 482.0),
child: SizedBox(
width: 22.0,
child: Text(
'Diet',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 9,
color: const Color(0xff000000),
letterSpacing: 0.279,
height: 5.333333333333333,
),
textAlign: TextAlign.center,
),
),
),
//#8
Transform.translate(
offset: Offset(176.0, 496.0),
child: SizedBox(
width: 14.0,
child: Text(
'#',
style: TextStyle(
fontFamily: 'Avenir Next',
fontSize: 13,
color: const Color(0xff000000),
letterSpacing: 0.403,
height: 3.6923076923076925,
),
textAlign: TextAlign.center,
),
),
),