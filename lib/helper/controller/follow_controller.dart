import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/Follow.dart';
import 'package:paper_app/helper/model/FollowingList.dart';
import 'package:paper_app/helper/model/Unfollow.dart';
import 'package:paper_app/helper/service/follow_service.dart';

class FollowController extends GetxController {
  var isLoading = true.obs;
  var followingList = <FollowingData>[].obs;
  Follow follows;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  @override
  void onClose() {}

  Future<void> getList() async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        var followingListResponse = await FollowService.getFOllowingList(
          token: token,
        );
        if (followingListResponse["status"] == 200) {
          FollowingList following = FollowingList.fromJson(followingListResponse);
          followingList(following.data);
        } else {
          // Get.snackbar("Opps", followingListResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
          print("${followingListResponse["message"]}");
        }
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

   Future<String> follow({String channelId, String channel_details, String channel_url, String title}) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var followResponse = await FollowService.followChannel(
          token: token,
          channelId: channelId,
          channel_details: channel_details,
          channel_url: channel_url,
          title: title
        );

        if (followResponse["status"] == 200) {
        
          
          follows = Follow.fromJson(followResponse);
          print("you have followed successfully.");
          getList();
          // followingList(follow);
          // final storage = GetStorage();
          // storage.write("token", signIn.token);
          // Get.off(Bottombar());
        } else {
          // Get.snackbar("Opps", followResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
          print("${followResponse["message"]}");
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

    return follows.data.id;
  }


   Future<void> unfollow({String id}) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var unfollowResponse = await FollowService.unfollowChannel(
          token: token,
          id: id
        );

        if (unfollowResponse["status"] == 200) {
        
          Unfollow unfollow = Unfollow.fromJson(unfollowResponse);
          print("you have unfollowed successfully.");
          getList();

        } else {
          // Get.snackbar("Opps", unfollowResponse["message"],
          //     snackStyle: SnackStyle.FLOATING);
          print("${unfollowResponse["message"]}");
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
