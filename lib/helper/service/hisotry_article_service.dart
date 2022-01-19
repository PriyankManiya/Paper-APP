import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class HistoryArticleService {
  static var client = http.Client();

  static Future<dynamic> saveHistoryArticle({String token, String articleId, String categoryId, String articleDetails, String article_url}) async {
    var response = await client.post(Uri.parse(StringConst.HISTORYARITCLE),
        headers: {"x-access-token": token}, body: {
          "articleId":articleId,
          "categoryId":categoryId,
          "articleDetails":articleDetails,
          "article_url":article_url,
        });
    // print("profile : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> getHistoryArticle({String token}) async {
    var response = await client.get(Uri.parse(StringConst.GETHISTORYARITCLE),
        headers: {"x-access-token": token});
    print("Article : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> removeHistoryArticle({String token, String id}) async {
    var response = await client.get(Uri.parse(StringConst.REMOVEHISTORYARITCLE + id),
        headers: {"x-access-token": token});
    print("Article : ${response.body}");
    return jsonDecode(response.body);
  }
}
