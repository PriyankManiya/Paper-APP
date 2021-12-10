import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';

class RemoteServices {
  final TodayController newsController = Get.find<TodayController>();
  static final String apikey = "b795d9ec49ad4d44959058bb2d211d6f";
  static var client = http.Client();
  static String URL =
      "https://api.msn.com/MSN/Feed?ocid=sm-simcast&market=en-us&query=entertainment&apikey=JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR&\$top=10&\$skip=0&\$select=sourceid,type,url,provider,title,images,publishedDateTime";

  static Future<Newsdata> fetchMarketNews({int page, String topic, String nextUrl}) async {
    try {
      print("************ NEXTURL $topic *********** : $nextUrl");
      var response = await client.get(Uri.parse(nextUrl != null ? nextUrl : "https://api.msn.com/MSN/Feed?ocid=sm-simcast&market=en-us&query=$topic&apikey=JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR&\$top=10&\$skip=0&\$select=sourceid,type,url,provider,title,images,publishedDateTime"));
      return Newsdata.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("***** ERROR *****");
      print(e.toString());
      //show error message
      return Newsdata.fromJson(e.response.data);
    }
  }
}
