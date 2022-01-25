import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/controller/follow_controller.dart';
import 'package:paper_app/helper/controller/likeunlike_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';
import 'package:paper_app/helper/service/remote_service.dart';
import 'package:paper_app/helper/service/search_service.dart';

class SearchNewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = Newsdata().obs;
  var localList = Newsdata().obs;
  var entertainmentList = Newsdata().obs;
  var headlineList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  fetchMarketnews({String nextUrl, String search}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");

        productss = await SearchServices.fetchMarketNews(
            nextUrl: nextUrl, search: search);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      String userid = storage.read("id");
      
      // if (productss != null && newsList.firstRebuild) {
        print("paras");
        await likeUnlikeController.getLike();
        await followController.getList();
        newsList.value = productss;
        // newsList.value.value[0].subCards.forEach((e) {
        //   print("Search List : ${e.title}");
        // });

        for (int i = 0; i < newsList.value.value[0].subCards.length; i++) {
          newsList.value.value[0].subCards[i].totallike = 0;
        }

        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
            if (followController.followingList[i].channelId ==
                newsList.value.value[0].subCards[j].provider.id) {
              if (followController.followingList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].provider.follow = true;
                newsList.value.value[0].subCards[j].provider.followid =
                    followController.followingList[i].id;
              }
            } else {}
          }
        }

        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
            if (likeUnlikeController.likeList[i].articleId ==
                newsList.value.value[0].subCards[j].id) {
              newsList.value.value[0].subCards[j].totallike++;

              if (likeUnlikeController.likeList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].like = true;
                newsList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {}
          }
        }
      // }
      isLoading(false);
      // return newsList.value.value[0].subCards;
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
