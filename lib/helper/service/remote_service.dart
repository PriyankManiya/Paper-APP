import 'package:paper_app/helper/model/entertainment_news.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<NewsData> fetchNews() async {
    var response = await client.get(Uri.parse(
        'https://api.msn.com/MSN/Feed?ocid=sampleapp&market=en-us&query=entertainment&top=100&skip=0&select=sourceid,type,url,provider,title,images,publishedDateTime,categories&apikey=pgTCfC2akTTBabLZL1S7tnEy2GD310OTB8NZLWRdtW'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsDataFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
