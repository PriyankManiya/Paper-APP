import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/signupcontroller.dart';
import 'package:paper_app/screens/auth/signin/signin.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible = false;
  bool _isCVisible = false;
  SignupController signupcontroller = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: SafeArea(
        child: Form(
          key: signupcontroller.loginFormKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedbox(context, 10),
                  Image.asset(ImageProvide.paperlogo,
                      height: MediaQuery.of(context).size.height / 20),
                  sizedbox(context, 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: signupcontroller.namecontroller,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return signupcontroller.validateName(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(ImageProvide.user),
                        hintText: "Your Name",
                        fillColor: ColorTheme.textboxgrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  sizedbox(context, 40),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: signupcontroller.emailController,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return signupcontroller.validateEmail(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
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
                  sizedbox(context, 40),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      obscureText: !_isVisible,
                      controller: signupcontroller.passwordController,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return signupcontroller.validatePassword(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(ImageProvide.pwd),
                        hintText: "Password",
                        fillColor: ColorTheme.textboxgrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? Icon(Icons.visibility,
                                    color: Colors.grey, size: 20)
                                : Icon(Icons.visibility_off,
                                    color: Colors.grey, size: 20)),
                      ),
                    ),
                  ),
                  sizedbox(context, 45),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      obscureText: !_isCVisible,
                      controller: signupcontroller.confrimcontroller,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return signupcontroller.validatePassword(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(ImageProvide.pwd),
                        hintText: "Confirm Password",
                        fillColor: ColorTheme.textboxgrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isCVisible = !_isCVisible;
                              });
                            },
                            icon: _isCVisible
                                ? Icon(Icons.visibility,
                                    color: Colors.grey, size: 20)
                                : Icon(Icons.visibility_off,
                                    color: Colors.grey, size: 20)),
                      ),
                    ),
                  ),
                  sizedbox(context, 25),
                  InkWell(
                    onTap: () {
                      signupcontroller.checkSignUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: boxDecoration,
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 55,
                            color: ColorTheme.white),
                      ),
                    ),
                  ),
                  sizedbox(context, 25),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignIn(), transition: Transition.cupertino);
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: ColorTheme.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                            children: <TextSpan>[
                          TextSpan(
                              text: "Sign In",
                              style: TextStyle(
                                  color: ColorTheme.btnshade1,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 55,
                                  decoration: TextDecoration.underline))
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
