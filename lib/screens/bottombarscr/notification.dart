import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color(0xffF5F5F5),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.white,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(15.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35,
                                color: ColorTheme.btnshade2,
                                fontWeight: FontWeight.bold),
                          )),
                      Icon(
                        Icons.settings_outlined,
                        color: ColorTheme.btnshade2,
                        size: MediaQuery.of(context).size.height / 23,
                      )
                      // Image.asset(ImageProvide.setting,
                      //     color: ColorTheme.btnshade2,
                      //     height: MediaQuery.of(context).size.height / 30),
                    ]),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: ColorTheme.link.withOpacity(0.2),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Mark all as read",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 50,
                        color: ColorTheme.link),
                  ),
                ),
                sizedbox(context, 40),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 40,
                          thickness: 1,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "14 Cuts in 25 Minutes: How Hong Kong Censors Movies ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45),
                                  ),
                                  sizedbox(context, 40),
                                  Text(
                                    "Khaleej Times",
                                    style: TextStyle(
                                        color:
                                            ColorTheme.black.withOpacity(0.4),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/trash2.jpg"),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
