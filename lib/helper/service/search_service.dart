import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/model/news_model.dart';

class SearchServices {
  final TodayController newsController = Get.find<TodayController>();
  static final String apikey = "JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR";
  static final String domain = "https://api.msn.com";
  static var client = http.Client();

  static Future<Newsdata> fetchMarketNews(
      {String nextUrl, String search}) async {
    try {
      // print("************ NEXTURL $topic *********** : $nextUrl  *********** : $countryCode");
      var response = await client.get(Uri.parse(nextUrl != null
          ? nextUrl
          : "$domain/msn/feed?OCID=sm-simcast&apikey=JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR&market=pt-br&query=$search"));
          print("response : ${response.body}");
          
      return Newsdata.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("***** ERROR *****");
      print(e.toString());
      //show error message
      return Newsdata.fromJson(e.response.data);
    }
  }
}
