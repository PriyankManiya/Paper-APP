import 'package:http/http.dart' as http;
import 'package:paper_app/helper/model/entertainment_news.dart';

class RemoteServices {
  static final String _entertainment = "entertainment";
  static final String _news = "news";
  static final String _market = "market";
  static final String _headline = "headline";
  static final String apikey = "b795d9ec49ad4d44959058bb2d211d6f";
  static var client = http.Client();
  //-----------------------------------------------------
  static Future<Newsdata> fetchMarketNews() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=latest&apiKey=$apikey&pageSize=10&page=1&sortBy=publishedAt'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("API SUCCESS...");
      return newsModel(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  //-----------------------------------------------------
  static Future<Newsdata> fetchEntertainmentNews() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$_entertainment&apiKey=$apikey'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("API SUCCESS...");
      return newsModel(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  //-----------------------------------------------------
  static Future<Newsdata> fetchNews() async {
    var response = await client.get(
        Uri.parse('https://newsapi.org/v2/everything?q=$_news&apiKey=$apikey'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("API SUCCESS...");
      return newsModel(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  //-----------------------------------------------------
  static Future<Newsdata> fetchHeadlineNews() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$_headline&apiKey=$apikey'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("API SUCCESS...");
      return newsModel(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
