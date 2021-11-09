import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorTheme.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedbox(context, 10),
              Text("Allow Location",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 30,
                  )),
              SizedBox(height: 10),
              Text("Let's find your location",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 60,
                  )),
              sizedbox(context, 10),
              Image.asset(ImageProvide.location),
            ],
          ),
        ),
      ),
    ));
  }
}
