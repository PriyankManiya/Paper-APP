import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:paper_app/helper/controller/follow_controller.dart';
import 'package:paper_app/helper/controller/likeunlike_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';
import 'package:paper_app/helper/service/remote_service.dart';

class ForYouController extends GetxController {
  var isLoading = true.obs;
  var newsList = Newsdata().obs;
  var localList = Newsdata().obs;
  var entertainmentList = Newsdata().obs;
  var headlineList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");

        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      if (productss != null && newsList.firstRebuild) {
        await likeUnlikeController.getLike();
         await followController.getList();
        // print("Success");
        newsList.value = productss;
        // newsList.value.value[0].subCards.forEach((element) {
        //   element.totallike = 0;
        // });

        for (int i = 0; i < newsList.value.value[0].subCards.length; i++) {
          newsList.value.value[0].subCards[i].totallike = 0;
        }

        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                newsList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].provider.follow = true;
                newsList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }

        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (likeUnlikeController.likeList[i].articleId ==
                newsList.value.value[0].subCards[j].id) {
              newsList.value.value[0].subCards[j].totallike++;

              if (likeUnlikeController.likeList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].like = true;
                newsList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }

       
        // print("new");

      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        newsList.value = productss;
        for (int i = 0; i < newsList.value.value[0].subCards.length; i++) {
          newsList.value.value[0].subCards[i].totallike = 0;
        }

for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                newsList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].provider.follow = true;
                newsList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
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
            } else {
              // print("No Like");
            }
          }
        }
        print("new");
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        print("renew");
        newsList.value.value[0].subCards.addAll(productss.value[0].subCards);
        newsList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < newsList.value.value[0].subCards.length; i++) {
          newsList.value.value[0].subCards[i].totallike = 0;
        }

        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < newsList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                newsList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                newsList.value.value[0].subCards[j].provider.follow = true;
                newsList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
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
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class LocalController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class SportsController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class MoneyController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class LifeStyleController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class HealthFitnessController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class FoodDrinkController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class TravelController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class TodayController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());

  void fetchMarketnews(
      {int page, String topic, String nextUrl, String change}) async {
    try {
      try {
        GetStorage getStorage = GetStorage();
        String countryCode = getStorage.read("countrycode");
        productss = await RemoteServices.fetchMarketNews(
            page: page,
            topic: topic,
            nextUrl: nextUrl,
            countryCode: countryCode == null || countryCode.isEmpty
                ? "en-us"
                : countryCode);
      } catch (e) {
        print("API ERROR" + e);
      }
      GetStorage storage = GetStorage();
      // storage.write("token", signIn.token);
      String userid = storage.read("id");
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
            
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else if (change == "0") {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value = productss;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        print(" local new");
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      } else {
        await likeUnlikeController.getLike();
        await followController.getList();
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
        for (int i = 0; i < localList.value.value[0].subCards.length; i++) {
          localList.value.value[0].subCards[i].totallike = 0;
        }
        for (int i = 0; i < followController.followingList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            // newsList.value.value[0].subCards[j].totallike = 0;

            if (followController.followingList[i].channelId ==
                localList.value.value[0].subCards[j].provider.id) {
              // newsList.value.value[0].subCards[j].totallike++;

              if (followController.followingList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].provider.follow = true;
                localList.value.value[0].subCards[j].provider.followid = followController.followingList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
        for (int i = 0; i < likeUnlikeController.likeList.length; i++) {
          for (int j = 0; j < localList.value.value[0].subCards.length; j++) {
           
            if (likeUnlikeController.likeList[i].articleId ==
                localList.value.value[0].subCards[j].id) {
              localList.value.value[0].subCards[j].totallike++;
              if (likeUnlikeController.likeList[i].userData.id == userid) {
                localList.value.value[0].subCards[j].like = true;
                localList.value.value[0].subCards[j].likeid =
                    likeUnlikeController.likeList[i].id;
              }
            } else {
              // print("No Like");
            }
          }
        }
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
