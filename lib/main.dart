import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/screens/auth/signin/signin.dart';
import 'package:paper_app/screens/auth/signup/signup.dart';
import 'package:paper_app/widgets/bottombar.dart';

import 'helper/controller/article_controller.dart';
import 'helper/controller/fetchnews_controller.dart';
import 'helper/controller/signincontroller.dart';
import 'helper/controller/signupcontroller.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: ColorTheme.black,
  //     statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

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
  Get.put(ArticleController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);
   GetStorage storage = GetStorage();
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
      home:storage.read("token") != null ? Bottombar() : SignIn(),
      // home: SignIn(),
    );
  }
}
