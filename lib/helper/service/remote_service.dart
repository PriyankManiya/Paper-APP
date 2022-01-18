import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';

class RemoteServices {
  final TodayController newsController = Get.find<TodayController>();
  static final String apikey = "JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR";
  static final String domain = "https://api.msn.com";
  static var client = http.Client();
  static String URL =
      "$domain/MSN/Feed?ocid=sm-simcast&market=en-us&query=entertainment&apikey=$apikey&\$top=10&\$skip=0&\$select=sourceid,type,url,provider,title,images,publishedDateTime";

  static Future<Newsdata> fetchMarketNews(
      {int page, String topic, String nextUrl}) async {
    try {
      print("************ NEXTURL $topic *********** : $nextUrl");
      var response = await client.get(Uri.parse(nextUrl != null
          ? nextUrl
          : "$domain/MSN/Feed?ocid=sm-simcast&market=en-us&query=$topic&apikey=$apikey&\$top=10&\$skip=0&\$select=sourceid,type,url,provider,title,images,publishedDateTime"));
      return Newsdata.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("***** ERROR *****");
      print(e.toString());
      //show error message
      return Newsdata.fromJson(e.response.data);
    }
  }
}
