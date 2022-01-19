
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/helper/model/ArticleList.dart';
import 'package:paper_app/helper/model/RemoveArticle.dart';
import 'package:paper_app/helper/model/SaveArticle.dart';
import 'package:paper_app/helper/service/hisotry_article_service.dart';

class HistoryArticleController extends GetxController {
  var isLoading = true.obs;
  var savedList = <ArticleData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryArticle();
  }

  @override
  void onClose() {}

  Future<void> saveHistoryArticle({String articleDetails, String articleId, String article_url, String categoryId}) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var saveArticleResponse = await HistoryArticleService.saveHistoryArticle(
          token: token,
          articleDetails: articleDetails,
          articleId: articleId,
          article_url: article_url,
          categoryId: categoryId,
        );

        if (saveArticleResponse["status"] == 200) {
          SaveArticle saveArticle = SaveArticle.fromJson(saveArticleResponse);
          print("Article Save History Successfully");
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

  Future<void> getHistoryArticle() async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var getArticleResponse = await HistoryArticleService.getHistoryArticle(
          token: token,
        );

        if (getArticleResponse["status"] == 200) {
          ArticleList saveArticle = ArticleList.fromJson(getArticleResponse);
          savedList(saveArticle.data);
          print("Article Get Successfully");
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

  
  Future<void> removeHistoryArticle(String id) async {
    // isLoading(true);
    try {
      try {
        GetStorage storage = GetStorage();
        String token = storage.read("token");
        print("Token : $token");
        var removeArticleResponse = await HistoryArticleService.removeHistoryArticle(
          token: token,
          id: id,
        );

        if (removeArticleResponse["status"] == 200) {
          RemoveArticle removeArticle = RemoveArticle.fromJson(removeArticleResponse);
          // savedList(saveArticle.data);
          print("Article Remove Successfully");
          getHistoryArticle();
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
