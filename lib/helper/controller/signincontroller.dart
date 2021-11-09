import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  GlobalKey<FormState> signformkey = new GlobalKey<FormState>();

  TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
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

  void checkSignUp() {
    final isValid = signformkey.currentState.validate();
    if (!isValid) {
      return;
    }
    signformkey.currentState.save();

    // Get.to(() => OnBoarding(),transition: Transition.cupertino);
    // _authcontroller.signIn(emailController.text, passwordController.text);
  }
}
