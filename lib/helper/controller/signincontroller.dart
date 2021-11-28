import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GlobalKey<FormState> signformkey =  GlobalKey<FormState>();
class SigninController extends GetxController {
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
}
