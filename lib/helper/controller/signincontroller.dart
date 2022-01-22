import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:paper_app/helper/model/SignIn.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/SocialSignin.dart';
import 'package:paper_app/helper/service/signin_service.dart';
import 'package:paper_app/widgets/bottombar.dart';
import 'package:http/http.dart' as http;

// GlobalKey<FormState> signformkey =  GlobalKey<FormState>();
class SigninController extends GetxController {
  TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> signIn() async {
    isLoading(true);
    try {
      try {
        var signInResponse = await SigninService.singIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        if (signInResponse["status"] == 200) {
          SignIn signIn = SignIn.fromJson(signInResponse);
          GetStorage storage = GetStorage();
          storage.write("token", signIn.token);
          storage.write("id", signIn.data.id);
          Get.off(Bottombar());
        } else {
          Get.snackbar("Opps", signInResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${signInResponse["message"]}");
        }

        // print("Sing in success : ${signIn.token}");
      } catch (e) {
        print("API ERROR" + e);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }

  String validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty ||
        !RegExp(r"^(?=.*?[A-Za-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
            .hasMatch(value)) {
      return "Please Enter Your password";
    }
    return null;
  }

  googleSign() async {
    // GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      // GoogleSignInAccount account = await _googleSignIn.signIn();

      // print("Details ${account.id}");

      try {
          try {
           
            // final profile = jsonDecode(graphResponse.body);
            // print("Profile Details : $profile");
            // var signInResponse = await SigninService.socialSignIn(
            //     email: account.email,
            //     full_name: account.displayName,
            //     social_id: account.id,
            //     register_type: 'google',
            //     deviceToken: 'fdasfds',
            //     deviceType: Platform.isAndroid ? 'android' : 'ios');

// print("Profile Details : ${await getDeviceDetails()}");
// print("email : ${profile['email']}");
            // if (signInResponse["status"] == 200) {
            //   SocialSignin socialSignin = SocialSignin.fromJson(signInResponse);
            //   GetStorage storage = GetStorage();
            //   storage.write("token", socialSignin.token);
            //   storage.write("id", socialSignin.data.id);
            //   Get.off(Bottombar());
            // } else {
            //   Get.snackbar("Opps", signInResponse["message"],
            //       snackStyle: SnackStyle.FLOATING);
            //   print("${signInResponse["message"]}");
            // }
            // print("Sing in success : ${signIn.token}");
          } catch (e) {
            print("API ERROR" + e);
          }
          isLoading(false);
        } catch (e) {
          isLoading(false);
          print("ERROR ****** ERROR");
          print("ERROR WHILE FETCHING DATA : $e");
        }
    } catch (error) {
      print(error);
    }
  }

  facebookSignin() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print("success");
        final token = result.accessToken.token;
        try {
          try {
            final graphResponse = await http.get(Uri.parse(
                'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
            final profile = jsonDecode(graphResponse.body);
            print("Profile Details : $profile");
            var signInResponse = await SigninService.socialSignIn(
                email: profile['email'] != null ? profile['email'] : '',
                full_name: profile['name'],
                social_id: profile['id'],
                register_type: 'facebook',
                deviceToken: 'fdasfds',
                deviceType: Platform.isAndroid ? 'android' : 'ios');

// print("Profile Details : ${await getDeviceDetails()}");
// print("email : ${profile['email']}");
            if (signInResponse["status"] == 200) {
              SocialSignin socialSignin = SocialSignin.fromJson(signInResponse);
              GetStorage storage = GetStorage();
              storage.write("token", socialSignin.token);
              storage.write("id", socialSignin.data.id);
              Get.off(Bottombar());
            } else {
              Get.snackbar("Opps", signInResponse["message"],
                  snackStyle: SnackStyle.FLOATING);
              print("${signInResponse["message"]}");
            }
            // print("Sing in success : ${signIn.token}");
          } catch (e) {
            print("API ERROR" + e);
          }
          isLoading(false);
        } catch (e) {
          isLoading(false);
          print("ERROR ****** ERROR");
          print("ERROR WHILE FETCHING DATA : $e");
        }
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();
        break;
      case FacebookLoginStatus.cancelledByUser:
        // _showCancelledMessage();
        print("cancel");
        break;
      case FacebookLoginStatus.error:
        // _showErrorOnUI(result.errorMessage);
        print("error : ${result.errorMessage}");
        break;
    }
  }

  static Future<String> getDeviceDetails() async {
    String deviceName;
    String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

//if (!mounted) return;
    return identifier;
  }
}
