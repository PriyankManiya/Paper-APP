import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/helper/model/SignIn.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/service/signin_service.dart';
import 'package:paper_app/widgets/bottombar.dart';

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
          Get.off(Bottombar());
        } else {
          Get.snackbar("Opps",signInResponse["message"], snackStyle: SnackStyle.FLOATING);
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
}
