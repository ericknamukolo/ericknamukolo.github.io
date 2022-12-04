import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/constants.dart';

class SendNotification {
  static Future<void> sendMessageNotification(
      {required String sender,
      required String message,
      required String userToken}) async {
    var url = 'https://fcm.googleapis.com/fcm/send';

    Map<String, String> headerMap = {
      'Content-Type': 'application/json',
      'Authorization': serverToken,
    };
    Map notificationMap = {
      'body': message,
      'title': sender,
    };
    Map dataMap = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': 1,
      'type': 'message',
    };
    Map sendNotificationMap = {
      'notification': notificationMap,
      'data': dataMap,
      'priority': 'high',
      'to': userToken,
    };
    await http.post(
      Uri.parse(url),
      body: json.encode(sendNotificationMap),
      headers: headerMap,
    );
  }
}
