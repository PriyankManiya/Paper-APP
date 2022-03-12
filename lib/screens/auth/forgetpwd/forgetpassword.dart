import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/signincontroller.dart';
import 'package:paper_app/screens/auth/forgetpwd/emailcode.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> forgotkey = new GlobalKey<FormState>();
  TextEditingController emailController;
  SigninController signinController = Get.put(SigninController());

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 20, top: 5),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: ColorTheme.grey,
              size: 30,
            ),
            onPressed: () {
              navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: ColorTheme.white,
      body: Form(
        key: forgotkey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedbox(context, 30),
                Image.asset(ImageProvide.paperlogo,
                    height: MediaQuery.of(context).size.height / 28),
                sizedbox(context, 15),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45),
                ),
                sizedbox(context, 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: ColorTheme.black,
                    cursorHeight: 15,
                    validator: (value) {
                      return validateEmail(value);
                    },
                    style: TextStyle(color: ColorTheme.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(ImageProvide.gmail),
                      hintText: "Emails Address",
                      fillColor: ColorTheme.textboxgrey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                sizedbox(context, 20),
                Obx(
                  ()=>signinController.forgotLoader.value ? CupertinoActivityIndicator() : InkWell(
                    onTap: () {
                      checkvalidation();
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: boxDecoration,
                      child: Text("Send",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height / 55,
                              color: ColorTheme.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void checkvalidation() {
    final isValid = forgotkey.currentState.validate();
    if (!isValid) {
      return;
    }
    forgotkey.currentState.save();
    signinController.forgotpassword(email: emailController.text.trim());
    // Get.to(() => EmailCode(), transition: Transition.cupertino);
  }
}
