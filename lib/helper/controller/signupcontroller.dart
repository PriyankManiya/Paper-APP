import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class SignupController extends GetxController {
  TextEditingController emailController,
      passwordController,
      namecontroller,
      confrimcontroller;

  var email = '';
  var password = '';
  var name = '';
  var confrim = '';
  @override
  void onInit() {
    super.onInit();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    namecontroller = new TextEditingController();
    confrimcontroller = new TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    namecontroller.dispose();
    confrimcontroller.dispose();
  }

  String validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String validateName(String value) {
    if (!GetUtils.isUsername(value)) {
      return "Provide valid Username";
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
