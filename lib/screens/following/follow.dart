import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/screens/newsdetail/newsdetail.dart';

class FollowDisplay extends StatefulWidget {
  FollowDisplay({Key key}) : super(key: key);

  @override
  _FollowDisplayState createState() => _FollowDisplayState();
}

class _FollowDisplayState extends State<FollowDisplay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          elevation: 0,
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorTheme.black,
                      size: 20,
                    )),
                Spacer(),
                Image.asset(
                  ImageProvide.outlineshare,
                  height: MediaQuery.of(context).size.height / 40,
                ),
                sizedboxwidth(context, 20),
                Icon(Icons.more_vert_rounded)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //user details
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: ColorTheme.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        sizedbox(context, 50),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 22,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/trash.png"),
                            ),
                            sizedboxwidth(context, 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The New York Times",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Atlanta, GA",
                                  style: TextStyle(
                                      color: ColorTheme.grey,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                ),
                              ],
                            )
                          ],
                        ),
                        sizedbox(context, 40),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //followers
                              Column(
                                children: [
                                  Text(
                                    "83K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                        color: ColorTheme.grey.withOpacity(0.8),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: ColorTheme.grey.withOpacity(0.5),
                                width: 1,
                              ),
                              //posts
                              Column(
                                children: [
                                  Text(
                                    "67.8K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                        color: ColorTheme.grey.withOpacity(0.8),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: ColorTheme.grey.withOpacity(0.5),
                                width: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "36.5M",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "posts",
                                    style: TextStyle(
                                        color: ColorTheme.grey.withOpacity(0.8),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        sizedbox(context, 60),
                        InkWell(
                          child: Container(
                            decoration: boxDecoration,
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorTheme.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                        ),
                        sizedbox(context, 60),
                        Text(
                          "The New York Times is serving Atlanta, Georgia local coverage you can count on with local news, sports and exntertainment.",
                          style: TextStyle(
                              color: ColorTheme.grey.withOpacity(0.8),
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        ),
                        sizedbox(context, 60),
                        Row(
                          children: [
                            Icon(Icons.link, color: ColorTheme.link),
                            sizedboxwidth(context, 40),
                            Text(
                              "http://www.Google.com",
                              style: TextStyle(color: ColorTheme.link),
                            )
                          ],
                        ),
                        sizedbox(context, 50),
                        Row(
                          children: [
                            Image.asset(
                              ImageProvide.cal,
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            sizedboxwidth(context, 30),
                            Text(
                              "joined since july 2001",
                              style: TextStyle(color: ColorTheme.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                sizedbox(context, 40),
                //post details

                Expanded(
                  child: Container(
                    color: ColorTheme.white,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => NewsDetails(),
                                transition: Transition.cupertino);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width,
                            color: ColorTheme.white,
                            child: Column(
                              children: [
                                //top part
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                          "assets/images/trash.png",
                                        ),
                                        maxRadius: 20,
                                        minRadius: 15,
                                      ),
                                      sizedboxwidth(context, 30),
                                      InkWell(
                                        // onTap: () {
                                        //   Get.to(() => FollowDisplay(),
                                        //       transition:
                                        //           Transition.cupertino);
                                        // },
                                        child: Text("The New York Times",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60)),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          print("Follow Part");
                                        },
                                        child: Text("FOLLOW",
                                            style: TextStyle(
                                                color: ColorTheme.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60)),
                                      ),
                                      sizedboxwidth(context, 20),
                                      Icon(Icons.more_vert_rounded)
                                    ],
                                  ),
                                ),
                                sizedbox(context, 60),
                                //body part
                                Image.asset(
                                  "assets/images/trash1.png",
                                  height:
                                      MediaQuery.of(context).size.height / 3.8,
                                  fit: BoxFit.cover,
                                ),
                                sizedbox(context, 50),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Post-election rifts emerge in Germany’scentre-right alliance",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                45),
                                      ),
                                      sizedbox(context, 60),
                                      Row(
                                        children: [
                                          Image.asset(ImageProvide.minilocation,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                          sizedboxwidth(context, 50),
                                          Text(
                                            "New York",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60),
                                          ),
                                          sizedboxwidth(context, 20),
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorTheme.btnshade2,
                                            radius: 3,
                                          ),
                                          sizedboxwidth(context, 50),
                                          Text(
                                            "1 day ago",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                sizedbox(context, 30),
                                //bottom part
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //like
                                      Image.asset(ImageProvide.like,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40),
                                      sizedboxwidth(context, 25),
                                      Text(
                                        "290",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                      Spacer(),
                                      //comment
                                      Image.asset(ImageProvide.cmt,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40),
                                      sizedboxwidth(context, 25),
                                      Text(
                                        "38",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                      Spacer(),
                                      //share
                                      Image.asset(ImageProvide.outlineshare,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40),
                                      sizedboxwidth(context, 25),
                                      Text(
                                        "22",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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
