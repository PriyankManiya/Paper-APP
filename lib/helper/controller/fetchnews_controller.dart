import 'package:get/get.dart';
import 'package:paper_app/helper/model/entertainment_news.dart';
import 'package:paper_app/helper/service/remote_service.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = NewsData().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
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
