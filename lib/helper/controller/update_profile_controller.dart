
import 'package:get/get.dart';
import 'package:paper_app/helper/model/MyProfile.dart';

import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/service/update_profile_service.dart';

import 'myprofile_controller.dart';


class UpdateProfileController extends GetxController {
  var isLoading = false.obs;
  var myProfile = MyProfile().obs;
  GetProfileController getProfileController = Get.find();

  @override
  void onInit() {
    super.onInit();
    // getProfile();
  }

  @override
  void onClose() {}

  Future<void> updateProfile({String fullname, String password}) async {
    isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var updateProfileResponse = await UpdateProfileService.updateProfile(
          fullname: fullname,
          password: password,
          token : token
        ); 

        if (updateProfileResponse["status"] == 200) {
          
          print("Success");
          myProfile(MyProfile.fromJson(updateProfileResponse));
          getProfileController.getProfile();
          // final storage = GetStorage();
          // storage.write("token", signIn.token);
          // Get.off(Bottombar());
        } else {
          // Get.snackbar("Opps", updateProfileResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
          print("${updateProfileResponse["message"]}");
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
