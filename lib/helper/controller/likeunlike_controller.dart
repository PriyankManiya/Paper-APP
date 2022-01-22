import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/Like.dart';
import 'package:paper_app/helper/model/LikeList.dart';
import 'package:paper_app/helper/service/likeunlike_service.dart';

class LikeUnlikeController extends GetxController {
  var isLoading = true.obs;
  var likeList = <LikeListData>[].obs;

  @override
  void onInit() {
    super.onInit();
    // getLike();
  }

  @override
  void onClose() {}

 
   Future<String> like({String articleId}) async {
    // isLoading(true);
    Like like;
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var likeResponse = await LikeUnlikeService.like(
          token: token,
          articleId: articleId 
        );

        if (likeResponse["status"] == 200) {
        
          like = Like.fromJson(likeResponse);
          print("you have Like successfully.");
          
        } else {
          Get.snackbar("Opps", likeResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${likeResponse["message"]}");
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

    return like.data.id;
  }

   Future<void> unlike({String id}) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var likeResponse = await LikeUnlikeService.unLikeList(
          token: token,
          id: id 
        );

        if (likeResponse["status"] == 200) {
        
          Like like = Like.fromJson(likeResponse);
          print("you have UnLike successfully.");
          
        } else {
          Get.snackbar("Opps", likeResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${likeResponse["message"]}");
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

  


   Future<void> getLike() async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        
        var getlikeResponse = await LikeUnlikeService.getLikeList(
          token: token,
        );

        if (getlikeResponse["status"] == 200) {
          LikeList like = LikeList.fromJson(getlikeResponse);
          likeList(like.data);
          // print("Like get successfully.");
        } else {
          Get.snackbar("Opps", getlikeResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${getlikeResponse["message"]}");
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


  
}
