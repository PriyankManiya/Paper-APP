import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/database/db_helper.dart';
import 'package:paper_app/helper/model/location_model.dart';
import 'package:http/http.dart' as http;

class AddLocation extends StatefulWidget {
  const AddLocation({Key key}) : super(key: key);

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _initialPosition;

  static LatLng _lastMapPosition = _initialPosition;
  List<Marker> _markers = [];
  LatLng lastPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserLocation();
    print("Location");
  }

  void _getUserLocation() async {
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
    LatLng lll = LatLng(21.170240, 72.831062);
    lastPosition = lll;

    // final Uint8List markerIcon = await getBytes FromAsset(ImageConst.MARKPIN, 50);
    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId(lll.toString()),
        position: lll,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        )));
  }

  _handleTap(LatLng point) async {
    // final Uint8List markerIcon = await getBytesFromAsset(ImageConst.MARKPIN, 50);

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    // List<Placemark> placemarks = await placemarkFromCoordinates(point.latitude, point.longitude);
    // print("Address::::${placemarks[0]}");
  }

  getUserLocation() async {
    //call this async method from whereever you need

    // LocationData myLocation;
    String error;
    // Location location = new Location();
    // try {
    // myLocation = await location.getLocation();
    // } on PlatformException catch (e) {
    //   if (e.code == 'PERMISSION_DENIED') {
    //     error = 'please grant permission';
    //     print(error);
    //   }
    //   if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
    //     error = 'permission denied- please enable it from app settings';
    //     print(error);
    //   }
    //   myLocation = null;
    // }
    // currentLocation = myLocation;

    // return first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _initialPosition == null
              ? Center(child: CupertinoActivityIndicator())
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      markers: Set<Marker>.of(_markers),
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 14.4746,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onTap: (argument) {
                        _handleTap(argument);
                        setState(() {
                          lastPosition = argument;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment(0, .9),
                      child: MaterialButton(
                        color: ColorTheme.btnshade1,
                        onPressed: () async {
                          // GetStorage getStorage = GetStorage();
                          // getStorage.write("clatitude", _markers[0].position.latitude);
                          // getStorage.write("clongitude", _markers[0].position.longitude);
                          // tempController.getWeather();
                          // print("lat : ${_markers[0].position.latitude} long : ${_markers[0].position.longitude}");
                          // Get.back();
                          final coordinates = new Coordinates(
                              _markers[0].position.latitude,
                              _markers[0].position.longitude);
                          var addresses = await Geocoder.local
                              .findAddressesFromCoordinates(coordinates);
                          // print("Adresss:::${_markers[0].position.latitude}");
                          var first = addresses.first;
                          print("Address:::::::${first.addressLine}");
                          LocationModel employee = LocationModel(
                              address: first.addressLine,
                              postcode: first.postalCode);
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertEmployee(employee);
                          Get.back();
                          print(
                              "AddressList:::${await dbHelper.getEmployees()}");
                        },
                        child: Text(
                          "Set Location",
                          style: TextStyle(
                              color: ColorTheme.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
          /* PlacesAutocompleteField(
            apiKey: "AIzaSyDKCJPi6Jo_8lPM78Vzcq-hrHf-1tf5fkg",
            mode: Mode.overlay,

          )*/
          TextField(
            onChanged: (value) async {
              var googlePlace = GooglePlace("AIzaSyDKCJPi6Jo_8lPM78Vzcq-hrHf-1tf5fkg");
              var result = await googlePlace.search.getTextSearchJson("restaurants in Sydney",).then((value) {
                print("Search::::${value}");
              }).catchError((onError){
                print("Error::::::$onError");
              });

            },
            decoration: InputDecoration(
              hintText: "Seek your location here",
              focusColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(Icons.map),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
