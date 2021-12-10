import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class Notificationss extends StatelessWidget {
  Notificationss({Key key}) : super(key: key);
  String groupradio = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorTheme.white,
    title: Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                        color: ColorTheme.btnshade2,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: ColorTheme.btnshade2)),
      ),
      body: Container(
    child: Column(
      children: [
        Container(
          height: 95,
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: ColorTheme.white,
          child: Row(
            children: [
              Image.asset(
                ImageProvide.notification,
                color: ColorTheme.btnshade2,
                height: MediaQuery.of(context).size.height / 35,
              ),
              sizedboxwidth(context, 20),
              Text(
                "Notifications",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height / 50),
              ),
              Spacer(),
              Switch(
                activeColor: ColorTheme.green,
                activeTrackColor: ColorTheme.lightgrey,
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        sizedbox(context, 50),
        Expanded(
          child: Container(
            color: ColorTheme.white,
          ),
        )
      ],
    ),
      ),
    );
  }
}
