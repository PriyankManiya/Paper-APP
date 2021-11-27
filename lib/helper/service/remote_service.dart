import 'package:paper_app/helper/model/entertainment_news.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static final String _entertainment = "entertainment";
  static final String _news = "news";
  static final String _market = "market";
  static final String _headline = "headline";

  static var client = http.Client();
  static Future<NewsData> fetchNews() async {
    var response = await client.get(Uri.parse(
        'https://api.msn.com/MSN/Feed?query=$_market=en-us&msnonly=true&top=10&select=sourceid,type,url,provider,title,images,publishedDateTime,categories&apikey=pgTCfC2akTTBabLZL1S7tnEy2GD310OTB8NZLWRdtW'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("API SUCCESS...");
      return newsDataFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
