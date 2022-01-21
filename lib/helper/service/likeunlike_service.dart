import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class LikeUnlikeService {
  static var client = http.Client();

  static Future<dynamic> like({String token, String articleId}) async {
    var response = await client.post(Uri.parse(StringConst.LIKE),
        headers: {"x-access-token": token}, body: {
          "articleId" : articleId
        });
    // print("profile : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> getLikeList({String token}) async {
    var response = await client.get(Uri.parse(StringConst.LIKELIST),
        headers: {"x-access-token": token});
    // print("profile : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> unLikeList({String token, String id}) async {
    var response = await client.get(Uri.parse(StringConst.UNLIKELIST + id),
        headers: {"x-access-token": token});
    print("Dislike : ${response.body}");
    return jsonDecode(response.body);
  }
}
