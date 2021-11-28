import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/fetchnews_controller.dart';

import 'home/ForYou.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final NewsController newsController = Get.find<NewsController>();
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
    return Scaffold(
      backgroundColor: ColorTheme.lightgrey,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120),
        child: Container(
          color: ColorTheme.btnshade2,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 00, left: 22),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 60,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: TextFormField(
                            cursorColor: ColorTheme.white,
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
                              fillColor:
                                  ColorTheme.textboxgrey.withOpacity(0.3),
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
                AppBar(
                  leading: SizedBox(),
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
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ForYou(),
                ForYou(),
                ForYou(),
                ForYou(),
                ForYou(),
                ForYou(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
