import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/screens/auth/signin/signin.dart';
import 'package:paper_app/screens/intro/locationaccess.dart';
import 'package:paper_app/screens/intro/newsalert.dart';

import 'widget/indicator.dart';


class IntroPageview extends StatefulWidget {
  IntroPageview({Key key}) : super(key: key);

  @override
  _IntroPageviewState createState() => _IntroPageviewState();
}

class _IntroPageviewState extends State<IntroPageview> {
PageController introcontroller = PageController(initialPage: 0);
int indicator = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Expanded(
                child: PageView(onPageChanged: (tab) {
                  setState(() {
                    indicator = tab;
                  });
                },
                  controller: introcontroller,
                  children: <Widget>[LocationAccess(), NewsSelect()],
                ),
              ),
              // sizedbox(context, 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntroWidget().Indicator(indicator == 0 ? ColorTheme.btnshade2 : ColorTheme.lightgrey),
                  SizedBox(width: 5,),
                  IntroWidget().Indicator(indicator == 1 ? ColorTheme.btnshade2 : ColorTheme.lightgrey)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // sizedbox(context, 15),
              InkWell(
                onTap: () {
                  if (introcontroller.page.round() == 1) {
                    // introcontroller.jumpTo(1);
                    Get.to(() => SignIn(), transition: Transition.cupertino);
                  }
                  introcontroller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: boxDecoration,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Text(
                    indicator == 1 ? "Done" :"Allow",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 50,
                        color: ColorTheme.white),
                  ),
                ),
              ),
              sizedbox(context, 40),
              InkWell(
                  onTap: () {
                    Get.to(() => SignIn(), transition: Transition.cupertino);
                  },
                  child: Text("Skip")),
              sizedbox(context, 20),
            ],
          ),
        ));
  }
}
