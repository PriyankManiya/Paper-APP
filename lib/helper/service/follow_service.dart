import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paper_app/constants/string_const.dart';

class FollowService {
  static var client = http.Client();

  static Future<dynamic> getFOllowingList({String token}) async {
    var response = await client.get(Uri.parse(StringConst.FOLLOWING_LIST),
        headers: {"x-access-token": token});
    // print("profile : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> followChannel({String token, String channelId,String title,String channel_url,channel_details}) async {
    var response = await client.post(Uri.parse(StringConst.FOLLOW),
        headers: {"x-access-token": token}, body: {
          "channelId" : channelId,
          "title" : title,
          "channel_url" : channel_url,
          "channel_details":channel_details
        });
    // print("profile : ${response.body}");
    return jsonDecode(response.body);
  }

  static Future<dynamic> unfollowChannel({String token, String id}) async {
    var response = await client.get(Uri.parse(StringConst.UNFOLLOW+id),
        headers: {"x-access-token": token},);
    print("unfollow : ${response.body}");
    return jsonDecode(response.body);
  }
}
