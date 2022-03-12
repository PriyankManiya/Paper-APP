import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/signincontroller.dart';
import 'package:paper_app/screens/auth/forgetpwd/createpassword.dart';

class EmailCode extends StatefulWidget {
  String email;
  EmailCode({Key key, this.email}) : super(key: key);

  @override
  _EmailCodeState createState() => _EmailCodeState();
}

class _EmailCodeState extends State<EmailCode> {
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
                sizedbox(context, 40),
                Text(
                  "Enter the code we send on your email",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 55),
                ),
                sizedbox(context, 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: TextFormField(
                    maxLength: 6,
                    controller: emailController,
                    cursorColor: ColorTheme.black,
                    cursorHeight: 15,
                    validator: (value) {
                      return validateCode(value);
                    },
                    style: TextStyle(color: ColorTheme.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Code",
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
                    ()=>signinController.otpLoader.value ? CupertinoActivityIndicator() :  InkWell(
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
                ),
                sizedbox(context, 20),
                Obx(
                  ()=> InkWell(
                    onTap: () {
                      // signinController.otp(otp: widget.email, isResend: true);
                      // Get.to(() => SignUp(), transition: Transition.cupertino);
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Didn’t get the Code?  ",
                            style: TextStyle(
                                color: ColorTheme.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                            children: <TextSpan>[
                          TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                  color: ColorTheme.btnshade1,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 55,
                                  decoration: TextDecoration.underline))
                        ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateCode(String value) {
    if (value.isEmpty || !RegExp(r"^[0-9]{6}$").hasMatch(value)) {
      return "Please Enter Your Code";
    }
    return null;
  }

  void checkvalidation() {
    final isValid = forgotkey.currentState.validate();
    if (!isValid) {
      return;
    }
    forgotkey.currentState.save();
    signinController.otp(otp: emailController.text.trim(), isResend: false);
    // Get.to(() => CreatePassword(), transition: Transition.cupertino);
  }
}
