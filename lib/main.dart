import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/screens/intro/pageview.dart';
import 'package:paper_app/widgets/bottombar.dart';

import 'helper/controller/signincontroller.dart';
import 'helper/controller/signupcontroller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorTheme.black,
      statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(SignupController());
  Get.put(SigninController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
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
      // home: Bottombar(),
      home: IntroPageview(),
    );
  }
}
