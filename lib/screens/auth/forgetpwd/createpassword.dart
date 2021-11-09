import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class CreatePassword extends StatefulWidget {
  CreatePassword({Key key}) : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final GlobalKey<FormState> forgotkey = new GlobalKey<FormState>();
  TextEditingController pwdcontroller;
  TextEditingController confirmcontroller;
  @override
  void initState() {
    super.initState();
    pwdcontroller = new TextEditingController();
    confirmcontroller = new TextEditingController();
  }

  @override
  void dispose() {
    pwdcontroller.dispose();
    confirmcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    "New Password",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 45),
                  ),
                  sizedbox(context, 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: pwdcontroller,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return validatepass1(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Image.asset(
                          ImageProvide.pwd,
                        ),
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
                      controller: confirmcontroller,
                      cursorColor: ColorTheme.black,
                      cursorHeight: 15,
                      validator: (value) {
                        return validatepass2(value);
                      },
                      style: TextStyle(color: ColorTheme.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Image.asset(
                          ImageProvide.pwd,
                        ),
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
                  InkWell(
                    onTap: () {
                      checkvalidation();
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: boxDecoration,
                      child: Text("Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height / 55,
                              color: ColorTheme.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validatepass1(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Password required";
    }
    return null;
  }

  String validatepass2(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Password required";
    }
    return null;
  }

  void checkvalidation() {
    final isValid = forgotkey.currentState.validate();
    if (!isValid) {
      return;
    }
    forgotkey.currentState.save();
    // Get.to(() => OnBoarding(), transition: Transition.cupertino);
  }
}
