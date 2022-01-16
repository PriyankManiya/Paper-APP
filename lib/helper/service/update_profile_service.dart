import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class UpdateProfileService {
  static var client = http.Client();

  static Future<dynamic> updateProfile({String fullname, String password, String token}) async {
    
      var response = await client.post(Uri.parse(StringConst.UPDATE_PROFILE), body: {"full_name":fullname, "new_password": password}, headers: {"x-access-token": token});
      return jsonDecode(response.body);
  }
}
