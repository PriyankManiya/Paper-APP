import 'package:get/get.dart';
import 'package:paper_app/helper/model/entertainment_news.dart';
import 'package:paper_app/helper/service/remote_service.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = Newsdata().obs;
  var marketList = Newsdata().obs;
  var entertainmentList = Newsdata().obs;
  var headlineList = Newsdata().obs;

  @override
  void onInit() {
    fetchMarketnews();
    // fetchEntertainmentNews();
    // fetchHeadlineNews();
    // fetchNews();
    super.onInit();
  }

  void fetchMarketnews({int page}) async {
    try {
      if(page==1){
        isLoading.value = true;
      }
      var productss = await RemoteServices.fetchMarketNews(page: page);
      print("NEWSLIST :: ${newsList.firstRebuild}");
      if (productss != null && newsList.firstRebuild) {
        newsList.value = productss;
      } else {
        newsList.value.articles.addAll(productss.articles);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  void fetchEntertainmentNews() async {
    try {
      isLoading(true);
      var productss = await RemoteServices.fetchEntertainmentNews();
      if (productss != null) {
        newsList.value = productss;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var productss = await RemoteServices.fetchNews();
      if (productss != null) {
        newsList.value = productss;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchHeadlineNews() async {
    try {
      isLoading(true);
      var productss = await RemoteServices.fetchNews();
      if (productss != null) {
        newsList.value = productss;
      }
    } finally {
      isLoading(false);
    }
  }
}
