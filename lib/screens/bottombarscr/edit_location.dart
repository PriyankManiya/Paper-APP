import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/helper/controller/temp_controller.dart';

class EditLocation extends StatefulWidget {
  const EditLocation({Key key}) : super(key: key);

  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _initialPosition;

  static LatLng _lastMapPosition = _initialPosition;
  List<Marker> _markers = [];
  LatLng lastPosition;
  TempController tempController = Get.find();

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

    setState(()  {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _initialPosition == null
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
                      onPressed: (){
                        GetStorage getStorage = GetStorage();
                        getStorage.write("clatitude", _markers[0].position.latitude);
                        getStorage.write("clongitude", _markers[0].position.longitude);
                        tempController.getWeather();
                        print("lat : ${_markers[0].position.latitude} long : ${_markers[0].position.longitude}");
                        Get.back();
                      },
                        child: Text(
                      "Set Location",
                      style: TextStyle(
                          color: ColorTheme.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
      ),
    );
  }
}
