import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/signincontroller.dart';
import 'package:paper_app/screens/auth/forgetpwd/forgetpassword.dart';
import 'package:paper_app/screens/auth/signup/signup.dart';
import 'package:paper_app/widgets/bottombar.dart';



class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> signformkey = new GlobalKey<FormState>();
  bool _isVisible = false;
  final SigninController controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: SafeArea(
        child: Form(
          key: signformkey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedbox(context, 10),
                  Image.asset(ImageProvide.paperlogo,
                      height: MediaQuery.of(context).size.height / 20),
                  sizedbox(context, 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: controller.emailController,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return controller.validateEmail(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(ImageProvide.gmail),
                        hintText: "Email Address",
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
                      controller: controller.passwordController,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return controller.validatePassword(value);
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
                  InkWell(
                    onTap: () {
                      Get.to(() => ForgetPassword(),
                          transition: Transition.cupertino);
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: ColorTheme.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 55),
                      ),
                    ),
                  ),
                  sizedbox(context, 15),
                  InkWell(
                    onTap: () {
                     checkSignIn();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: boxDecoration,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 55,
                            color: ColorTheme.white),
                      ),
                    ),
                  ),
                  sizedbox(context, 20),
                  InkWell(
                    onTap: () {
                      // Get.to(() => SignUp(),
                          // transition: Transition.cupertino,
                          // binding: SignUpBind());
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => SignUp()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: ColorTheme.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                            children: <TextSpan>[
                          TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  color: ColorTheme.btnshade1,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 55,
                                  decoration: TextDecoration.underline))
                        ])),
                  ),
                  sizedbox(context, 20),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorTheme.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageProvide.google,
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Continue with Google",
                            style: TextStyle(
                                color: ColorTheme.grey,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                          ),
                        ],
                      )),
                  sizedbox(context, 40),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorTheme.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageProvide.fb,
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Continue with Facebook",
                            style: TextStyle(
                                color: ColorTheme.grey,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
    void checkSignIn() {
    final isValid = signformkey.currentState.validate();
    if (!isValid) {
      return;
    }
    signformkey.currentState.save();

    Get.off(() => Bottombar(), transition: Transition.cupertino);
    // _authcontroller.signIn(emailController.text, passwordController.text);
  }
}
