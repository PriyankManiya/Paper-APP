import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/helper/model/MyProfile.dart';
import 'package:paper_app/helper/model/SignIn.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/service/get_profile_service.dart';
import 'package:paper_app/helper/service/signin_service.dart';
import 'package:paper_app/widgets/bottombar.dart';

class GetProfileController extends GetxController {
  var isLoading = true.obs;
  var myProfile = MyProfile().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onClose() {}

  Future<void> getProfile() async {
    isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var getProfileResponse = await GetProfileService.getProfile(
          token: token,
        );

        if (getProfileResponse["status"] == 200) {
          
          myProfile(MyProfile.fromJson(getProfileResponse));
          // final storage = GetStorage();
          // storage.write("token", signIn.token);
          // Get.off(Bottombar());
        } else {
          // Get.snackbar("Opps", getProfileResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
          print("${getProfileResponse["message"]}");
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
