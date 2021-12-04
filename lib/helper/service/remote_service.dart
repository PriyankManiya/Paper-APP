import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';

class RemoteServices {
  final NewsController newsController = Get.find<NewsController>();
  static final String _entertainment = "entertainment";
  static final String _news = "news";
  static final String _market = "market";
  static final String _headline = "headline";
  static final String apikey = "b795d9ec49ad4d44959058bb2d211d6f";
  static var client = http.Client();
  //-----------------------------------------------------
  static Future<Newsdata> fetchMarketNews({int page, String topic}) async {
    print(
        "URL ::  ${'https://newsapi.org/v2/everything?q=$topic&apiKey=$apikey&pageSize=10&page=$page&sortBy=publishedAt'}");
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$topic&apiKey=$apikey&pageSize=10&page=$page&sortBy=publishedAt'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsModel(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
