import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class SigninService {
  static var client = http.Client();

  static Future<dynamic> singIn({String email, String password}) async {
    
      var response = await client.post(Uri.parse(StringConst.SIGN_IN), body: {"email":email, "password": password});
      return jsonDecode(response.body);
  }

  static Future<dynamic> socialSignIn({String full_name, String email, String deviceToken,String deviceType,String social_id, String register_type}) async {
    
      var response = await client.post(Uri.parse(StringConst.SOCIAL_SIGNIN), body: {
        "full_name":full_name, 
        "email": email,
        "deviceToken":deviceToken,
        "deviceType":deviceType,
        "social_id":social_id,
        "register_type":register_type
        });
        // print("Response : ${response.body}");
      return jsonDecode(response.body);
  }
}
