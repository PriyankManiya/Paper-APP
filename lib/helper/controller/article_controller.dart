import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/ArticleList.dart';
import 'package:paper_app/helper/model/RemoveArticle.dart';
import 'package:paper_app/helper/model/SaveArticle.dart';
import 'package:paper_app/helper/service/article_services.dart';

class ArticleController extends GetxController {
  var isLoading = true.obs;
  var savedList = <ArticleData>[].obs;
  var isSaved = false.obs;
  var removeid = "".obs;

  @override
  void onInit() {
    super.onInit();
    getArticle();
  }

  @override
  void onClose() {}

  Future<void> saveArticle({String articleDetails, String articleId, String article_url, String categoryId}) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var saveArticleResponse = await ArticleService.saveArticle(
          token: token,
          articleDetails: articleDetails,
          articleId: articleId,
          article_url: article_url,
          categoryId: categoryId,
        );

        if (saveArticleResponse["status"] == 200) {
          SaveArticle saveArticle = SaveArticle.fromJson(saveArticleResponse);
          getArticle();
          print("Article Save Successfully");
        } else {
          Get.snackbar("Opps", saveArticleResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${saveArticleResponse["message"]}");
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

  Future<void> getArticle() async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var getArticleResponse = await ArticleService.getArticle(
          token: token,
        );

        if (getArticleResponse["status"] == 200) {
          ArticleList saveArticle = ArticleList.fromJson(getArticleResponse);
          savedList(saveArticle.data);
          
          // print("Article Save Successfully ${jsonDecode(savedList[0].articleDetails)['\$type']}");
        } else {
          Get.snackbar("Opps", getArticleResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${getArticleResponse["message"]}");
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
  
  checkSavedStatus (String id){
    // isSaved  
    for (int i = 0; i < savedList.length; i++){
      if (id == savedList[i].articleId){
        isSaved(true);
        removeid.value = savedList[i].id;
        print("asdf");
        break;
      } else {
         isSaved(false);;
      }
    }
    // savedList.forEach((element) {
    //   if (id == element.articleId){
    //     isSaved(true);
    //     removeid.value = element.id;
    //     print("asdf");
    //   }
    // });

    print("saved List ${savedList}");
  }

  
  Future<void> removeArticle(String id) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var removeArticleResponse = await ArticleService.removeArticle(
          token: token,
          id: id,
        );

        if (removeArticleResponse["status"] == 200) {
          RemoveArticle removeArticle = RemoveArticle.fromJson(removeArticleResponse);
          // savedList(saveArticle.data);
          print("Article Remove Successfully");
          getArticle();
        } else {
          Get.snackbar("Opps", removeArticleResponse["message"],
              snackStyle: SnackStyle.FLOATING);
          print("${removeArticleResponse["message"]}");
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
