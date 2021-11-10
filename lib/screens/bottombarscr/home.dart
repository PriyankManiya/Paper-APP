import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'For You'),
    Tab(text: 'Local'),
    Tab(text: 'Headline'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Entertainment'),
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            backgroundColor: ColorTheme.btnshade2,
            expandedHeight: 150,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            snap: false,
            centerTitle: false,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 00, left: 22),
                    width: MediaQuery.of(context).size.width / 1.2,
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTheme.white.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTheme.white.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right: 10, top: 10, bottom: 10),
                              child: Image.asset(
                                ImageProvide.seach,
                                height: 20,
                                color: ColorTheme.white,
                              ),
                            ),
                            hintText: "Search News",
                            hintStyle: TextStyle(color: ColorTheme.white),
                            fillColor: ColorTheme.textboxgrey.withOpacity(0.3),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: ColorTheme.white,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    ImageProvide.setting,
                    height: 25,
                  ),
                ],
              ),
            ),
            bottom: AppBar(
              backgroundColor: ColorTheme.btnshade2,
              flexibleSpace: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorPadding: EdgeInsets.all(0),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorColor: ColorTheme.white,
                    automaticIndicatorColorAdjustment: true,
                    tabs: myTabs,
                    controller: _tabController,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                return Container(
                  color: ColorTheme.lightgrey.withOpacity(0.4),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: Row(
                          children: [
                            Text(
                              "New York City",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                            sizedboxwidth(context, 50),
                            Image.asset(ImageProvide.pencil, height: 20),
                            Spacer(),
                            Image.asset(ImageProvide.meter, height: 20),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "69",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorTheme.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50),
                                      children: [
                                        TextSpan(
                                          text: "o",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorTheme.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  80),
                                        ),
                                        TextSpan(
                                          text: " F",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorTheme.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50),
                                        ),
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return sizedbox(context, 50);
                          },
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: MediaQuery.of(context).size.width,
                              color: ColorTheme.white,
                              child: Column(
                                children: [
                                  //top part
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
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
                                        Text("The New York Times",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60)),
                                        Spacer(),
                                        Text("FOLLOW",
                                            style: TextStyle(
                                                color: ColorTheme.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60)),
                                        sizedboxwidth(context, 20),
                                        Icon(Icons.more_vert_rounded)
                                      ],
                                    ),
                                  ),
                                  sizedbox(context, 60),
                                  //body part
                                  Image.asset(
                                    "assets/images/trash1.png",
                                    height: MediaQuery.of(context).size.height /
                                        3.8,
                                    fit: BoxFit.cover,
                                  ),
                                  sizedbox(context, 50),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            Image.asset(
                                                ImageProvide.minilocation,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    55),
                                            sizedboxwidth(context, 50),
                                            Text(
                                              "New York",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ]),
      ),
    );
  }
}
