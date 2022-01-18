import 'dart:convert';

import 'package:http/http.dart' as http;

class GetChannelListService {
  static var client = http.Client();

  static Future<dynamic> getChannelList({String nextURL}) async {
   
    String baseUrl = 'https://api.msn.com/msn/feed?OCID=sm-simcast&apikey=JqC57c4yWyNYYn5KCzO7CGvoNo70YD0R5GPbX9hSyR&market=en-us&query=channels&\$top=30';
    var response = await client.get(Uri.parse(nextURL==null ? baseUrl : nextURL),);
        print("profile : ${response.body}");
    return jsonDecode(response.body);
  }
}
