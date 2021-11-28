import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class Following extends StatefulWidget {
  Following({Key key}) : super(key: key);

  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Following'),
    Tab(text: 'Discover'),
  ];

  final List<Tab> myTabs1 = <Tab>[
    Tab(text: 'Local'),
    Tab(text: 'Trending'),
    Tab(text: 'Featured'),
    Tab(text: 'Life Style'),
  ];
  TabController _tabController;
  TabController _tabController1;
  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(vsync: this, length: myTabs1.length);
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 50),
                        automaticIndicatorColorAdjustment: true,
                        isScrollable: true,
                        controller: _tabController,
                        tabs: myTabs,
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        indicatorColor: ColorTheme.btnshade2,
                        labelColor: ColorTheme.btnshade2,
                        unselectedLabelColor:
                            ColorTheme.btnshade2.withOpacity(0.5)),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        ImageProvide.seach,
                        height: MediaQuery.of(context).size.height / 30,
                        color: ColorTheme.btnshade2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(controller: _tabController, children: [
          //tab1
          ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return sizedbox(context, 50);
            },
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                // onTap: () {
                //   Get.to(() => NewsDetails(), transition: Transition.cupertino);
                // },
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
                              //       transition: Transition.cupertino);
                              // },
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
                                    height: MediaQuery.of(context).size.height /
                                        55),
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
                                height:
                                    MediaQuery.of(context).size.height / 40),
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
                                height:
                                    MediaQuery.of(context).size.height / 40),
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
                                height:
                                    MediaQuery.of(context).size.height / 40),
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
          //tab2
          Container(
            child: Column(
              children: [
                sizedbox(context, 40),
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 50),
                    automaticIndicatorColorAdjustment: true,
                    isScrollable: true,
                    controller: _tabController1,
                    tabs: myTabs1,
                    padding: EdgeInsets.all(0),
                    indicatorWeight: 0,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // labelPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: ColorTheme.btnshade2,
                    unselectedLabelColor: ColorTheme.grey.withOpacity(0.5)),
                sizedbox(context, 30),
                Expanded(
                  child: TabBarView(
                      controller: _tabController1,
                      children: myTabs1.map((Tab tab) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 40,
                                      thickness: 1.5,
                                    );
                                  },
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/images/trash.png"),
                                        ),
                                        sizedboxwidth(context, 30),
                                        Text(
                                          "The New York Times",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            print("Follow Part");
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: ColorTheme.green),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              children: [
                                                Text("FOLLOW",
                                                    style: TextStyle(
                                                        color: ColorTheme.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            70)),
                                                Icon(
                                                  Icons.add,
                                                  color: ColorTheme.green,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList()),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
