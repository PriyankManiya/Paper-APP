import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/widgets/bottombar.dart';

import 'helper/controller/fetchnews_controller.dart';
import 'helper/controller/signincontroller.dart';
import 'helper/controller/signupcontroller.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: ColorTheme.black,
  //     statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(SignupController());
  Get.put(SigninController());
  Get.put(ForYouController());
  Get.put(LocalController());
  Get.put(SportsController());
  Get.put(WeatherController());
  Get.put(MoneyController());
  Get.put(LifeStyleController());
  Get.put(HealthFitnessController());
  Get.put(FoodDrinkController());
  Get.put(TravelController());
  Get.put(TodayController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        disabledColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: Bottombar(),
    );
  }
}
