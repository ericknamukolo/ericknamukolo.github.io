import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/constants.dart';

enum NotificationType { visit, cv, fb, github, linkedIn, playStore, whatsApp }

class Notification {
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

  static Future<void> sendNotification(Enum type) async {
    var url = 'https://fcm.googleapis.com/fcm/send';

    List<String> getContent() {
      List<String> content = ['', ''];
      if (type == NotificationType.cv) {
        content[0] = 'Someone downloaded your CV';
        content[1] = 'CV';
      } else if (type == NotificationType.fb) {
        content[0] = 'Someone visited your Facebook Profile';
        content[1] = 'Facebook';
      } else if (type == NotificationType.github) {
        content[0] = 'Someone visited your Github Profile';
        content[1] = 'Github';
      } else if (type == NotificationType.linkedIn) {
        content[0] = 'Someone visited your LinkedIn Profile';
        content[1] = 'LinkedIn';
      } else if (type == NotificationType.playStore) {
        content[0] = 'Someone visited your Google PlayStore Developer Page';
        content[1] = 'Google PlayStore';
      } else if (type == NotificationType.visit) {
        content[0] = 'Someone visited your Portfolio';
        content[1] = 'New Visit';
      } else if (type == NotificationType.whatsApp) {
        content[0] = 'Someone visited your WhatsApp Account';
        content[1] = 'WhatsApp';
      }

      return content;
    }

    var ref = await adminRef.once();
    Map<String, String> headerMap = {
      'Content-Type': 'application/json',
      'Authorization': serverToken,
    };
    Map notificationMap = {
      'body': getContent()[0],
      'title': getContent()[1],
    };
    Map dataMap = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': 1,
      'type': type.name,
    };
    Map sendNotificationMap = {
      'notification': notificationMap,
      'data': dataMap,
      'priority': 'high',
      'to': ref.value['fcmToken'],
    };
    http.post(
      Uri.parse(url),
      body: json.encode(sendNotificationMap),
      headers: headerMap,
    );
  }
}
