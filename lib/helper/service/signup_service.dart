import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class SignupService {
  static var client = http.Client();

  static Future<dynamic> singUp({String email, String password, String full_name}) async {
    
      var response = await client.post(Uri.parse(StringConst.SIGN_UP), body: {"email":email, "password": password, "full_name":full_name});
      return jsonDecode(response.body);
  }
}
