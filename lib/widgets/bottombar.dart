import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/screens/bottombarscr/following.dart';
import 'package:paper_app/screens/bottombarscr/home.dart';
import 'package:paper_app/screens/bottombarscr/notification.dart';
import 'package:paper_app/screens/bottombarscr/profile/profileasguest.dart';
import 'package:paper_app/screens/bottombarscr/profile/profileaslogin.dart';
import 'package:paper_app/screens/bottombarscr/today.dart';

// bottom bar for mobile

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar>
    with SingleTickerProviderStateMixin {
  var icons1 = ImageProvide.paper;
  var icons2 = ImageProvide.today;
  var icons3 = ImageProvide.following;
  var icons4 = ImageProvide.notification;
  var icons5 = ImageProvide.profile;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            bottomNavigationBar: SafeArea(
              child: Container(
                height: 60,
                // color: AppColor.backGroundColor,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  // padding: EdgeInsets.all(0),
                  indicatorColor: Colors.white,
                  automaticIndicatorColorAdjustment: true,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                    print('index: $_selectedIndex');
                  },
                  tabs: [
                    Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: _selectedIndex == 0
                                  ? ButtonTapped(icon: icons1)
                                  : Image.asset(
                                      icons1,
                                      color: Color(0xff4b423b).withOpacity(0.7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              38,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 80,
                                  color: _selectedIndex == 0
                                      ? ColorTheme.btnshade1
                                      : Color(0xff4b423b).withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: _selectedIndex == 1
                                  ? ButtonTapped(icon: icons2)
                                  : Image.asset(
                                      icons2,
                                      color: Color(0xff4b423b).withOpacity(0.7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              38,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Today',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 80,
                                  color: _selectedIndex == 1
                                      ? ColorTheme.btnshade1
                                      : Color(0xff4b423b).withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: _selectedIndex == 2
                                  ? ButtonTapped(icon: icons3)
                                  : Image.asset(
                                      icons3,
                                      color: Color(0xff4b423b).withOpacity(0.7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              38,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 80,
                                  color: _selectedIndex == 2
                                      ? ColorTheme.btnshade1
                                      : Color(0xff4b423b).withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: _selectedIndex == 3
                                  ? ButtonTapped(icon: icons4)
                                  : Image.asset(
                                      icons4,
                                      color: Color(0xff4b423b).withOpacity(0.7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              38,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Notification',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 80,
                                  color: _selectedIndex == 3
                                      ? ColorTheme.btnshade1
                                      : Color(0xff4b423b).withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: _selectedIndex == 4
                                  ? ButtonTapped(icon: icons5)
                                  : Image.asset(
                                      icons5,
                                      color: Color(0xff4b423b).withOpacity(0.7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              38,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 80,
                                  color: _selectedIndex == 4
                                      ? ColorTheme.btnshade1
                                      : Color(0xff4b423b).withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  new Home(),
                  new Today(),
                  new Following(),
                  new Notifications(),
                  new ProfileAsLogin()
                ]),
          ),
        ),
      ),
    );
  }
}

class ButtonTapped extends StatelessWidget {
  var icon;
  ButtonTapped({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: ColorTheme.btnshade1,
      height: MediaQuery.of(context).size.height / 38,
    );
  }
}
