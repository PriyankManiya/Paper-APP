import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/Signup.dart';
import 'package:paper_app/helper/service/signup_service.dart';
import 'package:paper_app/widgets/bottombar.dart';

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

  var isLoading = false.obs;

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

  Future<void> signUp() async {
    isLoading(true);
    try {
      try {
        var signInResponse = await SignupService.singUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          full_name: namecontroller.text.trim()
        );

        if (signInResponse["status"] == 200) {
          Signup signIn = Signup.fromJson(signInResponse);
          GetStorage storage = GetStorage();
          storage.write("token", signIn.token);
          storage.write("id", signIn.data.id);
          Get.offAll(Bottombar());
        } else {
          // Get.snackbar("Opps", signInResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
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

}
