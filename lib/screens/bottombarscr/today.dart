import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/screens/following/follow.dart';
import 'package:paper_app/screens/newsdetail/newsdetail.dart';

class Today extends StatefulWidget {
  Today({Key key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorTheme.white,
        toolbarHeight: 90,
        flexibleSpace: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            alignment: Alignment.centerLeft,
            child: Text(
              "Today News",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 35,
                  color: ColorTheme.btnshade2,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return sizedbox(context, 50);
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => NewsDetails(), transition: Transition.cupertino);
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
                            onTap: () {
                              Get.to(() => FollowDisplay(),
                                  transition: Transition.cupertino);
                            },
                            child: Text("The New York Times",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
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
                      height: MediaQuery.of(context).size.height / 3.8,
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
                                fontSize:
                                    MediaQuery.of(context).size.height / 45),
                          ),
                          sizedbox(context, 60),
                          Row(
                            children: [
                              Image.asset(ImageProvide.minilocation,
                                  height:
                                      MediaQuery.of(context).size.height / 55),
                              sizedboxwidth(context, 50),
                              Text(
                                "New York",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                              sizedboxwidth(context, 20),
                              CircleAvatar(
                                backgroundColor: ColorTheme.btnshade2,
                                radius: 3,
                              ),
                              sizedboxwidth(context, 50),
                              Text(
                                "1 day ago",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //like
                          Image.asset(ImageProvide.like,
                              height: MediaQuery.of(context).size.height / 40),
                          sizedboxwidth(context, 25),
                          Text(
                            "290",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50),
                          ),
                          Spacer(),
                          //comment
                          Image.asset(ImageProvide.cmt,
                              height: MediaQuery.of(context).size.height / 40),
                          sizedboxwidth(context, 25),
                          Text(
                            "38",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50),
                          ),
                          Spacer(),
                          //share
                          Image.asset(ImageProvide.outlineshare,
                              height: MediaQuery.of(context).size.height / 40),
                          sizedboxwidth(context, 25),
                          Text(
                            "22",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50),
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
    ));
  }
}
