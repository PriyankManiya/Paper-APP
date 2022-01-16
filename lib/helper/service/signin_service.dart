import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class SigninService {
  static var client = http.Client();

  static Future<dynamic> singIn({String email, String password}) async {
    
      var response = await client.post(Uri.parse(StringConst.SIGN_IN), body: {"email":email, "password": password});
      return jsonDecode(response.body);
  }
}
