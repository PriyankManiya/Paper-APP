import 'package:flutter/material.dart';
import 'package:paper_app/constants/buttonstyle.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> editkey = new GlobalKey<FormState>();

  TextEditingController namecontroller;
  TextEditingController pwdcontroller;
  TextEditingController confirmcontroller;
  @override
  void initState() {
    super.initState();
    pwdcontroller = new TextEditingController();
    confirmcontroller = new TextEditingController();
    namecontroller = new TextEditingController();
  }

  @override
  void dispose() {
    pwdcontroller.dispose();
    confirmcontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: ColorTheme.btnshade2)),
                        sizedboxwidth(context, 30),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 35,
                              color: ColorTheme.btnshade2,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                sizedbox(context, 30),
                //profile pic
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/trash.png"),
                    ),
                    Positioned(
                        bottom: -10,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: ColorTheme.btnshade2,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: ColorTheme.white,
                              size: 20,
                            ),
                          ),
                        ))
                  ],
                ),
                sizedbox(context, 20),
                Form(
                  key: editkey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: namecontroller,
                          cursorColor: ColorTheme.black,
                          cursorHeight: 15,
                          validator: (value) {
                            return;
                          },
                          style: TextStyle(color: ColorTheme.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Your Name",
                            prefixIcon: Image.asset(
                              ImageProvide.user,
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
                          controller: pwdcontroller,
                          cursorColor: ColorTheme.black,
                          cursorHeight: 15,
                          validator: (value) {
                            return;
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
                            return;
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
                      sizedbox(context, 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          decoration: boxDecoration,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: ColorTheme.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
