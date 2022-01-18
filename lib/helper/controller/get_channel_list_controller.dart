import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/Channel.dart';
import 'package:paper_app/helper/model/FollowingList.dart';
import 'package:paper_app/helper/service/follow_service.dart';
import 'package:paper_app/helper/service/get_channel_list_service.dart';

class GetChannelListController extends GetxController {
  var isLoading = true.obs;
  var channel = Channel().obs;
  var channelList = <SubCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    getChannelList();
  }

  @override
  void onClose() {}

  Future<void> getChannelList() async {
    isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("TOken ::: ${storage.read("token")}");
        var getChannelListResponse =
            await GetChannelListService.getChannelList();

        channel(Channel.fromJson(getChannelListResponse));
// print("successsss");
        final Map<String, SubCard> profileMap = new Map();

        channel.value.value[0].subCards.forEach((element) {
          profileMap[element.provider.id] = element;
        });

        channelList(profileMap.values.toList());

        var followingListResponse = await FollowService.getFOllowingList(
          token: token,
        );

        if (followingListResponse["status"] == 200) {
          FollowingList following =
              FollowingList.fromJson(followingListResponse);
          // followingList(following.data);

          for (int i = 0; i < channelList.length; i++) {
            for (int j = 0; j < following.data.length; j++) {
              if (channelList[i].provider.id == following.data[j].channelId) {
                // print("PPPPPPPPPPPP");
                channelList[i].isFollow = true;
                channelList[i].followingId = following.data[j].id;
                break;
              } else {
                channelList[i].isFollow = false;
              }
            }
          }

          // print("ISFOLLOW : ${channelList[0].isFollow}");
          
        } else {
          Get.snackbar("Opps", followingListResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${followingListResponse["message"]}");
        }
      } catch (e) {
        print("API ERROR" + e);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : ${e.toString()}}");
    }
  }

  // Future<void> getList() async {
  //   isLoading(true);
  //   try {
  //     try {

  //     } catch (e) {
  //       print("API ERROR" + e);
  //     }
  //     isLoading(false);
  //   } catch (e) {
  //     isLoading(false);
  //     print("ERROR ****** ERROR");
  //     print("ERROR WHILE FETCHING DATA : $e");
  //   }
  // }
}
