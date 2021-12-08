import 'package:get/get.dart';
import 'package:paper_app/helper/model/news_model.dart';
import 'package:paper_app/helper/service/remote_service.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = Newsdata().obs;
  var marketList = Newsdata().obs;
  var entertainmentList = Newsdata().obs;
  var headlineList = Newsdata().obs;
  Newsdata productss;


  void fetchMarketnews({int page, String topic}) async {
    try {
      if (page == 1) {
        isLoading.value = true;
      }

      try {
        productss = await RemoteServices.fetchMarketNews(page: page, topic: topic);
            
      } catch (e) {
        print("API ERROR" + e);
      }

      if (productss != null && newsList.firstRebuild) {
        newsList.value = productss;
      } else {
        newsList.value.value[0].subCards.addAll(productss.value[0].subCards);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }
}
