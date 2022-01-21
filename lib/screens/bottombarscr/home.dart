import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/controller/temp_controller.dart';
import 'package:paper_app/helper/model/Country.dart';
import 'package:paper_app/screens/bottombarscr/edit_location.dart';
import 'package:paper_app/screens/bottombarscr/home/Travel.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
  final ForYouController forYouController = Get.find<ForYouController>();
  final LocalController local_controller = Get.find<LocalController>();
  final SportsController sports_controller = Get.find<SportsController>();
  final WeatherController weather_controller = Get.find<WeatherController>();
  final MoneyController money_controller = Get.find<MoneyController>();
  final LifeStyleController lifestyle_controller =
      Get.find<LifeStyleController>();
  final HealthFitnessController healt_fitness_controller =
      Get.find<HealthFitnessController>();
  final FoodDrinkController food_drink_controller =
      Get.find<FoodDrinkController>();
  final TravelController travel_controller = Get.find<TravelController>();
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
  String countryCode = "es-ar";
  String countryname = "Argentina";
  Country country = Country(name: "Argentina", code: "es-ar");
  double celsius = 0;
  GetStorage getStorage = GetStorage();

  final List<Country> countryList = <Country>[
    Country(name: "Argentina", code: "es-ar"),
    Country(name: "Australia", code: "en-au"),
    Country(name: "Austria", code: "de-at"),
    Country(name: "Belgium", code: "nl-be"),
    Country(name: "Brazil", code: "pt-br"),
    Country(name: "Canada", code: "en-ca"),
    Country(name: "Chile", code: "es-cl"),
    Country(name: "Colombia", code: "es-co"),
    Country(name: "Czech Republic", code: "cs-cz"),
    Country(name: "Denmark", code: "da-dk"),
    Country(name: "Egypt", code: "ar-eg"),
    Country(name: "Finland", code: "fi-fi"),
    Country(name: "France", code: "fr-fr"),
    Country(name: "Germany", code: "de-de"),
    Country(name: "Greece", code: "el-gr"),
    Country(name: "Hong Kong", code: "zh-hk"),
    Country(name: "Hungary", code: "hu-hu"),
    Country(name: "India", code: "en-in"),
    Country(name: "Indonesia", code: "id-id"),
    Country(name: "Ireland", code: "en-ie"),
    Country(name: "Israel", code: "he-il"),
    Country(name: "Italy", code: "it-it"),
    Country(name: "Japan", code: "ja-jp"),
    Country(name: "Korea", code: "ko-kr"),
    Country(name: "Malaysia", code: "en-my"),
    Country(name: "Mexico", code: "es-mx"),
    Country(name: "Netherlands", code: "nl-nl"),
    Country(name: "New Zealand", code: "en-nz"),
    Country(name: "Norway", code: "nb-no"),
    Country(name: "Peru", code: "es-pe"),
    Country(name: "Philippines", code: "en-ph"),
    Country(name: "Poland", code: "pl-pl"),
    Country(name: "Portugal", code: "pt-pt"),
    Country(name: "Russia", code: "ru-ru"),
    Country(name: "Saudi Arabia", code: "ar-sa"),
    Country(name: "Singapore", code: "en-sg"),
    Country(name: "Spain", code: "es-es"),
    Country(name: "Sweden", code: "sv-se"),
    Country(name: "Switzerland", code: "fr-ch"),
    Country(name: "Taiwan", code: "zh-tw"),
    Country(name: "Thailand", code: "th-th"),
    Country(name: "Turkey", code: "tr-tr"),
    Country(name: "United Arab Emirates", code: "ar-ae"),
    Country(name: "United Kingdom", code: "en-gb"),
    Country(name: "United States", code: "en-us"),
    Country(name: "Venezuela", code: "es-ve"),
    Country(name: "Vietnam", code: "vi-vn"),
  ];
  // Position position;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    getCurrentLatLong();

    setState(() {
      countryCode = getStorage.read("countrycode");
      countryname = getStorage.read("countryname");
      
      // country = Country(name: countryname, code: countryCode);
      print("Countryname ::: ${country.name} Countrycode ::: ${country.code}");
    });
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
                      Expanded(
                        child: Container(
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
                                  color:
                                      ColorTheme.textboxgrey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextField(
                                        cursorColor: ColorTheme.white,
                                        style:
                                            TextStyle(color: ColorTheme.white),
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        ImageProvide.setting,
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
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
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
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
                                    highlightColor:
                                        Colors.grey.withOpacity(0.5),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Image.asset(
                            ImageProvide.edit,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                 Expanded(
                    child: SizedBox(
                      height: 32,
                      child: Theme(
                        data: ThemeData(
                          primaryColor:ColorTheme.btnshade2,
                          primaryColorDark: ColorTheme.btnshade2,
                          primaryColorLight: ColorTheme.btnshade2,

                          textTheme: TextTheme(
                            subtitle1: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        child: DropdownSearch<Country>(
                          items: countryList,
                          // selectedItem: Country(name: countryname, code: countryCode),
                          dropdownSearchBaseStyle: TextStyle(fontSize: 12),
                          showSearchBox: true,
                          mode: Mode.DIALOG,
                          dropDownButton: SizedBox.shrink(),
                          showAsSuffixIcons: true,
                          popupSafeArea:
                              PopupSafeAreaProps(top: true, bottom: true),
                          selectedItem: countryname == null &&
                                  countryCode == null
                              ? Country(name: "Argentina", code: "es-ar")
                              : Country(name: countryname, code: countryCode),
                          showClearButton: false,

                          dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),

                          onChanged: (value) async {
                            setState(() {
                              countryname = value.name;
                              countryCode = value.code;
                            });
                            GetStorage getStorage = GetStorage();
                            getStorage.write("countrycode", value.code);
                            getStorage.write("countryname", value.name);
                            forYouController.fetchMarketnews(
                                page: 1,
                                topic: "NEWS",
                                nextUrl: null,
                                change: "0");
                            await local_controller.fetchMarketnews(
                                page: 2,
                                topic: "local",
                                nextUrl: null,
                                change: "0");
                            await sports_controller.fetchMarketnews(
                                page: 1,
                                topic: "SPORTS",
                                nextUrl: null,
                                change: "0");

                            await weather_controller.fetchMarketnews(
                                page: 1,
                                topic: "WEATHER",
                                nextUrl: null,
                                change: "0");
                            await money_controller.fetchMarketnews(
                                page: 1,
                                topic: "MONEY",
                                nextUrl: null,
                                change: "0");
                            await lifestyle_controller.fetchMarketnews(
                                page: 1,
                                topic: "LIFESTYLE",
                                nextUrl: null,
                                change: "0");
                            await healt_fitness_controller.fetchMarketnews(
                                page: 1,
                                topic: "HEALTH & FITNESS",
                                nextUrl: null,
                                change: "0");
                            await food_drink_controller.fetchMarketnews(
                                page: 1,
                                topic: "FOOD & DRINK",
                                nextUrl: null,
                                change: "0");
                            await travel_controller.fetchMarketnews(
                                page: 1,
                                topic: "TRAVEL",
                                nextUrl: null,
                                change: "0");
                            try {
                              var addresses = await Geocoder.local
                                  .findAddressesFromQuery(value.name);
                              Address first = addresses.first;
                              print("${first.coordinates.latitude}");
                              GetStorage getStorage = GetStorage();
                              getStorage.write(
                                  "clatitude", first.coordinates.latitude);
                              getStorage.write(
                                  "clongitude", first.coordinates.longitude);
                              weatherController.getWeather();
                              // addStore();
                            } catch (e) {
                              // Toast.show("Invalid Address", context, gravity: Toast.BOTTOM, duration: Toast.LENGTH_SHORT);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
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
                              "${weatherController.weather.value.main.temp} °F / ${weatherController.celsius.value.toStringAsFixed(2)} °C",
                              style: TextStyle(
                                  color: ColorTheme.black,
                                  fontSize: 14,
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
