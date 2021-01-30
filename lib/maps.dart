import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idealmealv11/main.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:idealmealv11/Default Text Screen.dart';
import 'package:location/location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/DefaultMenu.dart';

class Maps extends StatefulWidget {



  @override
  Maps({Key key}) : super(key: key);
  State<StatefulWidget> createState() => _Maps();
}

class _Maps extends State<Maps> {
  GoogleMapController mapController;
  LocationData currentLocation;
  var location;
  List<Marker> _markers = [];


  @override
  void initState() {
    super.initState();

    // create an instance of Location
    location = new Location();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
    });
    // set custom marker pins
    // set the initial location
    setInitialLocation();
  }

  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: 12.0,
      target: LatLng(currentLocation.latitude,
          currentLocation.longitude),
    );
    setState(() {
      var pinPosition = LatLng(currentLocation.latitude,
          currentLocation.longitude);
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add( new Marker(
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        infoWindow: InfoWindow(title: "You are here"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    });
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

  }

  void addMarker() async  {
    for (int i = 0; i < restaurantSearch.length; i++) {
      if (restaurantSearch[i].address != null) {
        try {
          List<Address> locations = await Geocoder.local.findAddressesFromQuery(restaurantSearch[i].address);
          _markers.add(
              new Marker(
                markerId: MarkerId(restaurantSearch[i].name),
                position: LatLng(locations[0].coordinates.latitude, locations[0].coordinates.longitude),
                infoWindow: InfoWindow(
                  title: restaurantSearch[i].name,
                  snippet: '${restaurantSearch[i].address}' + '\n' + '${restaurantSearch[i]
                      .cuisine}',
                  onTap: () {
                    clickedIndex = i;
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => CoreLifeMenu1()));
                  },
                ),
              )
          );
        } catch (e) {
          print(e);
        }
      }
    }
  }


  void _onMapCreated(GoogleMapController controller) {

    addMarker();
    print(_markers.length);
  }


  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: const Text('IdealMeal',
            style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
          ),
          body:
        GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(40.1020, -88.2272),
          zoom: 12.0,
        ),
        markers: _markers.toSet(),
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


}

const String _svg_9xdj2t =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="49.5 760.5 18.0 20.0" ><path transform="translate(49.5, 765.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 760.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 770.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 775.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(49.5, 780.5)" d="M 0 0 L 18 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0xbfu =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="222.0 758.0 26.1 26.0" ><path transform="translate(219.0, 755.0)" d="M 29.14611625671387 2.999999523162842 L 2.999999523162842 13.87666606903076 L 2.999999523162842 15.29222202301025 L 12.93552494049072 19.11999893188477 L 16.77028656005859 28.99999809265137 L 18.19379806518555 28.99999809265137 L 29.14611625671387 2.999999523162842 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
