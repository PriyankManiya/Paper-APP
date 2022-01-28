import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class GetWeatherService {
  static var client = http.Client();

  static Future<dynamic> getWeather({String lat, String lon}) async {
    
    String baseUrl = "http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=8c184a424d68b0850b435a483009dc16&units=metric";
    var response = await client.get(Uri.parse(baseUrl),);
        // print("Get Weather : ${response.body}");
    return jsonDecode(response.body);
  }
}
