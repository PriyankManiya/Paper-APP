import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class GetProfileService {
  static var client = http.Client();

  static Future<dynamic> getProfile({String token}) async {
    print("Access Token : $token");
    var response = await client.get(Uri.parse(StringConst.MY_PROFILE),
        headers: {"x-access-token": token});
        print("profile : ${response.body}");
    return jsonDecode(response.body);
  }
}
