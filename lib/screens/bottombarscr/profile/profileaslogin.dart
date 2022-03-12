import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/myprofile_controller.dart';
import 'package:paper_app/screens/auth/signin/signin.dart';
import 'package:paper_app/screens/usersetting/editprofile.dart';
import 'package:paper_app/screens/usersetting/history.dart';
import 'package:paper_app/screens/usersetting/location.dart';
import 'package:paper_app/screens/usersetting/notification.dart';
import 'package:paper_app/screens/usersetting/saved.dart';

class ProfileAsLogin extends StatefulWidget {
  ProfileAsLogin({Key key}) : super(key: key);

  @override
  _ProfileAsLoginState createState() => _ProfileAsLoginState();
}

class _ProfileAsLoginState extends State<ProfileAsLogin> {
  GetProfileController controller = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
    backgroundColor: ColorTheme.white,
    title: Text(
      "My Profile",
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.height / 35,
          color: ColorTheme.btnshade2,
          fontWeight: FontWeight.bold),
    ),
      ),
      body: Obx(
    () => controller.isLoading.value
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //location and notifications
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    // height: MediaQuery.of(context).size.height / 5,
                    color: ColorTheme.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedbox(context, 30),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  MediaQuery.of(context).size.height / 20,
                              backgroundImage:
                                  AssetImage("assets/images/trash.png"),
                            ),
                            sizedboxwidth(context, 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.myProfile.value.data.fullName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .height /
                                          45),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => EditProfile(fullname : controller.myProfile.value.data.fullName),
                                        transition: Transition.cupertino);
                                  },
                                  child: Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        color: ColorTheme.btnshade2,
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .height /
                                            60),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          height: MediaQuery.of(context).size.height / 15,
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => EditLocation(),
                                transition: Transition.cupertino);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                ImageProvide.minilocation,
                                height:
                                    MediaQuery.of(context).size.height / 35,
                              ),
                              sizedboxwidth(context, 20),
                              Text(
                                "Locations",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: MediaQuery.of(context).size.height / 15,
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => Notificationss(),
                                transition: Transition.cupertino);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                ImageProvide.notification,
                                color: ColorTheme.btnshade2,
                                height:
                                    MediaQuery.of(context).size.height / 35,
                              ),
                              sizedboxwidth(context, 20),
                              Text(
                                "Notifications",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                              Spacer(),
                              Text(
                                "ON",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            45),
                              ),
                            ],
                          ),
                        ),
                        sizedbox(context, 25),
                      ],
                    ),
                  ),
                  sizedbox(context, 40),
                  // saved and history
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height / 5,
                    color: ColorTheme.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => SavedNews(),
                                transition: Transition.cupertino);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                ImageProvide.saved,
                                height:
                                    MediaQuery.of(context).size.height / 35,
                              ),
                              sizedboxwidth(context, 20),
                              Text(
                                "Saved",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: MediaQuery.of(context).size.height / 15,
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => History(),
                                transition: Transition.cupertino);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                ImageProvide.history,
                                color: ColorTheme.btnshade2,
                                height:
                                    MediaQuery.of(context).size.height / 35,
                              ),
                              sizedboxwidth(context, 20),
                              Text(
                                "History",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedbox(context, 40),
                  //sign up
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        sizedbox(context, 30),
                        InkWell(
                          onTap: (){
                            GetStorage getStorage = GetStorage();
                            getStorage.erase();
                            Get.offAll(SignInScreen());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorTheme.btnshade2)),
                            child: Center(
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                    color: ColorTheme.btnshade2,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ),
                          ),
                        ),
                        sizedbox(context, 30),
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
