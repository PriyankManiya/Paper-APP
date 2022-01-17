import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/controller/temp_controller.dart';
import 'package:paper_app/screens/bottombarscr/edit_location.dart';
import 'package:paper_app/screens/bottombarscr/home/Travel.dart';
import 'package:shimmer/shimmer.dart';
import 'home/FoodDrink.dart';
import 'home/ForYou.dart';
import 'home/HealthFitness.dart';
import 'home/LifeStyle.dart';
import 'home/Money.dart';
import 'home/Sports.dart';
import 'home/Weather.dart';
import 'home/local.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final TodayController newsController = Get.find<TodayController>();
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'For You'),
    Tab(text: 'Local'),
    Tab(text: 'Sports'),
    Tab(text: 'Weather'),
    Tab(text: 'Money'),
    Tab(text: 'Lifestyle'),
    Tab(text: 'Health & Fitness'),
    Tab(text: 'Food & Drink'),
    Tab(text: 'Travel'),
  ];
  TabController _tabController;
  TempController weatherController = Get.put(TempController());
  // Position position;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    getCurrentLatLong();
   
  }

  getCurrentLatLong() async {
// position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //  print(position);
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
        preferredSize: Size(MediaQuery.of(context).size.width, 101),
        child: Container(
          color: ColorTheme.btnshade2,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 00, left: 22),

                        width: MediaQuery.of(context).size.width / 1.2,
                        // height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorTheme.textboxgrey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TextField(
                                      cursorColor: ColorTheme.white,
                                      style: TextStyle(color: ColorTheme.white),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        hintText: "Search News",
                                        hintStyle: TextStyle(
                                          color: ColorTheme.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: ColorTheme.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageProvide.seach,
                                  height: 20,
                                  width: 20,
                                  // scale: 3.5,
                                  color: ColorTheme.white,
                                )
                              ],
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
      ),
      body: Container(
          child: Column(
        children: [
          Obx(
            () => Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(EditLocation());
                    },
                    child: Row(
                      children: [
                        weatherController.isLoading.value
                            ? SizedBox(
                                width: 70.0,
                                height: 20.0,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey.withOpacity(0.5),
                                  child: Container(
                                    width: 50.0,
                                    height: 20.0,
                                    color: Colors.white,
                                  ),
                                  // child: Text(
                                  //   '60.0',
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //     fontSize: 20.0,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ),
                              )
                            : Text(
                          "${weatherController.weather.value.name}",
                          style: TextStyle(
                              color: ColorTheme.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          ImageProvide.edit,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ImageProvide.temp,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      weatherController.isLoading.value
                          ? SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.grey.withOpacity(0.5),
                                child: Container(
                                  width: 50.0,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                // child: Text(
                                //   '60.0',
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //     fontSize: 20.0,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ),
                            )
                          : Text(
                              "${weatherController.weather.value.main.temp}°F",
                              style: TextStyle(
                                  color: ColorTheme.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ForYouScreen(topic: "NEWS"),
                LocalScreen(topic: "local"),
                SportScreen(topic: "SPORTS"),
                WeatherScreen(topic: "WEATHER"),
                MoneyScreen(
                  topic: "MONEY",
                ),
                LifeStyleScreen(
                  topic: "LIFESTYLE",
                ),
                HealthFitnessScreen(
                  topic: "HEALTH & FITNESS",
                ),
                FoodDrinkScreen(
                  topic: "FOOD & DRINK",
                ),
                TravelScreen(
                  topic: "TRAVEL",
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
