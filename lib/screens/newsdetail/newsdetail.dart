import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({Key key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: ColorTheme.white,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor: ColorTheme.black,
                        cursorHeight: 15,
                        validator: (value) {
                          return;
                        },
                        style: TextStyle(color: ColorTheme.white),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your Comment",
                          hintStyle: TextStyle(color: ColorTheme.black),
                          fillColor: Color(0xffEDEDED),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),
                ),
                Spacer(),
                Image.asset(ImageProvide.cmt,
                    height: MediaQuery.of(context).size.height / 30),
                Spacer(),
                Image.asset(ImageProvide.like,
                    height: MediaQuery.of(context).size.height / 30),
                Spacer(),
                Image.asset(ImageProvide.share,
                    height: MediaQuery.of(context).size.height / 25),
                Padding(padding: EdgeInsets.only(right: 5))
              ],
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorTheme.white,
            flexibleSpace: Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_ios, color: ColorTheme.black)),
                  sizedboxwidth(context, 50),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                        minVerticalPadding: 0,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        horizontalTitleGap: 0,
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage("assets/images/trash.png"),
                        ),
                        title: Text("The New York Times",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 60)),
                        subtitle: Text("83.3 K Followers",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 65))),
                  ),
                  sizedboxwidth(context, 70),
                  InkWell(
                    onTap: () {
                      print("Follow Part");
                    },
                    child: Text("FOLLOW",
                        style: TextStyle(
                            color: ColorTheme.green,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 60)),
                  ),
                  sizedboxwidth(context, 20),
                  Icon(Icons.bookmark_border_outlined),
                  sizedboxwidth(context, 20),
                  Icon(Icons.more_vert_rounded)
                ],
              ),
            ),
          ),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                  color: ColorTheme.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          Column(
                            children: [
                              sizedbox(context, 30),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Post-election rifts emerge in Germany’scentre-right alliance.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35),
                                ),
                              ),
                              sizedbox(context, 40),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Image.asset(ImageProvide.minilocation,
                                        height:
                                            MediaQuery.of(context).size.height /
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
                                      backgroundColor: ColorTheme.btnshade2,
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
                                ),
                              ),
                              sizedbox(context, 50),
                              Image.asset(
                                "assets/images/trash1.png",
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                fit: BoxFit.cover,
                              ),
                              sizedbox(context, 40),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "A leading German conservative has made a public show of congratulating the Social Democrats’ candidate on winning Sunday’s national electionin a sign of division within the centre-right alliance of outgoing chancellor Angela Merkel after it plunged to historic losses.",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                    ),
                                    sizedbox(context, 30),
                                    Text(
                                      "A leading German conservative has made a public show of congratulating the Social Democrats’ candidate on winning Sunday’s national electionin a sign of division within the centre-right alliance of outgoing chancellor Angela Merkel after it plunged to historic losses.",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
