import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';

// value[0].subCards[0]
class RemoteServices {
  final NewsController newsController = Get.find<NewsController>();
  static final String apikey = "b795d9ec49ad4d44959058bb2d211d6f";
  static var client = http.Client();
  //-----------------------------------------------------
  static Future<Newsdata> fetchMarketNews({int page, String topic}) async {
    var response = await client.get(Uri.parse(
        'https://api.msn.com/MSN/Feed?ocid=sm-simcast&market=en-us&query=entertainment&top=10&apikey=JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR&skip=0&select=sourceid,type,url,provider,title,images,publishedDateTime'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      
      return newsModel(jsonString);
    } else {
      print("error");
      //show error message
      return null;
    }
  }
}
