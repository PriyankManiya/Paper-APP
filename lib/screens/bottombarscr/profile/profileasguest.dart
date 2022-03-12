import 'package:flutter/material.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class ProfileAsGuest extends StatefulWidget {
  ProfileAsGuest({Key key}) : super(key: key);

  @override
  _ProfileAsGuestState createState() => _ProfileAsGuestState();
}

class _ProfileAsGuestState extends State<ProfileAsGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
    backgroundColor: ColorTheme.white,
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Profile",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 35,
                    color: ColorTheme.btnshade2,
                    fontWeight: FontWeight.bold),
              )),
        )),
      ),
      body: SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          //location and notifications
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height / 5,
            color: ColorTheme.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageProvide.minilocation,
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    sizedboxwidth(context, 20),
                    Text(
                      "Locations",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.height / 50),
                    ),
                  ],
                ),
                Divider(
                  height: MediaQuery.of(context).size.height / 15,
                  thickness: 1,
                ),
                Row(
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
                          fontSize:
                              MediaQuery.of(context).size.height / 50),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedbox(context, 40),
          // saved and history
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height / 5,
            color: ColorTheme.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageProvide.saved,
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    sizedboxwidth(context, 20),
                    Text(
                      "Locations",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.height / 50),
                    ),
                  ],
                ),
                Divider(
                  height: MediaQuery.of(context).size.height / 15,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageProvide.history,
                      color: ColorTheme.btnshade2,
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    sizedboxwidth(context, 20),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.height / 50),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedbox(context, 40),
          //sign up
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: ColorTheme.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedbox(context, 30),
                Text(
                  "Login or sign up to receive more benefits",
                  style: TextStyle(
                      color: ColorTheme.black.withOpacity(0.4),
                      fontSize: MediaQuery.of(context).size.height / 55),
                ),
                sizedbox(context, 50),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: boxDecoration,
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: ColorTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                  ),
                ),
                sizedbox(context, 50),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                          color: ColorTheme.black.withOpacity(0.4),
                          fontSize:
                              MediaQuery.of(context).size.height / 55)),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: ColorTheme.btnshade2,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height / 50)),
                ])),
                sizedbox(context, 30),
              ],
            ),
          )
        ],
      ),
    ),
      ),
    );
  }
}
